package com.originsclay.controller;

import com.originsclay.model.Product;
import com.originsclay.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * HomeController - Landing page showing featured products.
 */
@WebServlet(name = "HomeController", urlPatterns = {"", "/home"})
public class HomeController extends HttpServlet {

    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> featured = productService.findFeatured();
        request.setAttribute("featuredProducts", featured);
        request.getRequestDispatcher("/WEB-INF/views/pages/home.jsp")
               .forward(request, response);
    }
}
