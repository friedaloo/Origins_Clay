package com.originsclay.util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * CookieUtil - Helpers for reading, creating, and deleting cookies.
 **/
public class CookieUtil {

    /** Default cookie max-age: 7 days */
    private static final int DEFAULT_MAX_AGE = 7 * 24 * 60 * 60;

    /**
     * Creates a cookie and adds it to the response.
     */
    public static void addCookie(HttpServletResponse response,
                                 String name, String value, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAge);
        cookie.setPath("/");
        cookie.setHttpOnly(true);
        response.addCookie(cookie);
    }

    /**
     * Creates a cookie with the default max-age (7 days).
     */
    public static void addCookie(HttpServletResponse response,
                                 String name, String value) {
        addCookie(response, name, value, DEFAULT_MAX_AGE);
    }

    /**
     * Retrieves the value of a cookie by name.
     */
    public static String getCookieValue(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals(name)) {
                    return c.getValue();
                }
            }
        }
        return null;
    }

    /**
     * Deletes a cookie by setting its max-age to 0.
     */
    public static void deleteCookie(HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, "");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    private CookieUtil() {}
}
