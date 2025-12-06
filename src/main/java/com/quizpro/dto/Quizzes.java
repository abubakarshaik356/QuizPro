package com.quizpro.dto;

public class Quizzes {

	private int userId;
	private String title;
	private String category;
	private int questions;
	private int marks;
	private String date;
	public Quizzes(int userId, String title, String category, int questions,int marks, String date) {
		super();
		this.userId = userId;
		this.title = title;
		this.category = category;
		this.questions = questions;
		this.date = date;
	}
	
	public int getMarks() {
		return marks;
	}

	public void setMarks(int marks) {
		this.marks = marks;
	}

	public Quizzes() {
		super();
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getQuestions() {
		return questions;
	}
	public void setQuestions(int questions) {
		this.questions = questions;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
