package com.hashing.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hashing.model.StudentModel;
import com.hashing.utils.DBconfig;
import com.hashing.utils.PasswordUtil;

public class LoginService {

    public Boolean loginUser(StudentModel studentModel) {

        String query = "SELECT username, password FROM student WHERE username = ?";

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