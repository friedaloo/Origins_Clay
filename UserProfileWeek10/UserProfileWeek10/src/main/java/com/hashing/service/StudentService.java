package com.hashing.service;

import com.hashing.dao.StudentDAO;
import com.hashing.model.StudentModel;

public class StudentService {
	
	public StudentModel getStudentByUsername(String username) throws Exception{
		StudentDAO studentDAO = new StudentDAO();
        return studentDAO.getStudentByUsername(username);
	}
}
