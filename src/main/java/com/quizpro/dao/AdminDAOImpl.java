package com.quizpro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.quizpro.dto.Questions;
import com.quizpro.dto.Subject;
import com.quizpro.util.DBConnection;

public class AdminDAOImpl implements AdminDAO {

    private Connection conn = DBConnection.getConnector();

    @Override
    public int totalUsers() {
        return count("SELECT COUNT(*) FROM emps");
    }

    @Override
    public int totalQuizzes() {
        return count("SELECT COUNT(*) FROM quizzs");
    }

    @Override
    public int totalSubjects() {
        return count("SELECT COUNT(*) FROM subjects");
    }

    @Override
    public int totalTestAttempts() {
        return count("SELECT COUNT(*) FROM result");
    }

    private int count(String sql) {
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    @Override
    public boolean addCategories(String categoryId, String categoryName, String description) {

        String sql = "INSERT INTO subjects(subId, subName, subDesc) VALUES (?, ?, ?)";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, categoryId);
            ps.setString(2, categoryName);
            ps.setString(3, description);

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

	@Override
	public ArrayList<Subject> getSubNames() {
		ArrayList<Subject> list = new ArrayList();
		
		Connection con = DBConnection.getConnector();
		try {
			PreparedStatement pstmt = con.prepareStatement("Select * from subjects");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Subject sub = new Subject();
				sub.setSubId(rs.getInt("subId"));
				sub.setSubname(rs.getString("subname"));
				list.add(sub);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	/*
	 * @Override public Boolean addQuiz(String quizName, String quizDesc, String
	 * quizCategory, int marks) {
	 * 
	 * Connection con = DBConnection.getConnector(); try { PreparedStatement pstmt =
	 * con.prepareStatement("Select subId from subjects where subname = ?");
	 * pstmt.setString(1, quizCategory); ResultSet rs = pstmt.executeQuery();
	 * 
	 * int id = rs.getInt(1);
	 * 
	 * String qry =
	 * "Insert into quizzs(quizname,quizmarks,subid,description) values (?,?,?,?)";
	 * pstmt = con.prepareStatement(qry); int res = pstmt.executeUpdate(); if(res >
	 * 0) { return true; }
	 * 
	 * 
	 * } catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return false; }
	 */

	@Override
	public int addQuiz(String quizName, String quizDesc, String quizCategory, int marks,int noOfQuestions) {

	    Connection con = DBConnection.getConnector();
	    try {
	        // Step 1: Fetch subject ID
	        PreparedStatement pstmt = con.prepareStatement(
	                "SELECT subId FROM subjects WHERE subname = ?");
	        pstmt.setString(1, quizCategory);
	        ResultSet rs = pstmt.executeQuery();

	        int id = -1;
	        if (rs.next()) {      // Move cursor to first row
	            id = rs.getInt("subId");
	        } else {
	            System.out.println("Subject not found!");
	            return -1;
	        }

	        // Step 2: Insert quiz into quizzs table
	        String qry = "INSERT INTO quizzs(quizId,quizname, quizmarks, subid, description,quizNoOfQues) VALUES (?,?,?,?,?,?)";
	        pstmt = con.prepareStatement(qry);
	        int quizId = (int)(Math.random() * 1000000);
	        pstmt.setInt(1, quizId);
	        pstmt.setString(2, quizName);
	        pstmt.setInt(3, marks);
	        pstmt.setInt(4, id);
	        pstmt.setString(5, quizDesc);
	        pstmt.setInt(6, noOfQuestions);

	        int res = pstmt.executeUpdate();
	        if(res > 0) return quizId;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    
	    return -1;
	}

	@Override
	public ArrayList<Questions> getQuestions(int id) {
		
		ArrayList<Questions> list= new ArrayList<>();
		Connection con = DBConnection.getConnector();
		String str = "Select * from questions where quizId=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(str);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Questions qs = new Questions();
				qs.setId(rs.getInt("quesId"));
				qs.setQuestion(rs.getString("quesDesc"));
				qs.setOption1(rs.getString("option1"));
				qs.setOption2(rs.getString("option2"));
				qs.setOption3(rs.getString("option3"));
				qs.setOption4(rs.getString("option4"));
				qs.setAnswer(rs.getString("answer"));
				qs.setQuizId(rs.getInt("quizId"));
				qs.setOptionType(rs.getString("optionType"));
				list.add(qs);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public Questions getQuestionDetails(int id) {
		Connection con = DBConnection.getConnector();
		String str = "Select * from questions where quesId=?";
		Questions qs = null;
		try {
			PreparedStatement ps = con.prepareStatement(str);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				qs = new Questions();
				qs.setId(rs.getInt("quesId"));
				qs.setQuestion(rs.getString("quesDesc"));
				qs.setOption1(rs.getString("option1"));
				qs.setOption2(rs.getString("option2"));
				qs.setOption3(rs.getString("option3"));
				qs.setOption4(rs.getString("option4"));
				qs.setAnswer(rs.getString("answer"));
				qs.setQuizId(rs.getInt("quizId"));
				qs.setOptionType(rs.getString("optionType"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return qs;
	}

	
	@Override
	public boolean updateQuestion(int questionId,String questionText,String option1,String option2,String option3,String option4,String answer) {
		String sql = "UPDATE questions SET quesdesc = ?, option1 = ?, option2 = ?, option3 = ?, option4 = ?, answer = ? "
	            + "WHERE quesid = ?";
		Connection con = DBConnection.getConnector();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, questionText);
	        ps.setString(2, option1);
	        ps.setString(3, option2);
	        ps.setString(4, option3);
	        ps.setString(5, option4);
	        ps.setString(6, answer);
	        ps.setInt(7, questionId);

	        int rows = ps.executeUpdate();

	        if (rows > 0) {
	            return true;
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	

}
