package com.quizpro.dao;

import java.util.ArrayList;

import com.quizpro.dto.Subject;

public interface AdminDAO {
    int totalUsers();
    int totalQuizzes();
    int totalSubjects();
    int totalTestAttempts();
    public boolean addCategories(String categoryId, String categoryName, String description);
    public ArrayList<Subject> getSubNames();
	Boolean addQuiz(String quizName, String quizDesc, String quizCategory, int marks);
}
