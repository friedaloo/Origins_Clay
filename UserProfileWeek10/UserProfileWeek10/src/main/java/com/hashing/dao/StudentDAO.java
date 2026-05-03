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
        
        // Modified to only retrieve ACTIVE students (soft delete consideration)
        String sql = "SELECT * FROM student WHERE status = 'active' OR status IS NULL";
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
            s.setStatus(rs.getString("status") != null ? rs.getString("status") : "active");
            students.add(s);
           
        }
        
        rs.close();
        pst.close();
        con.close();
        return students;
    }
    
    public StudentModel getStudentByUsername (String username) throws Exception{
    	Connection con = DBconfig.getConnection();
        
        // Modified to retrieve active students only (soft delete consideration)
        String sql = "SELECT * FROM student WHERE username = ? AND (status = 'active' OR status IS NULL)";
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
            student.setStatus(rs.getString("status") != null ? rs.getString("status") : "active");       
        }
           
                
        rs.close();
        pst.close();
        con.close();
        return student;
    }
    
    /**
     * HARD DELETE: Permanently removes a student record from the database.
     * Data cannot be recovered.
     * Use with caution - only when you are certain the data is never needed again.
     * 
     * @param username The username of the student to delete
     * @throws Exception if database operation fails
     */
    public void hardDeleteStudent(String username) throws Exception {
        Connection con = DBconfig.getConnection();
        
        String sql = "DELETE FROM student WHERE username = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, username);
        
        pst.executeUpdate();
        pst.close();
        con.close();
    }
    
    /**
     * SOFT DELETE: Marks a student record as 'inactive' without removing data.
     * Data is preserved and can be restored or viewed by administrators.
     * This is the safer approach for audit trails and data recovery.
     * 
     * @param username The username of the student to soft delete
     * @throws Exception if database operation fails
     */
    public void softDeleteStudent(String username) throws Exception {
        Connection con = DBconfig.getConnection();
        
        String sql = "UPDATE student SET status = 'inactive' WHERE username = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, username);
        
        pst.executeUpdate();
        pst.close();
        con.close();
    }
    
    /**
     * RESTORE: Reactivates a soft-deleted student record.
     * Only works for soft-deleted (inactive) students.
     * 
     * @param username The username of the student to restore
     * @throws Exception if database operation fails
     */
    public void restoreStudent(String username) throws Exception {
        Connection con = DBconfig.getConnection();
        
        String sql = "UPDATE student SET status = 'active' WHERE username = ? AND status = 'inactive'";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, username);
        
        pst.executeUpdate();
        pst.close();
        con.close();
    }
    
    /**
     * ADMIN: Retrieve ALL students, including soft-deleted (inactive) ones.
     * Use this in admin panels to view all records for audit/recovery purposes.
     * 
     * @return List of all students (active and inactive)
     * @throws Exception if database operation fails
     */
    public List<StudentModel> getAllStudentsIncludingDeleted() throws Exception {
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
            s.setStatus(rs.getString("status") != null ? rs.getString("status") : "active");
            students.add(s);
        }
        
        rs.close();
        pst.close();
        con.close();
        return students;
    }
    
    /**
     * ADMIN: Get a student by username including soft-deleted records.
     * Use this to retrieve inactive students for admin review/restoration.
     * 
     * @param username The username of the student
     * @return StudentModel if found, null otherwise
     * @throws Exception if database operation fails
     */
    public StudentModel getStudentByUsernameIncludingDeleted(String username) throws Exception {
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
            student.setStatus(rs.getString("status") != null ? rs.getString("status") : "active");       
        }
        
        rs.close();
        pst.close();
        con.close();
        return student;
    }
    
    /**
     * UTILITY: Check if a student is active.
     * Helper method to verify student status before operations.
     * 
     * @param username The username to check
     * @return true if student is active, false if inactive or doesn't exist
     * @throws Exception if database operation fails
     */
    public boolean isStudentActive(String username) throws Exception {
        Connection con = DBconfig.getConnection();
        
        String sql = "SELECT status FROM student WHERE username = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, username);
        
        ResultSet rs = pst.executeQuery();
        boolean isActive = false;
        
        if (rs.next()) {
            String status = rs.getString("status");
            isActive = (status == null || status.equals("active"));
        }
        
        rs.close();
        pst.close();
        con.close();
        return isActive;
    }
    
    /**
     * ADMIN: Retrieve all soft-deleted (inactive) students.
     * Useful for viewing deleted records or permanent hard-delete operations.
     * 
     * @return List of all inactive students
     * @throws Exception if database operation fails
     */
    public List<StudentModel> getAllInactiveStudents() throws Exception {
        List<StudentModel> students = new ArrayList<>();
        Connection con = DBconfig.getConnection();
        
        String sql = "SELECT * FROM student WHERE status = 'inactive'";
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
            s.setStatus("inactive");
            students.add(s);
        }
        
        rs.close();
        pst.close();
        con.close();
        return students;
    }
}