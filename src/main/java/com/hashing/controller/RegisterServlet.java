package com.hashing.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.hashing.service.RegisterService;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String username = request.getParameter("username");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");
            String number = request.getParameter("number");
            String password = request.getParameter("password");
            int programId = Integer.parseInt(request.getParameter("program"));

            RegisterService service = new RegisterService();
            service.addStudent(firstName, lastName, username, dob, gender, email, number, password, programId);

            // ✅ Redirect to login page
            response.sendRedirect(request.getContextPath() + "/login?success=registered");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}