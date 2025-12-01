package com.quizpro.controller;

import java.io.IOException;

import com.quizpro.dao.UserDAO;
import com.quizpro.dao.UserDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/signup")
public class SignupServlet extends HttpServlet{
	UserDAO userDAO;
	public SignupServlet() {
		userDAO=new UserDAOImpl();
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		long phone=Long.parseLong(req.getParameter("phone"));
		boolean result=userDAO.signup(name, email,"user", phone, password);
		if(result) {
			resp.sendRedirect("login.jsp?msg=Account created successfully");
		}
		else {
			String msg="Invalid Details or Account alreay exist";
			resp.sendRedirect("signup.jsp?msg="+msg);
		}
		
	}
}

