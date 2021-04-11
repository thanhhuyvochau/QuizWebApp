/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.math.BigDecimal;

/**
 *
 * @author ADMIN
 */
public class Result {
    private int totalQuestion;
    private int correctAnswer;
    private BigDecimal totalScore;

    public Result() {
    }

    public Result(int totalQuestion, int correctAnswer, BigDecimal totalScore) {
        this.totalQuestion = totalQuestion;
        this.correctAnswer = correctAnswer;
        this.totalScore = totalScore;
    }

    public int getTotalQuestion() {
        return totalQuestion;
    }

    public void setTotalQuestion(int totalQuestion) {
        this.totalQuestion = totalQuestion;
    }

    public int getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(int correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public BigDecimal getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(BigDecimal totalScore) {
        this.totalScore = totalScore;
    }
    
}
