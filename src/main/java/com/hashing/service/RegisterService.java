package com.hashing.service;

import com.hashing.dao.StudentDAO;
import com.hashing.utils.PasswordUtil;

public class RegisterService {

    public void addStudent(String firstName, String lastName, String username, String dob,
                           String gender, String email, String number, String password, int programId) throws Exception {

        password = PasswordUtil.getHashPassword(password);

        StudentDAO dao = new StudentDAO();
        dao.insertStudent(firstName, lastName, username, dob, gender, email, number, password, programId);
    }
}