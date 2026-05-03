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
                              String gender, String email, String number, String password, int programId, String image) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO student (first_name, last_name, username, dob, gender, email, number, password, program_id,image) "
                   + "VALUES (?,?, ?, ?, ?, ?, ?, ?, ?,?)";

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
        pst.setString(10, image);

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
            s.setNumber(rs.getString("number"));
            s.setProgram(rs.getInt("program_id"));
            students.add(s);
           
        }
        
        rs.close();
        pst.close();
        con.close();
        return students;
    }
    
    public StudentModel getStudentByUsername (String username) throws Exception{
    	Connection con = DBconfig.getConnection();
        
        String sql = "SELECT * FROM student WHERE username = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, username);
        
        ResultSet rs = pst.executeQuery();
        
        StudentModel student = null;

        if (rs.next()) {
        	student = new StudentModel();
            student.setFirstName(rs.getString("first_name"));
            student.setLastName(rs.getString("last_name"));
            student.setUserName(rs.getString("username"));
            student.setEmail(rs.getString("email"));       
            student.setGender(rs.getString("gender"));  
            student.setDob(rs.getDate("dob"));
            student.setNumber(rs.getString("number"));
            student.setProgram(rs.getInt("program_id"));
            student.setImage(rs.getString("image"));       
        }
           
                
        rs.close();
        pst.close();
        con.close();
        return student;
    }
}