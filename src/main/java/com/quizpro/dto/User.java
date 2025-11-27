package com.quizpro.dto;

public class User {
	private int userid;
	private String name;
	private String email;
	private long phone;
	private String password;
	public User(int userid, String name, String email, long phone, String password) {
		super();
		this.userid = userid;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
	}
	public int getUserid() {
		return userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public long getPhone() {
		return phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
