package com.quizpro.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ADDQuestion")
public class ADDQuestion extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // 🔥 Change DB credentials for your MySQL server
    private static final String DB_URL = "jdbc:mysql://localhost:3306/onlinequiz";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "Narendra@2002";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        System.out.println("1");
        String question_type = request.getParameter("question_type");
        String question_text = request.getParameter("question_text");
        String rack_category = request.getParameter("rack_category");
        String difficulty = request.getParameter("difficulty");
        System.out.println("2");
        // --- Retrieve options dynamically based on count ---
		/* int optionCount = Integer.parseInt(request.getParameter("option_count")); */
        System.out.println("4");
     // Instead of parsing option_count
        List<String> options = new ArrayList<>();
        for (int i = 1; i <= 10; i++) { // max 10 options
            String opt = request.getParameter("option" + i);
            if (opt != null && !opt.trim().isEmpty()) {
                options.add(opt);
            }
        }


        System.out.println("3");
        // --- Retrieve correct answer(s) ---
        String correctAnswer = "";

        if ("mcq".equalsIgnoreCase(question_type) || "true_false".equalsIgnoreCase(question_type)) {
            correctAnswer = request.getParameter("correct_answer");
        } else if ("multi_select".equalsIgnoreCase(question_type)) {
            String[] correctAnsArr = request.getParameterValues("correct_answers");
            if (correctAnsArr != null) {
                correctAnswer = String.join(",", correctAnsArr); // Save as "1,3,4"
            }
        }

        // --- DB insert ---
        Connection con = null;
        PreparedStatement pst = null;
        System.out.println("narendra");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String sql = "INSERT INTO questions (question_type, question_text, option1, option2, option3, option4, option5, correct_answer, rack_category, difficulty) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pst = con.prepareStatement(sql);

            pst.setString(1, question_type);
            pst.setString(2, question_text);

            // --- Map options ---
            // Fill missing options as NULL
            for (int i = 0; i < 5; i++) {
                if (i < options.size()) {
                    pst.setString(3 + i, options.get(i));
                } else {
                    pst.setNull(3 + i, Types.VARCHAR);
                }
            }

            pst.setString(8, correctAnswer);
            pst.setString(9, rack_category);
            pst.setString(10, difficulty);

            int rows = pst.executeUpdate();

            if (rows > 0) {
                response.getWriter().println("<h3>Question Added Successfully!</h3>");
            } else {
                response.getWriter().println("<h3>Error inserting question!</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try { if (pst != null) pst.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
}
