package com.originsclay.service;

import com.originsclay.dao.UserDAO;
import com.originsclay.model.User;
import com.originsclay.util.PasswordUtil;

import java.util.List;

/**
 * UserService - Business logic for user registration, authentication, and management.
 */
public class UserService {

    private final UserDAO userDAO = new UserDAO();

    /**
     * Register a new customer. Password is hashed before storage.
     * New accounts require admin approval.
     */
    public String register(User user) {
        // Check duplicate email
        if (userDAO.findByEmail(user.getEmail()) != null) {
            return "Email is already registered.";
        }

        // Hash password
        user.setPassword(PasswordUtil.hashPassword(user.getPassword()));
        user.setRole("Customer");
        user.setStatus("Pending");  // admin must approve

        boolean success = userDAO.insertUser(user);
        return success ? null : "Registration failed. Please try again.";
    }

    /**
     * Authenticate a user by email and password.
     * Returns the User if valid, or null if credentials are wrong / account not approved.
     */
    public User authenticate(String email, String password) {
        User user = userDAO.findByEmail(email);
        if (user == null) return null;
        if (!PasswordUtil.verifyPassword(password, user.getPassword())) return null;
        if (!"Active".equalsIgnoreCase(user.getStatus())) return null;
        return user;
    }

    /**
     * Returns null if credentials match but account is pending approval (for UI message).
     */
    public boolean isPendingApproval(String email, String password) {
        User user = userDAO.findByEmail(email);
        if (user == null) return false;
        if (!PasswordUtil.verifyPassword(password, user.getPassword())) return false;
        return "Pending".equalsIgnoreCase(user.getStatus());
    }

    public User findById(int id) {
        return userDAO.findById(id);
    }

    public User findByEmail(String email) {
        return userDAO.findByEmail(email);
    }

    public List<User> findAll() {
        return userDAO.findAll();
    }

    public List<User> findByRole(String role) {
        return userDAO.findByRole(role);
    }

    public int countUsers() {
        return userDAO.countUsers();
    }

    public boolean updateProfile(User user) {
        return userDAO.updateUser(user);
    }

    public boolean changePassword(int userId, String currentPassword, String newPassword) {
        User user = userDAO.findById(userId);
        if (user == null) return false;
        if (!PasswordUtil.verifyPassword(currentPassword, user.getPassword())) return false;
        return userDAO.updatePassword(userId, PasswordUtil.hashPassword(newPassword));
    }

    public boolean approveUser(int userId) {
        return userDAO.updateStatus(userId, "Active");
    }

    public boolean rejectUser(int userId) {
        return userDAO.updateStatus(userId, "Pending");
    }

    public boolean deleteUser(int userId) {
        return userDAO.deleteUser(userId);
    }
}
