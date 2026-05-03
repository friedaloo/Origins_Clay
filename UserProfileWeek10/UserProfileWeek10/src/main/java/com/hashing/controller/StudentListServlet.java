package com.hashing.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.hashing.model.StudentModel;
import com.hashing.service.ListService;

/**
 * Servlet implementation class StudentListServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/students" })
public class StudentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
			ListService service = new ListService();
            // Get data from service
            List<StudentModel> students = service.fetchAll();

            // Set in Request Scope for EL access
            request.setAttribute("students", students);

            // Forward to JSP
            request.getRequestDispatcher("/WEB-INF/pages/student_list.jsp").forward(request, response);
            
        } catch (Exception e) {
            throw new ServletException("Database error", e);
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
