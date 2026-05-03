package com.hashing.service;

import com.hashing.dao.StudentDAO;
import com.hashing.model.StudentModel;
import com.hashing.utils.PasswordUtil;
import java.util.List;

/**
 * AccountService handles account-related operations like deletion and verification.
 * Implements both soft-delete (recommended) and hard-delete strategies.
 */
public class AccountService {
	
	private StudentDAO studentDAO = new StudentDAO();
	
	/**
	 * Delete student account (SOFT DELETE).
	 * Marks the account as inactive without removing data.
	 * Account can be restored by admin if needed.
	 * 
	 * @param username The student's username
	 * @return true if soft-delete successful, false otherwise
	 * @throws Exception if database operation fails
	 */
	public boolean deleteAccountSoft(String username) throws Exception {
		try {
			studentDAO.softDeleteStudent(username);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * Delete student account permanently (HARD DELETE).
	 * Permanently removes the record - CANNOT BE RECOVERED.
	 * Use only for test data or with explicit admin approval.
	 * 
	 * @param username The student's username
	 * @return true if hard-delete successful, false otherwise
	 * @throws Exception if database operation fails
	 */
	public boolean deleteAccountPermanent(String username) throws Exception {
		try {
			studentDAO.hardDeleteStudent(username);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * Delete student account with password verification.
	 * Requires password confirmation before soft-deletion.
	 * Safer approach for account deletion requests.
	 * 
	 * @param username The student's username
	 * @param password The student's password for verification
	 * @return 0 = success, 1 = password incorrect, 2 = user not found, 3 = error
	 * @throws Exception if database operation fails
	 */
	public int deleteAccountWithVerification(String username, String password) throws Exception {
		try {
			// Retrieve the student
			StudentModel student = studentDAO.getStudentByUsernameIncludingDeleted(username);
			
			if (student == null) {
				return 2; // User not found
			}
			
			// Verify password
			if (!PasswordUtil.checkPassword(password, student.getPassword())) {
				return 1; // Password incorrect
			}
			
			// Password verified - proceed with soft delete
			studentDAO.softDeleteStudent(username);
			return 0; // Success
			
		} catch (Exception e) {
			e.printStackTrace();
			return 3; // Error
		}
	}
	
	/**
	 * Restore a soft-deleted account.
	 * Reactivates an inactive account (admin operation).
	 * 
	 * @param username The student's username
	 * @return true if restore successful, false otherwise
	 * @throws Exception if database operation fails
	 */
	public boolean restoreDeletedAccount(String username) throws Exception {
		try {
			studentDAO.restoreStudent(username);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * Check if account exists and is active.
	 * For pre-deletion checks.
	 * 
	 * @param username The student's username
	 * @return true if account exists and is active
	 * @throws Exception if database operation fails
	 */
	public boolean isAccountActive(String username) throws Exception {
		return studentDAO.isStudentActive(username);
	}
	
	/**
	 * Get account status (for admin purposes).
	 * Returns the full student object including status field.
	 * 
	 * @param username The student's username
	 * @return StudentModel with all fields including status
	 * @throws Exception if database operation fails
	 */
	public StudentModel getAccountStatus(String username) throws Exception {
		return studentDAO.getStudentByUsernameIncludingDeleted(username);
	}
	
	/**
	 * Get all inactive (soft-deleted) student accounts.
	 * Admin operation to view deleted accounts for restoration or archival.
	 * 
	 * @return List of all soft-deleted StudentModel objects
	 * @throws Exception if database operation fails
	 */
	public List<StudentModel> getAllInactiveStudents() throws Exception {
		return studentDAO.getAllInactiveStudents();
	}
}
