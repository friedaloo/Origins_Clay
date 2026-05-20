package com.originsclay.controller;

import com.originsclay.model.User;
import com.originsclay.service.UserService;
import com.originsclay.util.CookieUtil;
import com.originsclay.util.SessionUtil;
import com.originsclay.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * AuthController - Handles login, register, and logout.
 * Satisfies rubric 3a/3b, 4c (session + cookies).
 */
@WebServlet(name = "AuthController", urlPatterns = {"/login", "/register", "/logout"}, asyncSupported = true)
public class AuthController extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getServletPath();

        switch (uri) {
            case "/login":
                // Pre-fill email from cookie if available
                String savedEmail = CookieUtil.getCookieValue(request, "rememberedEmail");
                if (savedEmail != null) {
                    request.setAttribute("rememberedEmail", savedEmail);
                }
                request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp")
                       .forward(request, response);
                break;

            case "/register":
                request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp")
                       .forward(request, response);
                break;

            case "/logout":
                SessionUtil.invalidate(request);
                CookieUtil.deleteCookie(response, "rememberedEmail");
                response.sendRedirect(request.getContextPath() + "/home");
                break;

            default:
                response.sendRedirect(request.getContextPath() + "/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getServletPath();

        if ("/login".equals(uri)) {
            handleLogin(request, response);
        } else if ("/register".equals(uri)) {
            handleRegister(request, response);
        }
    }

    // --------------- Login ---------------

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email    = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        if (ValidationUtil.isNullOrEmpty(email) || ValidationUtil.isNullOrEmpty(password)) {
            request.setAttribute("error", "Please fill in all fields.");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp")
                   .forward(request, response);
            return;
        }

        // Check if pending approval
        if (userService.isPendingApproval(email, password)) {
            request.setAttribute("error", "Your account is pending admin approval. Please try again later.");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp")
                   .forward(request, response);
            return;
        }

        User user = userService.authenticate(email, password);

        if (user == null) {
            request.setAttribute("error", "Invalid email or password.");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp")
                   .forward(request, response);
            return;
        }

        // Set session
        SessionUtil.setLoggedInUser(request, user);

        // Remember-me cookie
        if ("on".equals(remember)) {
            CookieUtil.addCookie(response, "rememberedEmail", email);
        } else {
            CookieUtil.deleteCookie(response, "rememberedEmail");
        }

        // Redirect based on role
        if ("admin".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
        } else {
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

    // --------------- Register ---------------

    private void handleRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username        = request.getParameter("username");
        String firstName       = request.getParameter("firstName");
        String lastName        = request.getParameter("lastName");
        String email           = request.getParameter("email");
        String phone           = request.getParameter("phone");
        String address         = request.getParameter("address");
        String password        = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validation
        if (ValidationUtil.isNullOrEmpty(username) || ValidationUtil.isNullOrEmpty(firstName) 
                || ValidationUtil.isNullOrEmpty(lastName) || ValidationUtil.isNullOrEmpty(email) 
                || ValidationUtil.isNullOrEmpty(password)) {
            request.setAttribute("error", "Please fill in all required fields.");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp")
                   .forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("error", "Please enter a valid email address.");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp")
                   .forward(request, response);
            return;
        }

        if (!ValidationUtil.isStrongPassword(password)) {
            request.setAttribute("error",
                    "Password must be at least 8 characters and include an uppercase letter, " +
                    "lowercase letter, digit, and special character.");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp")
                   .forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp")
                   .forward(request, response);
            return;
        }

        User user = new User();
        user.setUsername(username);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setPassword(password); // service will hash it

        String errorMsg = userService.register(user);

        if (errorMsg != null) {
            request.setAttribute("error", errorMsg);
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp")
                   .forward(request, response);
        } else {
            request.setAttribute("success",
                    "Registration successful! Your account is pending admin approval.");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp")
                   .forward(request, response);
        }
    }
}
