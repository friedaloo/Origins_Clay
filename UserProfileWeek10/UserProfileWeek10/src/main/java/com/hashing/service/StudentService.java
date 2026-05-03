package com.hashing.service;

import com.hashing.dao.StudentDAO;
import com.hashing.model.StudentModel;

public class StudentService {
	
	private StudentDAO studentDAO = new StudentDAO();
	
	/**
	 * Retrieve a student by username (active students only).
	 * 
	 * @param username The student's username
	 * @return StudentModel if found and active, null otherwise
	 * @throws Exception if database operation fails
	 */
	public StudentModel getStudentByUsername(String username) throws Exception{
        return studentDAO.getStudentByUsername(username);
	}
	
	/**
	 * SAFE DELETE: Soft delete a student account.
	 * Marks the account as 'inactive' without removing data.
	 * Student can be restored later by admin if needed.
	 * 
	 * @param username The student's username
	 * @throws Exception if database operation fails
	 */
	public void softDeleteStudentAccount(String username) throws Exception {
		studentDAO.softDeleteStudent(username);
	}
	
	/**
	 * PERMANENT DELETE: Hard delete a student account.
	 * Permanently removes the record from database - NO RECOVERY POSSIBLE.
	 * Only use for test/junk data or with admin approval.
	 * 
	 * @param username The student's username
	 * @throws Exception if database operation fails
	 */
	public void hardDeleteStudentAccount(String username) throws Exception {
		studentDAO.hardDeleteStudent(username);
	}
	
	/**
	 * RECOVERY: Restore a soft-deleted student account.
	 * Reactivates an inactive account by changing status back to 'active'.
	 * 
	 * @param username The student's username
	 * @throws Exception if database operation fails
	 */
	public void restoreStudentAccount(String username) throws Exception {
		studentDAO.restoreStudent(username);
	}
	
	/**
	 * Check if a student account is active.
	 * Utility method for validation before operations.
	 * 
	 * @param username The student's username
	 * @return true if account is active, false if inactive or doesn't exist
	 * @throws Exception if database operation fails
	 */
	public boolean isStudentAccountActive(String username) throws Exception {
		return studentDAO.isStudentActive(username);
	}
}
