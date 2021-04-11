/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import mapper.AnswerMapper;
import model.Answer;
import ultis.DBUltils;

/**
 *
 * @author ADMIN
 */
public class AnswerDao extends AbstractDao<Answer> {

    public Vector<Answer> getAnswerOfQuestion(int questionId) {
        String sql = "SELECT question_id,answer_id,answer_content,is_correct\n"
                + "FROM answer\n"
                + "WHERE answer.question_id = ?\n"
                + "ORDER BY NEWID()";
        Vector<Answer> answers = query(sql, new AnswerMapper(), questionId);
        return answers;
    }

    public boolean addAnswer(String answer, boolean isCorrect, int questionId) {
        String sql = "INSERT INTO answer (question_id,answer_content,is_correct) \n"
                + "VALUES(?,?,?);";
        return updateQuery(sql, questionId, answer, isCorrect);
    }

    public boolean updateAnswer(String answer, boolean isCorrect, Integer questionId, Integer answerId) {
        String sql = "UPDATE answer\n"
                + "SET answer_content = ?,is_correct = ?\n"
                + "WHERE question_id = ? and answer_id = ? ;";
        boolean result = updateQuery(sql, answer, isCorrect, questionId, answerId);
        return result;
    }

    public Vector<Answer> getAnswerByQuizId(int quizId) {
        String sql = "SELECT quiz_detail.answer_id\n"
                + "FROM quiz_detail\n"
                + "WHERE quiz_detail.quiz_id = ?";
        Vector<Integer> answerIds = new Vector<Integer>();
        try {
            Connection cnn = DBUltils.getConnection();
            PreparedStatement pre = cnn.prepareStatement(sql);
            pre.setInt(1, quizId);
            ResultSet result = pre.executeQuery();
            while (result.next()) {
                Integer id = result.getInt("answer_id");//get Answer ID.
                answerIds.add(id);
            }
        } catch (Exception e) {
            //log
        }
        Vector<Answer> answers = new Vector<Answer>();
        String sql2 = "SELECT answer_id,question_id,answer_content,is_correct\n"
                + "FROM answer\n"
                + "WHERE answer_id = ?";

        for (Integer id : answerIds) {
            Vector<Answer> temp = null;
            if (id != 0) {
                temp = query(sql2, new AnswerMapper(), id);
                Answer answer = temp.get(0);
                answers.add(answer);
            } else {
                Answer answer = new Answer();
                answer.setAnswerContent("");
                answers.add(answer);
            }

        }
        return answers;
    }

}
