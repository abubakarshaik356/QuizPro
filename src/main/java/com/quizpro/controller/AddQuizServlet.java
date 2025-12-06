package com.quizpro.controller;

import java.io.IOException;

import com.quizpro.dao.AdminDAO;
import com.quizpro.dao.AdminDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddNewQuizintoTable")
public class AddQuizServlet extends HttpServlet{ 
	
	AdminDAO adDAO = null;
	
	public AddQuizServlet() {
		adDAO = new AdminDAOImpl();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String quizName = req.getParameter("title");
		String quizDesc = req.getParameter("description");
		String quizCategory = req.getParameter("category");
		int marks = Integer.parseInt(req.getParameter("passing_score"));
		
		Boolean res = adDAO.addQuiz(quizName,quizDesc,quizCategory,marks);
		if(res) {
			req.getRequestDispatcher("ContentManagement").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("").forward(req, resp);
		}
	}

}
