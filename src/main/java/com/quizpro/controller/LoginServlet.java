package com.quizpro.controller;

import java.io.IOException;

import com.quizpro.dao.UserDAO;
import com.quizpro.dao.UserDAOImpl;
import com.quizpro.dto.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	UserDAO userDAO;
	public LoginServlet() {
		userDAO = new UserDAOImpl();
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String pwd=req.getParameter("password");
		User result=userDAO.login(email, pwd);
		if(result!=null) {
			HttpSession session=req.getSession();
			session.setAttribute("id", result.getUserid());
			session.setAttribute("name", result.getName());
			session.setAttribute("email", result.getEmail());
			session.setAttribute("phone", result.getPhone());
			System.out.println("success");
			resp.sendRedirect("dashboard.jsp");
		}
		else {
			System.out.println("Failed");
			req.setAttribute("msg","Invalid Credentials");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
	}
}
