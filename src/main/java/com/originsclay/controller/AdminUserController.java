package com.originsclay.controller;

import com.originsclay.model.User;
import com.originsclay.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "AdminUserController",
        urlPatterns = {"/admin/users", "/admin/user/approve",
                       "/admin/user/reject", "/admin/user/delete"})
public class AdminUserController extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> users = userService.findAll();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/views/admin/manage-users.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getServletPath();
        int userId = Integer.parseInt(request.getParameter("id"));

        switch (uri) {
            case "/admin/user/approve":
                userService.approveUser(userId);
                break;
            case "/admin/user/reject":
                userService.rejectUser(userId);
                break;
            case "/admin/user/delete":
                userService.deleteUser(userId);
                break;
        }

        response.sendRedirect(request.getContextPath() + "/admin/users");
    }
}
