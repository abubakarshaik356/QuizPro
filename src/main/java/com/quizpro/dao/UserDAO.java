package com.quizpro.dao;

import com.quizpro.dto.User;

public interface UserDAO {
	public boolean signup(String name, String email,String role, long phone, String password);
	public User login(String email, String password);
}
