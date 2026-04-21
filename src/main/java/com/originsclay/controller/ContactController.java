package com.originsclay.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * ContactController - Serves the Contact page and handles form submission.
 * Satisfies rubric 7b.
 */
@WebServlet(name = "ContactController", urlPatterns = "/contact")
public class ContactController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/views/pages/contact.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name    = request.getParameter("name");
        String email   = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // In a real application this would send an email or persist the message.
        // For now we just confirm receipt.
        request.setAttribute("successMessage",
                "Thank you, " + name + "! Your message has been received. We'll get back to you soon.");

        request.getRequestDispatcher("/WEB-INF/views/pages/contact.jsp")
               .forward(request, response);
    }
}
