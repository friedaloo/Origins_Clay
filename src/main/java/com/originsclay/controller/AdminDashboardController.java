package com.originsclay.controller;

import com.originsclay.service.OrderService;
import com.originsclay.service.ProductService;
import com.originsclay.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "AdminDashboardController", urlPatterns = "/admin/dashboard")
public class AdminDashboardController extends HttpServlet {

    private final UserService    userService    = new UserService();
    private final ProductService productService = new ProductService();
    private final OrderService   orderService   = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("totalUsers",    userService.countUsers());
        request.setAttribute("totalProducts", productService.countProducts());
        request.setAttribute("totalOrders",   orderService.countOrders());
        request.setAttribute("totalRevenue",  orderService.getTotalRevenue());
        request.setAttribute("pendingOrders", orderService.countOrdersByStatus("pending"));

        request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp")
               .forward(request, response);
    }
}
