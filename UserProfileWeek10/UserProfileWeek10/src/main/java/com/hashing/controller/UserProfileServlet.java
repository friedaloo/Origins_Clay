package com.hashing.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.http.*;
import com.hashing.model.StudentModel;
import com.hashing.service.ListService;
import com.hashing.service.StudentService;
import com.hashing.service.AccountService;
import com.hashing.utils.SessionUtil;

/**
 * Servlet implementation class UserProfileServlet
 * Handles user profile viewing and account deletion operations.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/userProfile" })
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//Service layer used to retrieve student information from database
	private StudentService service = new StudentService();
	private AccountService accountService = new AccountService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * Displays the user profile page
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			//Retrieve Current session without creating a new one
			HttpSession session = request.getSession(false);
			
			//Check authentication status
			if (session == null || session.getAttribute("username") == null ){
				response.sendRedirect(request.getContextPath() + "/login");
				return;
			}
			
			//Extract logged-in user name from session
			String username = session.getAttribute("username").toString();
			
			//Fetch students details from service layer
			StudentModel student = service.getStudentByUsername(username);
			
			//If student record is not found, redirect to login page
			if (student == null) {
				response.sendRedirect(request.getContextPath() + "/login");
				return;
			}
			
			//Attach student object to request scope for JSP rendering
			request.setAttribute("student",student);
			
			//Forward request to Profile JSP page (view layer)
			request.getRequestDispatcher("/WEB-INF/pages/userProfile.jsp").forward(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
			throw new ServletException(e);
		}
	}	
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * Handles account deletion requests from user
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession(false);
			
			// Check authentication
			if (session == null || session.getAttribute("username") == null) {
				response.sendRedirect(request.getContextPath() + "/login");
				return;
			}
			
			String action = request.getParameter("action");
			String username = session.getAttribute("username").toString();
			
			// ==================== ACCOUNT DELETION ====================
			if ("deleteAccount".equalsIgnoreCase(action)) {
				String password = request.getParameter("password");
				String confirmDelete = request.getParameter("confirmDelete");
				
				// Validate inputs
				if (password == null || password.isEmpty() || confirmDelete == null) {
					request.setAttribute("errorMessage", "Password and confirmation required");
					doGet(request, response); // Re-display profile with error
					return;
				}
				
				// Confirm deletion checkbox checked
				if (!"yes".equalsIgnoreCase(confirmDelete)) {
					request.setAttribute("errorMessage", "Please confirm account deletion");
					doGet(request, response);
					return;
				}
				
				// Verify password and delete account (SOFT DELETE - safer)
				int deleteStatus = accountService.deleteAccountWithVerification(username, password);
				
				if (deleteStatus == 0) {
					// Success - soft delete completed
					// Invalidate session
					SessionUtil.invalidate(request);
					// Redirect to home with success message
					response.sendRedirect(request.getContextPath() + "/home?accountDeleted=true");
					return;
					
				} else if (deleteStatus == 1) {
					// Password incorrect
					request.setAttribute("errorMessage", "Invalid password. Account deletion cancelled.");
					doGet(request, response);
					return;
					
				} else if (deleteStatus == 2) {
					// User not found
					request.setAttribute("errorMessage", "Account not found. Please contact support.");
					doGet(request, response);
					return;
					
				} else {
					// Error occurred
					request.setAttribute("errorMessage", "Error deleting account. Please try again later.");
					doGet(request, response);
					return;
				}
			}
			
			// If no valid action, show profile
			doGet(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "An unexpected error occurred");
			try {
				doGet(request, response);
			} catch (Exception ex) {
				throw new ServletException(ex);
			}
		}
	}

}
