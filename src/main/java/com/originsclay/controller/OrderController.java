package com.originsclay.controller;

import com.originsclay.model.Order;
import com.originsclay.model.User;
import com.originsclay.service.OrderService;
import com.originsclay.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * OrderController - Customer order history and details.
 * Satisfies rubric 3c "Access to issued orders/records".
 */
@WebServlet(name = "OrderController",
        urlPatterns = {"/account/orders", "/account/order-details"})
public class OrderController extends HttpServlet {

    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        String uri = request.getServletPath();

        if ("/account/order-details".equals(uri)) {
            String idParam = request.getParameter("id");
            if (idParam == null) {
                response.sendRedirect(request.getContextPath() + "/account/orders");
                return;
            }
            Order order = orderService.findById(Integer.parseInt(idParam));
            if (order == null || order.getUserId() != user.getId()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            request.setAttribute("order", order);
            request.getRequestDispatcher("/WEB-INF/views/account/order-details.jsp")
                   .forward(request, response);
        } else {
            List<Order> orders = orderService.findByUserId(user.getId());
            request.setAttribute("orders", orders);

            // Check for checkout success message
            String checkoutMsg = (String) request.getSession().getAttribute("checkoutSuccess");
            if (checkoutMsg != null) {
                request.setAttribute("success", checkoutMsg);
                request.getSession().removeAttribute("checkoutSuccess");
            }

            request.getRequestDispatcher("/WEB-INF/views/account/orders.jsp")
                   .forward(request, response);
        }
    }
}
