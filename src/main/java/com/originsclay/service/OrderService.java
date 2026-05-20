package com.originsclay.service;

import com.originsclay.dao.OrderDAO;
import com.originsclay.model.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


public class OrderService {

    private final OrderDAO orderDAO = new OrderDAO();
    private final ProductService productService = new ProductService();


    public boolean placeOrder(int userId, List<CartItem> cartItems, String shippingAddress) {
        if (cartItems == null || cartItems.isEmpty()) return false;

        Order order = new Order();
        order.setUserId(userId);
        order.setShippingAddress(shippingAddress);

        BigDecimal total = BigDecimal.ZERO;
        List<OrderItem> orderItems = new ArrayList<>();

        for (CartItem ci : cartItems) {
            OrderItem oi = new OrderItem();
            oi.setProductId(ci.getProductId());
            oi.setQuantity(ci.getQuantity());
            oi.setUnitPrice(ci.getPrice());
            orderItems.add(oi);
            total = total.add(ci.getSubtotal());
        }

        order.setTotalAmount(total);
        order.setItems(orderItems);

        boolean created = orderDAO.createOrder(order);

        // Reduce stock for each item
        if (created) {
            for (CartItem ci : cartItems) {
                Product product = productService.findById(ci.getProductId());
                if (product != null) {
                    int newStock = product.getStockQuantity() - ci.getQuantity();
                    productService.updateStock(product.getId(), Math.max(newStock, 0));
                }
            }
        }

        return created;
    }

    public Order findById(int id) {
        return orderDAO.findById(id);
    }

    public List<Order> findByUserId(int userId) {
        return orderDAO.findByUserId(userId);
    }

    public List<Order> findAll() {
        return orderDAO.findAll();
    }

    public int countOrders() {
        return orderDAO.countOrders();
    }

    public BigDecimal getTotalRevenue() {
        return orderDAO.getTotalRevenue();
    }

    public int countOrdersByStatus(String status) {
        return orderDAO.countOrdersByStatus(status);
    }

    public boolean updateStatus(int orderId, String status) {
        return orderDAO.updateStatus(orderId, status);
    }

    public boolean deleteOrder(int id) {
        return orderDAO.deleteOrder(id);
    }
}
