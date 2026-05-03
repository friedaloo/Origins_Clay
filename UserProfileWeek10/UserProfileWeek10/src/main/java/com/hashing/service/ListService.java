package com.hashing.service;

import java.util.List;

import com.hashing.dao.StudentDAO;
import com.hashing.model.StudentModel;

public class ListService {
	public List<StudentModel> fetchAll() throws Exception {
		StudentDAO studentDAO = new StudentDAO();
        return studentDAO.getAllStudents();
    }
}
