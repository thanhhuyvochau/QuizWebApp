/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Vector;

/**
 *
 * @author ADMIN
 */
public class Quiz {

    private String userId;
    private String subjectId;
    private Date quizDate;
    private Float totalScore;
    private Vector<Question> questionList;
    private HashMap<Integer, Answer> resultOfQuiz;
    private Integer time;
    private int quizId;

    public Quiz() {
        resultOfQuiz = new HashMap<Integer, Answer>();
    }

    public Quiz(String userId, String subjectId, Date quizDate, Float totalScore, Vector<Question> questionList, HashMap<Integer, Answer> resultOfQuiz, Integer time) {
        this.userId = userId;
        this.subjectId = subjectId;
        this.quizDate = quizDate;
        this.totalScore = totalScore;
        this.questionList = questionList;
        this.resultOfQuiz = resultOfQuiz;
        this.time = time;
    }

    public Quiz(int quizId, String userId, String subjectId, Date quizDate, Float totalScore) {
        this.quizId = quizId;
        this.userId = userId;
        this.subjectId = subjectId;
        this.quizDate = quizDate;
        this.totalScore = totalScore;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }
    
    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public Date getQuizDate() {
        return quizDate;
    }

    public void setQuizDate(Date quizDate) {
        this.quizDate = quizDate;
    }

    public Float getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Float totalScore) {
        this.totalScore = totalScore;
    }

    public Vector<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(Vector<Question> questionList) {
        this.questionList = questionList;
    }

    public HashMap<Integer, Answer> getResultOfQuiz() {
        return resultOfQuiz;
    }

    public void setResultOfQuiz(HashMap<Integer, Answer> resultOfQuiz) {
        this.resultOfQuiz = resultOfQuiz;
    }

    public String getDateFormat() {
        String dateString = new SimpleDateFormat("dd-MM-yyyy").format(quizDate);
        return dateString;
    }

}
