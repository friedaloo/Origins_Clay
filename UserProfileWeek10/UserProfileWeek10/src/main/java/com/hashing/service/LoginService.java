package com.hashing.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hashing.model.StudentModel;
import com.hashing.utils.DBconfig;
import com.hashing.utils.PasswordUtil;

public class LoginService {

    /**
     * Login user with active status check.
     * Only allows login for active (non-soft-deleted) students.
     * 
     * @param studentModel Contains username and password
     * @return true if credentials match and account is active, false otherwise, null on error
     */
    public Boolean loginUser(StudentModel studentModel) {

        // Check for active status - soft-deleted accounts cannot login
        String query = "SELECT username, password, status FROM student WHERE username = ? AND (status = 'active' OR status IS NULL)";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, studentModel.getUserName());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password");

                return PasswordUtil.checkPassword(
                        studentModel.getPassword(),
                        dbPassword
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

        return false;
    }
}