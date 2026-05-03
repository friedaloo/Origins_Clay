package com.hashing.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.hashing.model.StudentModel;
import com.hashing.service.LoginService;
import com.hashing.utils.SessionUtil;
import com.hashing.utils.CookieUtil;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private LoginService loginService = new LoginService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // validation
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            req.setAttribute("error", "Username and Password are required");
            req.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(req, resp);
            return;
        }

        StudentModel student = new StudentModel();
        student.setUserName(username.trim());
        student.setPassword(password.trim());

        Boolean status = loginService.loginUser(student);

        // status = true (success), false (invalid credentials), null (error)
        if (Boolean.TRUE.equals(status)) {

            // SESSION
            SessionUtil.setAttribute(req, "username", username);

            // cookie and redirection
            if ("admin".equalsIgnoreCase(username)) {
                CookieUtil.addCookie(resp, "role", "admin", 60 * 60);
                resp.sendRedirect(req.getContextPath() + "/dashboard");
            } else {
                CookieUtil.addCookie(resp, "role", "student", 60 * 60);
                resp.sendRedirect(req.getContextPath() + "/home");
            }

        } else if (Boolean.FALSE.equals(status)) {
            // Invalid credentials OR account is soft-deleted/inactive
            req.setAttribute("error", "Invalid username or password. Account may be inactive.");
            req.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(req, resp);
        } else {
            // Null - database error
            req.setAttribute("error", "System error. Please try again later.");
            req.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(req, resp);
        }
    }
}