package com.originsclay.service;

import com.originsclay.dao.ProductDAO;
import com.originsclay.model.Product;

import java.util.List;


public class ProductService {

    private final ProductDAO productDAO = new ProductDAO();

    public boolean addProduct(Product product) {
        return productDAO.insertProduct(product);
    }

    public Product findById(int id) {
        return productDAO.findById(id);
    }

    public List<Product> findAll() {
        return productDAO.findAll();
    }

    public List<Product> findByCategory(int categoryId) {
        return productDAO.findByCategory(categoryId);
    }

    public List<Product> search(String keyword) {
        return productDAO.search(keyword);
    }

    public List<Product> findFeatured() {
        return productDAO.findFeatured();
    }

    public int countProducts() {
        return productDAO.countProducts();
    }

    public boolean updateProduct(Product product) {
        return productDAO.updateProduct(product);
    }

    public boolean updateStock(int productId, int newQuantity) {
        return productDAO.updateStock(productId, newQuantity);
    }

    public boolean deleteProduct(int id) {
        return productDAO.deleteProduct(id);
    }
}
