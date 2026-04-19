package com.hashing.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hashing.model.StudentModel;
import com.hashing.utils.DBconfig;

public class StudentDAO {

    public void insertStudent(String firstName, String lastName, String username, String dob,
                              String gender, String email, String number, String password, int programId) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO student (first_name, last_name, username, dob, gender, email, number, password, program_id) "
                   + "VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, firstName);
        pst.setString(2, lastName);
        pst.setString(3, username);
        pst.setString(4, dob);
        pst.setString(5, gender);
        pst.setString(6, email);
        pst.setString(7, number);
        pst.setString(8, password);
        pst.setInt(9, programId); // <-- must be existing program_id

        pst.executeUpdate();
        pst.close();
        con.close();
    }
    public List<StudentModel> getAllStudents() throws Exception {
        List<StudentModel> students = new ArrayList<>();
        Connection con = DBconfig.getConnection();
        
        String sql = "SELECT * FROM student";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            StudentModel s = new StudentModel();
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            s.setUserName(rs.getString("username"));
            s.setDob(rs.getDate("dob"));
            s.setEmail(rs.getString("email"));
            s.setNumber(rs.getString("number"));
            s.setProgram(rs.getInt("program_id"));
            students.add(s);
        }
        
        rs.close();
        pst.close();
        con.close();
        return students;
    }
}