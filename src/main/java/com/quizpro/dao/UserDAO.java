package com.quizpro.dao;

import java.util.ArrayList;

import com.quizpro.dto.User;
import com.quizpro.dto.UserTestHis;

public interface UserDAO {
	public boolean signup(String name, String email,String role, long phone, String password);
	public User login(String email, String password);
	public boolean updatePassword(int id,String password);
	public ArrayList<UserTestHis> userTestHistory(int id);
}
