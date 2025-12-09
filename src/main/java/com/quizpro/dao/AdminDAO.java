package com.quizpro.dao;

import java.util.ArrayList;

import com.quizpro.dto.Questions;
import com.quizpro.dto.Subject;

public interface AdminDAO {
    int totalUsers();
    int totalQuizzes();
    int totalSubjects();
    int totalTestAttempts();
    public boolean addCategories(String categoryId, String categoryName, String description);
    public ArrayList<Subject> getSubNames();
	int addQuiz(String quizName, String quizDesc, String quizCategory, int marks,int noOfQuestions);
	ArrayList<Questions> getQuestions(int id);	
	Questions getQuestionDetails(int id);
	boolean updateQuestion(int questionId,String questionText,String option1,String option2,String option3,String option4,String answer);
}
