package rs.raf.hackathon.web;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rs.raf.hackathon.model.Team;
import rs.raf.hackathon.model.TeamMember;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "submitApplication", value = "/submit-application")
public class SubmitApplicationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        if (Session.submitted(request)) {
            response.sendRedirect(request.getContextPath() + "/thank-you.jsp");
            return;
        }

        Team team = Session.team(request);
        if (team == null) {
            response.sendRedirect(request.getContextPath() + "/register.jsp");
            return;
        }

        Team complete;
        try {
            complete = team.withMembers(readMembers(request, team.getSize()));
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
            return;
        }

        AppContext.store(getServletContext()).save(complete);

        Session.setTeam(request, complete);
        Session.markSubmitted(request);
        response.sendRedirect(request.getContextPath() + "/thank-you.jsp");
    }

    private static List<TeamMember> readMembers(HttpServletRequest request, int size) {
        List<TeamMember> members = new ArrayList<>(size);
        for (int i = 1; i <= size; i++) {
            members.add(new TeamMember(
                    request.getParameter("member-first-name-" + i),
                    request.getParameter("member-last-name-" + i),
                    request.getParameter("member-email-" + i),
                    request.getParameter("member-role-" + i),
                    request.getParameter("member-linkedin-" + i)));
        }
        return members;
    }
}
