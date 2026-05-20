package com.originsclay.service;

import com.originsclay.dao.CategoryDAO;
import com.originsclay.model.Category;

import java.util.List;


public class CategoryService {

    private final CategoryDAO categoryDAO = new CategoryDAO();

    public boolean addCategory(Category category) {
        return categoryDAO.insertCategory(category);
    }

    public Category findById(int id) {
        return categoryDAO.findById(id);
    }

    public List<Category> findAll() {
        return categoryDAO.findAll();
    }

    public boolean updateCategory(Category category) {
        return categoryDAO.updateCategory(category);
    }

    public boolean deleteCategory(int id) {
        return categoryDAO.deleteCategory(id);
    }
}
