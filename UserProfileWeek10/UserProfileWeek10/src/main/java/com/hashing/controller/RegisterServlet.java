package com.hashing.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.*;

import com.hashing.service.RegisterService;

@WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String username = request.getParameter("username");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");
            String number = request.getParameter("number");
            String password = request.getParameter("password");
            int programId = Integer.parseInt(request.getParameter("program"));

            
            //IMAGE upload
            Part filePart = request.getPart("image");
            
            //getSubmittedFilename() gives us the original filename the user chose
            String fileName = (filePart != null)? filePart.getSubmittedFileName() : null;
            String imagePath;
            
            if (fileName != null && !fileName.isEmpty()) {
            	String uploadDir = getServletContext().getRealPath("/uploads");
            	
            	//Making sure the folder exists - creating if not 
            	File uploadFolder = new File(uploadDir);
            	if (!uploadFolder.exists()) {
            		uploadFolder.mkdirs();
            	}
            	
            	//Writing the uploaded bytes to the file on disk
            	File file = new File(uploadFolder, fileName);
                filePart.write(file.getAbsolutePath()); 
            	
                //Storing just the relative path in Db
            	imagePath = "uploads/" + fileName;
            	
            }else{
            	imagePath = "uploads/default.png";
            }
            
            RegisterService service = new RegisterService();
            service.addStudent(firstName, lastName, username, dob, gender, email, number, password, programId, imagePath);
            
          
            response.sendRedirect(request.getContextPath() + "/login?success=registered");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}