package com.originsclay.controller;

import com.originsclay.service.OrderService;
import com.originsclay.service.ProductService;
import com.originsclay.service.UserService;
import com.originsclay.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@WebServlet(name = "AdminReportController", urlPatterns = "/admin/reports", asyncSupported = true)
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("generateCsvReport".equals(action)) {
            generateCsvReport(response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/reports");
        }
    }

    private void generateCsvReport(HttpServletResponse response) throws IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=originsclay_inventory_report.csv");

        List<Product> products = productService.findAll();

        try (PrintWriter writer = response.getWriter()) {
            // Header
            writer.println("Product ID,Name,Category,Price,Stock,Status");

            // Data
            for (Product p : products) {
                writer.printf("%d,%s,%s,%.2f,%d,%s%n",
                        p.getId(),
                        p.getName(),
                        p.getCategoryName(),
                        p.getPrice(),
                        p.getStockQuantity(),
                        p.getStatus());
            }
        }
    }
}
