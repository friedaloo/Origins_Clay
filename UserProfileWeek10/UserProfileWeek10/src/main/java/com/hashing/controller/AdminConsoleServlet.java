package com.hashing.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * AdminConsoleServlet serves the admin panel page.
 * Only accessible to users with 'admin' username.
 */
@WebServlet("/admin/console")
public class AdminConsoleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * GET request - Display admin console page
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Forward to admin_accounts.jsp
        request.getRequestDispatcher("/WEB-INF/pages/admin_accounts.jsp")
            .forward(request, response);
    }

    /**
     * POST request - not allowed on admin console
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
