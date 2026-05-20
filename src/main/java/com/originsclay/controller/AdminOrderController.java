package com.originsclay.controller;

import com.originsclay.model.Order;
import com.originsclay.service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "AdminOrderController",
        urlPatterns = {"/admin/orders", "/admin/order/view", "/admin/order/update-status"})
public class AdminOrderController extends HttpServlet {

    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getServletPath();

        if ("/admin/order/view".equals(uri)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Order order = orderService.findById(id);
            request.setAttribute("order", order);
            request.getRequestDispatcher("/WEB-INF/views/admin/manage-orders.jsp")
                   .forward(request, response);
        } else {
            List<Order> orders = orderService.findAll();
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/WEB-INF/views/admin/manage-orders.jsp")
                   .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int orderId   = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");

        orderService.updateStatus(orderId, status);
        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}
