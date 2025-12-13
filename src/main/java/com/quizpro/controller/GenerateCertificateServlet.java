package com.quizpro.controller;

import java.io.IOException;

import com.quizpro.dao.AdminDAO;
import com.quizpro.dao.AdminDAOImpl;

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
		int quizId=Integer.parseInt(req.getParameter("quizId"));
		HttpSession session=req.getSession();
		int userId=(int) session.getAttribute("userId");
		String name=(String)session.getAttribute("username");
	}
}
