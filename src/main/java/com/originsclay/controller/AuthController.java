package com.originsclay.controller;

import com.originsclay.model.User;
import com.originsclay.service.UserService;
import com.originsclay.util.CookieUtil;
import com.originsclay.util.SessionUtil;
import com.originsclay.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig; 
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part; 

import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "AuthController", asyncSupported = true, urlPatterns = {"/login", "/register", "/logout"})
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 5,      // Max file size: 5MB
    maxRequestSize = 1024 * 1024 * 10   // Max request total: 10MB
)
public class AuthController extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getServletPath();

        switch (uri) {
            case "/login":
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
System.out.printf(email,password,remember);
        if (ValidationUtil.isNullOrEmpty(email)) {
            request.setAttribute("error", "EMAIL parameter is empty!");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
            return;
        }

        if (ValidationUtil.isNullOrEmpty(password)) {
            request.setAttribute("error", "PASSWORD parameter is empty!");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
            return;
        }

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

        if (!user.isstatus()) {
            request.setAttribute("error", "Your account is not activated.");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp")
                   .forward(request, response);
            return;
        }
        
        SessionUtil.setLoggedInUser(request, user);

        if ("on".equals(remember)) {
            CookieUtil.addCookie(response, "rememberedEmail", email);
        } else {
            CookieUtil.deleteCookie(response, "rememberedEmail");
        }

        if ("admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
        } else {
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

    // --------------- Register ---------------

    private void handleRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName       = request.getParameter("firstName");
        String lastName        = request.getParameter("lastName");
        String username        = request.getParameter("username"); 
        String email           = request.getParameter("email");
        String phone           = request.getParameter("phone");
        String address         = request.getParameter("address");
        String password        = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (ValidationUtil.isNullOrEmpty(firstName)) {
            request.setAttribute("error", "'firstName' is missing!");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }
        if (ValidationUtil.isNullOrEmpty(lastName)) {
            request.setAttribute("error", "'lastName' is missing!");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }
        if (ValidationUtil.isNullOrEmpty(username)) {
            request.setAttribute("error", "'username' is missing!");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }
        if (ValidationUtil.isNullOrEmpty(email)) {
            request.setAttribute("error", "'email' is missing!");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }
        if (ValidationUtil.isNullOrEmpty(password)) {
            request.setAttribute("error", "'password' is missing!");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
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

        byte[] imageBytes = null;
        try {
            Part filePart = request.getPart("image");
            if (filePart != null && filePart.getSize() > 0) {
                try (InputStream is = filePart.getInputStream()) {
                    imageBytes = is.readAllBytes();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setUsername(username); 
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setPassword(password); 
        user.setImage(imageBytes);   

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