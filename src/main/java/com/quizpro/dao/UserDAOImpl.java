package com.quizpro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import com.quizpro.dto.User;
import com.quizpro.util.DBConnection;

public class UserDAOImpl implements UserDAO{
	static User user;
	@Override
	public boolean signup(String name, String email, long phone, String password) {
		Connection conn=DBConnection.getConnector();
		String qry="INSERT into users values(?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps=conn.prepareStatement(qry);
			int userid=(int)(Math.random()*100000000);
			ps.setInt(1, userid);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setLong(4, phone);
			ps.setString(5, password);
			int result=ps.executeUpdate();
			if(result>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public User login(String email, String password) {
		Connection conn=DBConnection.getConnector();
		String qry="select * from users where email=? and password=?";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(qry);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getLong(4), rs.getString(5));
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
