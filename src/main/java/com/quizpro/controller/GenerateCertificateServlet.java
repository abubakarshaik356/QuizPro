package com.quizpro.controller;

import java.io.IOException;

import com.quizpro.dao.AdminDAO;
import com.quizpro.dao.AdminDAOImpl;
import com.quizpro.dto.Quizzes;
import com.quizpro.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/GenerateCertificate")
public class GenerateCertificateServlet extends HttpServlet {
	
	AdminDAO adminDAO;
	public GenerateCertificateServlet() {
		adminDAO=new AdminDAOImpl();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("It's Comming.....");
		int quizId=Integer.parseInt(req.getParameter("quizId"));
		HttpSession session=req.getSession();
		int userId=(int) session.getAttribute("id");
		String name=(String)session.getAttribute("username");
		String date = (String) req.getParameter("Date");
		
		Quizzes quiz = adminDAO.getQuizDetails(userId);
		req.setAttribute("Quiz", quiz);
		req.setAttribute("User", session.getAttribute("user"));
		req.setAttribute("Date", date);
		req.getRequestDispatcher("certificate.jsp").forward(req, resp);
	}
}
