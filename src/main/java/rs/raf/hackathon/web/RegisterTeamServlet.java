package rs.raf.hackathon.web;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rs.raf.hackathon.model.Team;

import java.io.IOException;

@WebServlet(name = "registerTeam", value = "/register-team")
public class RegisterTeamServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        if (Session.submitted(request) || Session.team(request) != null) {
            response.sendRedirect(request.getContextPath() + "/members.jsp");
            return;
        }

        Team team;
        try {
            team = new Team(
                    request.getParameter("teamName"),
                    request.getParameter("contactEmail"),
                    request.getParameter("contactPhone"),
                    request.getParameter("motto"),
                    request.getParameter("referral"),
                    Team.parseSize(request.getParameter("teamSize")));
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
            return;
        }

        Session.setTeam(request, team);
        response.sendRedirect(request.getContextPath() + "/members.jsp");
    }
}
