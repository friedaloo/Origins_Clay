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

/**
 * Servlet implementation class UserProfileServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/userProfile" })
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//Service layer used to retrieve student information from database;
	private StudentService service = new StudentService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
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
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
