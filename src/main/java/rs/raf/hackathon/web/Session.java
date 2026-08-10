package rs.raf.hackathon.web;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import rs.raf.hackathon.model.Team;

public final class Session {

    private static final String TEAM = "team";
    private static final String SUBMITTED = "submitted";

    private Session() {
    }

    public static Team team(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session == null ? null : (Team) session.getAttribute(TEAM);
    }

    public static void setTeam(HttpServletRequest request, Team team) {
        request.getSession().setAttribute(TEAM, team);
    }

    public static boolean submitted(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && Boolean.TRUE.equals(session.getAttribute(SUBMITTED));
    }

    public static void markSubmitted(HttpServletRequest request) {
        request.getSession().setAttribute(SUBMITTED, Boolean.TRUE);
    }
}
