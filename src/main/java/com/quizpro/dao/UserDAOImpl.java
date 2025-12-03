package com.quizpro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import com.quizpro.dto.User;
import com.quizpro.dto.UserTestHis;
import com.quizpro.util.DBConnection;

public class UserDAOImpl implements UserDAO {
	static User user;

	@Override
	public boolean signup(String name, String email, String role, long phone, String password) {
		Connection conn = DBConnection.getConnector();
		String qry = "INSERT into emps values(?,?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(qry);
			int userid = (int) (Math.random() * 100000000);
			ps.setInt(1, userid);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setLong(4, phone);
			ps.setString(5, role);
			ps.setString(6, password);
			int result = ps.executeUpdate();
			if (result > 0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public User login(String email, String password) {
		Connection conn = DBConnection.getConnector();
		String qry = "select * from emps where email=? and password=?";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(qry);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getLong(4), rs.getString(6));
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean updatePassword(int id, String password) {
		Connection conn = DBConnection.getConnector();
		String qry = "update emps set password = ? where eid = ?";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(qry);
			ps.setString(1, password);
			ps.setInt(2, id);
			int res = ps.executeUpdate();

			if (res > 0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public ArrayList<UserTestHis> userTestHistory(int id) {
		String query = "SELECT q.quizname AS quiz_name, s.subname AS subject_name, "
				+ "r.percentage AS percentage, r.resstatus AS result_status, r.date AS date_taken " + "FROM result r "
				+ "JOIN quizzs q ON r.quizId = q.quizId " + "JOIN subjects s ON q.subId = s.subId "
				+ "JOIN emps e ON r.userId = e.eid " + "WHERE r.userId = ?";

		Connection con = DBConnection.getConnector();
		PreparedStatement pst;
		ArrayList<UserTestHis> list=null;
		try {
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			list = new ArrayList<UserTestHis>();
			while(rs.next()) {
//				UserTestHis ushis = new UserTestHis(rs.getString("quiz_name"),rs.getString("subject_name"), rs.getDate("date_taken").toString(), rs.getFloat("percentage"), rs.getString("result_status"));
//				userhis.add(ushis);
				
				UserTestHis uth = new UserTestHis();
	            uth.setQuizName(rs.getString("quiz_name"));
	            uth.setCategory(rs.getString("subject_name"));
	            uth.setScorePer(rs.getDouble("percentage"));
	            uth.setStatus(rs.getString("result_status"));

	            // Convert Date to String (safe)
	            Date dt = rs.getDate("date_taken");
	            uth.setDateTaken(dt != null ? dt.toString() : "N/A");

	            list.add(uth);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
