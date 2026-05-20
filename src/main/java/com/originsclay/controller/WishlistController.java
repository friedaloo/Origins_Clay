package com.originsclay.controller;

import com.originsclay.model.Product;
import com.originsclay.model.WishlistItem;
import com.originsclay.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "WishlistController",
        urlPatterns = {"/wishlist", "/wishlist/add", "/wishlist/remove"})
public class WishlistController extends HttpServlet {

    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/views/account/wishlist.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getServletPath();

        if ("/wishlist/add".equals(uri)) {
            addToWishlist(request, response);
        } else if ("/wishlist/remove".equals(uri)) {
            removeFromWishlist(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/wishlist");
        }
    }

    private void addToWishlist(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = productService.findById(productId);
        if (product == null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        List<WishlistItem> wishlist = getWishlist(request);

        // Avoid duplicates
        boolean exists = wishlist.stream()
                .anyMatch(item -> item.getProductId() == productId);

        if (!exists) {
            wishlist.add(new WishlistItem(
                    product.getId(), product.getName(), product.getPrice(),
                    product.getImageUrl(), product.getStockQuantity() > 0));
        }

        request.getSession().setAttribute("wishlist", wishlist);
        response.sendRedirect(request.getContextPath() + "/wishlist");
    }

    private void removeFromWishlist(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        List<WishlistItem> wishlist = getWishlist(request);
        wishlist.removeIf(item -> item.getProductId() == productId);
        request.getSession().setAttribute("wishlist", wishlist);
        response.sendRedirect(request.getContextPath() + "/wishlist");
    }

    @SuppressWarnings("unchecked")
    private List<WishlistItem> getWishlist(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        List<WishlistItem> wishlist = (List<WishlistItem>) session.getAttribute("wishlist");
        if (wishlist == null) {
            wishlist = new ArrayList<>();
            session.setAttribute("wishlist", wishlist);
        }
        return wishlist;
    }
}
