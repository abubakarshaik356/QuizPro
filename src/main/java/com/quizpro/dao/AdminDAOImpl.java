package com.quizpro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.quizpro.dto.Questions;
import com.quizpro.dto.Quizzes;
import com.quizpro.dto.Subject;
import com.quizpro.dto.User;
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
	
	public Quizzes getQuizDetails(int id) {
		Connection con = DBConnection.getConnector();
		String str = "Select * from quizzs where quizid=?";
		Quizzes quizzes=new Quizzes();
		try {
			PreparedStatement ps=con.prepareStatement(str);
			ps.setInt(1, id);
			ResultSet rSet=ps.executeQuery();
			if(rSet.next()) {
				quizzes.setTitle(rSet.getString(3));
				quizzes.setDesc(rSet.getString(4));
				String qry="select subName from subjects where subid=?";
				PreparedStatement ps1=con.prepareStatement(qry);
				ps1.setInt(1, rSet.getInt(2));
				ResultSet rSet2=ps1.executeQuery();
				if(rSet2.next()) {
					quizzes.setCategory(rSet2.getString(1));
				}
				quizzes.setMarks(rSet.getInt(5));
				quizzes.setQuestions(rSet.getInt(6));
				System.out.println(quizzes.toString());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return quizzes;
	}
	
	@Override
	public int updateQuiz(String quizName, String quizDesc, String quizCategory, int marks,int noOfQuestions) {

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
	        pstmt = con.prepareStatement(
	                "SELECT quizId FROM quizzs WHERE quizname = ?");
	        pstmt.setString(1, quizName);
	        ResultSet rs1 = pstmt.executeQuery();
	        rs1.next();
	        int quizId=rs1.getInt(1);
	        // Step 2: Insert quiz into quizzs table
	        String qry = "UPDATE quizzs SET quizname=?, description=?, quizmarks=?, quizNoOfQues=? where quizId=?";
	        pstmt = con.prepareStatement(qry);
	        pstmt.setInt(5, quizId);
	        pstmt.setString(1, quizName);
	        pstmt.setInt(3, marks);
	        pstmt.setString(2, quizDesc);
	        pstmt.setInt(4, noOfQuestions);

	        int res = pstmt.executeUpdate();
	        if(res > 0) return quizId;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    
	    return -1;
	}
	
	@Override
    public boolean editCategories(String categoryId, String categoryName, String description) {

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
	
	public Subject getSubjectDetails(int id) {
		Connection con = DBConnection.getConnector();
		String str = "Select * from subjects where subId=?";
		Subject subject=new Subject();
		try {
			PreparedStatement ps=con.prepareStatement(str);
			ps.setInt(1, id);
			ResultSet rSet=ps.executeQuery();
			if(rSet.next()) {
				subject.setSubId(id);
				subject.setSubname(rSet.getString(2));
				subject.setSubDesc(rSet.getString(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subject;
	}

	@Override
	public boolean createNewUser(String name, String email, String role, long phone, String password) {
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
	
	public boolean updateUser(int userId, String name, String email, long phone,String password) {
		Connection conn = DBConnection.getConnector();
		String qry = "UPDATE emps SET name=?, email=?, phone=?, password=? WHERE eid=? ";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(qry);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setLong(3, phone);
			ps.setString(4, password);
			ps.setInt(5, userId);
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
	
	public User getUserDetails(int id) {
		Connection conn = DBConnection.getConnector();
		String qry = "select * from emps where eid=?";
		PreparedStatement ps;
		User user=new User();
		try {
			ps=conn.prepareStatement(qry);
			ps.setInt(1, id);
			ResultSet rSet=ps.executeQuery();
			if(rSet.next()) {
				user.setUserid(id);
				user.setName(rSet.getString(2));
				user.setEmail(rSet.getString(3));
				user.setPhone(rSet.getLong(4));
				user.setRole(rSet.getString(5));
				user.setPassword(rSet.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
}
