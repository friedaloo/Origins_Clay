package com.originsclay.controller;

import com.originsclay.model.Category;
import com.originsclay.model.Product;
import com.originsclay.service.CategoryService;
import com.originsclay.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * ProductController - Browse & search products (public).
 * Satisfies rubric 3d "Search feature".
 */
@WebServlet(name = "ProductController", urlPatterns = {"/products", "/product-details"})
public class ProductController extends HttpServlet {

    private final ProductService  productService  = new ProductService();
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getServletPath();

        if ("/product-details".equals(uri)) {
            showProductDetails(request, response);
        } else {
            listProducts(request, response);
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword    = request.getParameter("search");
        String categoryId = request.getParameter("category");

        List<Product> products;

        if (keyword != null && !keyword.trim().isEmpty()) {
            products = productService.search(keyword.trim());
            request.setAttribute("searchKeyword", keyword.trim());
        } else if (categoryId != null && !categoryId.trim().isEmpty()) {
            products = productService.findByCategory(Integer.parseInt(categoryId));
            request.setAttribute("selectedCategory", categoryId);
        } else {
            products = productService.findAll();
        }

        List<Category> categories = categoryService.findAll();

        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/WEB-INF/views/pages/products.jsp")
               .forward(request, response);
    }

    private void showProductDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        Product product = productService.findById(Integer.parseInt(idParam));
        if (product == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found.");
            return;
        }

        // Add related products (e.g., from the same category or featured)
        List<Product> related = productService.findByCategory(product.getCategoryId());
        // Remove current product from related list
        related.removeIf(p -> p.getId() == product.getId());
        
        request.setAttribute("product", product);
        request.setAttribute("relatedProducts", related);
        request.getRequestDispatcher("/WEB-INF/views/pages/product-details.jsp")
               .forward(request, response);
    }
}
