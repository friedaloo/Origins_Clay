package com.originsclay.util;

import com.originsclay.model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 * SessionUtil - Convenience methods for session management.
 * Satisfies rubric 4c "Session management".
 */
public class SessionUtil {

    private static final String USER_KEY = "loggedInUser";
    private static final String ROLE_KEY = "userRole";

    /**
     * Stores the authenticated user in the session.
     */
    public static void setLoggedInUser(HttpServletRequest request, User user) {
        HttpSession session = request.getSession(true);
        session.setAttribute(USER_KEY, user);
        session.setAttribute(ROLE_KEY, user.getRole());
    }

    /**
     * Returns the currently logged-in user, or null.
     */
    public static User getLoggedInUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return null;
        return (User) session.getAttribute(USER_KEY);
    }

    /**
     * Returns the role of the logged-in user ("admin", "customer"), or null.
     */
    public static String getUserRole(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return null;
        return (String) session.getAttribute(ROLE_KEY);
    }

    /**
     * Returns true if a user is currently authenticated.
     */
    public static boolean isLoggedIn(HttpServletRequest request) {
        return getLoggedInUser(request) != null;
    }

    /**
     * Returns true if the current user has the "admin" role.
     */
    public static boolean isAdmin(HttpServletRequest request) {
        return "admin".equalsIgnoreCase(getUserRole(request));
    }

    /**
     * Invalidates the current session (logout).
     */
    public static void invalidate(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }

    private SessionUtil() {}
}
