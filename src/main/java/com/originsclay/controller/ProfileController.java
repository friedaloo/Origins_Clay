package com.originsclay.controller;

import com.originsclay.model.User;
import com.originsclay.service.UserService;
import com.originsclay.util.SessionUtil;
import com.originsclay.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "ProfileController",
        urlPatterns = {"/account/profile", "/account/edit-profile",
                       "/account/change-password"})
public class ProfileController extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        // Reload fresh data from DB
        user = userService.findById(user.getId());
        request.setAttribute("user", user);

        String uri = request.getServletPath();
        switch (uri) {
            case "/account/edit-profile":
                request.getRequestDispatcher("/WEB-INF/views/account/edit-profile.jsp")
                       .forward(request, response);
                break;
            case "/account/change-password":
                request.getRequestDispatcher("/WEB-INF/views/account/change-password.jsp")
                       .forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/WEB-INF/views/account/profile.jsp")
                       .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getServletPath();

        if ("/account/edit-profile".equals(uri)) {
            handleEditProfile(request, response);
        } else if ("/account/change-password".equals(uri)) {
            handleChangePassword(request, response);
        }
    }

    private void handleEditProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User sessionUser = SessionUtil.getLoggedInUser(request);

        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");
        String email     = request.getParameter("email");
        String phone     = request.getParameter("phone");
        String address   = request.getParameter("address");

        if (ValidationUtil.isNullOrEmpty(firstName) || ValidationUtil.isNullOrEmpty(lastName)
                || ValidationUtil.isNullOrEmpty(email)) {
            request.setAttribute("error", "Name and email are required.");
            request.setAttribute("user", sessionUser);
            request.getRequestDispatcher("/WEB-INF/views/account/edit-profile.jsp")
                   .forward(request, response);
            return;
        }

        User updated = new User();
        updated.setId(sessionUser.getId());
        updated.setFirstName(firstName);
        updated.setLastName(lastName);
        updated.setEmail(email);
        updated.setPhone(phone);
        updated.setAddress(address);

        boolean success = userService.updateProfile(updated);

        if (success) {
            // Refresh session user
            User refreshed = userService.findById(sessionUser.getId());
            SessionUtil.setLoggedInUser(request, refreshed);
            request.setAttribute("success", "Profile updated successfully.");
            request.setAttribute("user", refreshed);
        } else {
            request.setAttribute("error", "Failed to update profile.");
            request.setAttribute("user", sessionUser);
        }

        request.getRequestDispatcher("/WEB-INF/views/account/profile.jsp")
               .forward(request, response);
    }

    private void handleChangePassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User sessionUser = SessionUtil.getLoggedInUser(request);

        String currentPassword = request.getParameter("currentPassword");
        String newPassword     = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (ValidationUtil.isNullOrEmpty(currentPassword) || ValidationUtil.isNullOrEmpty(newPassword)) {
            request.setAttribute("error", "All fields are required.");
            request.setAttribute("user", sessionUser);
            request.getRequestDispatcher("/WEB-INF/views/account/change-password.jsp")
                   .forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "New passwords do not match.");
            request.setAttribute("user", sessionUser);
            request.getRequestDispatcher("/WEB-INF/views/account/change-password.jsp")
                   .forward(request, response);
            return;
        }

        if (!ValidationUtil.isStrongPassword(newPassword)) {
            request.setAttribute("error",
                    "Password must be at least 8 characters with uppercase, lowercase, digit, and special character.");
            request.setAttribute("user", sessionUser);
            request.getRequestDispatcher("/WEB-INF/views/account/change-password.jsp")
                   .forward(request, response);
            return;
        }

        boolean success = userService.changePassword(sessionUser.getId(), currentPassword, newPassword);

        if (success) {
            request.setAttribute("success", "Password changed successfully.");
        } else {
            request.setAttribute("error", "Current password is incorrect.");
        }

        request.setAttribute("user", sessionUser);
        request.getRequestDispatcher("/WEB-INF/views/account/change-password.jsp")
               .forward(request, response);
    }
}
