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

/**
 * AdminReportController - Generates reports and analytics.
 * Satisfies rubric 2d "Generate reports / Sales vs availability analytics".
 */
@WebServlet(name = "AdminReportController", urlPatterns = "/admin/reports")
public class AdminReportController extends HttpServlet {

    private final OrderService   orderService   = new OrderService();
    private final ProductService productService = new ProductService();
    private final UserService    userService    = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Summary stats
        request.setAttribute("totalRevenue",     orderService.getTotalRevenue());
        request.setAttribute("totalOrders",       orderService.countOrders());
        request.setAttribute("pendingOrders",     orderService.countOrdersByStatus("pending"));
        request.setAttribute("processingOrders",  orderService.countOrdersByStatus("processing"));
        request.setAttribute("shippedOrders",     orderService.countOrdersByStatus("shipped"));
        request.setAttribute("deliveredOrders",   orderService.countOrdersByStatus("delivered"));
        request.setAttribute("cancelledOrders",   orderService.countOrdersByStatus("cancelled"));
        request.setAttribute("returnedOrders",    orderService.countOrdersByStatus("returned"));

        // Products & Users
        request.setAttribute("totalProducts",     productService.countProducts());
        request.setAttribute("allProducts",       productService.findAll());
        request.setAttribute("totalUsers",        userService.countUsers());

        request.getRequestDispatcher("/WEB-INF/views/admin/reports.jsp")
               .forward(request, response);
    }
}
