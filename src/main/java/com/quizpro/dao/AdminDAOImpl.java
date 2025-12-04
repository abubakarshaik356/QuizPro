package com.quizpro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
