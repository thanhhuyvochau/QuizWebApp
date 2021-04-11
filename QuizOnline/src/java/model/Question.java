/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;
import java.util.Vector;

/**
 *
 * @author ADMIN
 */
public class Question {

    private int questionId;
    private String questionContent;
    private String subjectId;
    private Date date;
    private boolean status;
    private Vector<Answer> answers;

    public Question() {
    }

    public Question(int questionId, String questionContent, String subjectId, Date date, boolean status) {
        this.questionId = questionId;
        this.questionContent = questionContent;
        this.subjectId = subjectId;
        this.date = date;
        this.status = status;
   
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Vector<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Vector<Answer> answers) {
        this.answers = answers;
    }
    public String getStatusInString(){
        if(isStatus()){
            return "Active";
        }else{
            return "InActive";
        }
    }
}
