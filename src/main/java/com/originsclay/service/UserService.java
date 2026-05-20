package com.originsclay.service;

import com.originsclay.dao.UserDAO;
import com.originsclay.model.User;
import com.originsclay.util.PasswordUtil;

import java.util.List;

public class UserService {

    private final UserDAO userDAO = new UserDAO();

    public String register(User user) {
       
        if (userDAO.findByUsername(user.getUsername()) != null) {
            return "Username is already taken.";
        }

        // 2. Check duplicate email
        if (userDAO.findByEmail(user.getEmail()) != null) {
            return "Email is already registered.";
        }

        // Hash password
        user.setPassword(PasswordUtil.hashPassword(user.getPassword()));
        user.setRole("customer");
        
       
        user.setstatus(false); // Account starts as false (deactivated) until admin approval

        boolean success = userDAO.insertUser(user);
        return success ? null : "Registration failed. Please try again.";
    }

    public User authenticate(String email, String password) {
        User user = userDAO.findByEmail(email);
        if (user == null) return null;
        
        if (!PasswordUtil.verifyPassword(password, user.getPassword())) {
            return null;
        }
        
        return user;
    }

    public boolean isPendingApproval(String email, String password) {
        User user = userDAO.findByEmail(email);
        if (user == null) return false;
        if (!PasswordUtil.verifyPassword(password, user.getPassword())) return false;
        
        // Return true if status is false (meaning it is still pending admin activation)
        return !user.isstatus();
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
        return userDAO.setstatus(userId, true);
    }

    public boolean rejectUser(int userId) {
        return userDAO.setstatus(userId, false);
    }

    public boolean deleteUser(int userId) {
        return userDAO.deleteUser(userId);
    }
}