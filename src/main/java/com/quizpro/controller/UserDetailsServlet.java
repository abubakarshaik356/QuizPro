package com.quizpro.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.quizpro.dao.UserDAO;
import com.quizpro.dao.UserDAOImpl;
import com.quizpro.dto.UserTestHis;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserDetails")
public class UserDetailsServlet extends HttpServlet {
	
	UserDAO userDAO;
	public UserDetailsServlet() {
		userDAO = new UserDAOImpl();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId=Integer.parseInt(req.getParameter("userId"));
		ArrayList<UserTestHis> history = userDAO.userTestHistory(userId);
		req.setAttribute("history", history);
		req.setAttribute("performance", userDAO.getPerformance(userId));
		req.getRequestDispatcher("UserDetails.jsp").forward(req, resp);
	}
}
