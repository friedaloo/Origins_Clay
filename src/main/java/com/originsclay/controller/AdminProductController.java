package com.originsclay.controller;

import com.originsclay.model.Product;
import com.originsclay.service.CategoryService;
import com.originsclay.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
@WebServlet(name = "AdminProductController",
        urlPatterns = {"/admin/products", "/admin/product/add",
                       "/admin/product/edit", "/admin/product/delete"},
        asyncSupported = true)
public class AdminProductController extends HttpServlet {

    private final ProductService  productService  = new ProductService();
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getServletPath();

        switch (uri) {
            case "/admin/product/add":
                request.setAttribute("categories", categoryService.findAll());
                request.setAttribute("formAction", "add");
                request.getRequestDispatcher("/WEB-INF/views/admin/product-form.jsp")
                       .forward(request, response);
                break;

            case "/admin/product/edit":
                int editId = Integer.parseInt(request.getParameter("id"));
                Product product = productService.findById(editId);
                request.setAttribute("product", product);
                request.setAttribute("categories", categoryService.findAll());
                request.setAttribute("formAction", "edit");
                request.getRequestDispatcher("/WEB-INF/views/admin/product-form.jsp")
                       .forward(request, response);
                break;

            default:
                List<Product> products = productService.findAll();
                request.setAttribute("products", products);
                request.getRequestDispatcher("/WEB-INF/views/admin/manage-products.jsp")
                       .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getServletPath();

        switch (uri) {
            case "/admin/product/add":
                handleAdd(request, response);
                break;
            case "/admin/product/edit":
                handleEdit(request, response);
                break;
            case "/admin/product/delete":
                handleDelete(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/admin/products");
        }
    }

    private void handleAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Product product = extractProduct(request);
        boolean success = productService.addProduct(product);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/products");
        } else {
            request.setAttribute("error", "Failed to add product.");
            request.setAttribute("categories", categoryService.findAll());
            request.setAttribute("formAction", "add");
            request.getRequestDispatcher("/WEB-INF/views/admin/product-form.jsp")
                   .forward(request, response);
        }
    }

    private void handleEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Product product = extractProduct(request);
        product.setId(Integer.parseInt(request.getParameter("id")));
        boolean success = productService.updateProduct(product);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/products");
        } else {
            request.setAttribute("error", "Failed to update product.");
            request.setAttribute("product", product);
            request.setAttribute("categories", categoryService.findAll());
            request.setAttribute("formAction", "edit");
            request.getRequestDispatcher("/WEB-INF/views/admin/product-form.jsp")
                   .forward(request, response);
        }
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        productService.deleteProduct(id);
        response.sendRedirect(request.getContextPath() + "/admin/products");
    }

    private Product extractProduct(HttpServletRequest request) {
        Product p = new Product();
        p.setName(request.getParameter("name"));
        p.setDescription(request.getParameter("description"));
        p.setPrice(new BigDecimal(request.getParameter("price")));
        p.setStockQuantity(Integer.parseInt(request.getParameter("stockQuantity")));
        p.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        p.setImageUrl(request.getParameter("imageUrl"));
        p.setFeatured("on".equals(request.getParameter("featured")));
        return p;
    }
}
