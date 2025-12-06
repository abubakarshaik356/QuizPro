package com.quizpro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

	@Override
	public Boolean addQuiz(String quizName, String quizDesc, String quizCategory, int marks) {
		
		Connection con = DBConnection.getConnector();
		try {
			PreparedStatement pstmt = con.prepareStatement("Select subId from subjects where subname = ?");
			pstmt.setString(1, quizCategory);
			ResultSet rs = pstmt.executeQuery();
			
			int id = rs.getInt(1);
			
			String qry = "Insert into quizzs(quizname,quizmarks,subid,description) values (?,?,?,?)";
			pstmt = con.prepareStatement(qry);
			int res = pstmt.executeUpdate();
			if(res > 0) {
				return true;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	

}
