/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.Vector;
import mapper.QuizMapper;
import model.Page;
import model.Quiz;
import org.apache.log4j.Logger;
import ultis.DBUltils;

/**
 *
 * @author ADMIN
 */
public class QuizDao extends AbstractDao<Quiz> {

    static Logger log = Logger.getLogger(QuestionDao.class.getName());

    public Integer saveQuiz(String userId, String subjectId, BigDecimal score) {
        String sql = "INSERT INTO quiz (user_id,subject_id,quiz_date,total_score)\n"
                + "VALUES\n"
                + "(?,?,?,?);";
        Connection cnn = DBUltils.getConnection();
        PreparedStatement pre = null;
        ResultSet result = null;
        Integer key = null;
        try {
            if (cnn != null) {
                pre = cnn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                pre.setString(1, userId);
                pre.setString(2, subjectId);
                pre.setDate(3, new java.sql.Date(new Date().getTime()));
                pre.setBigDecimal(4, score);
                pre.executeUpdate();
                result = pre.getGeneratedKeys();
                if (result.next()) {
                    key = result.getInt(1);
                }
            }
        } catch (Exception e) {
            //log
            log.info(e.toString());

        } finally {
            try {
                if (result != null) {
                    result.close();
                } else if (pre != null) {
                    pre.close();
                } else if (cnn != null) {
                    cnn.close();
                }
            } catch (Exception e) {
                log.info(e.toString());
            }

        }
        return key;
    }

    public boolean saveQuizDetail(int quizId, int questionId, int answerId, boolean isRight, BigDecimal scoreDetail) {
        boolean result = false;
        String sql = "";
        if (answerId == 0) {
            sql = "INSERT INTO quiz_detail (quiz_id,question_id,is_right,score,answer_id)\n"
                    + "VALUES\n"
                    + "(?,?,?,?,NULL);";
        } else {
            sql = "INSERT INTO quiz_detail (quiz_id,question_id,is_right,score,answer_id)\n"
                    + "VALUES\n"
                    + "(?,?,?,?,?);";
        }
        result = updateQuery(sql, quizId, questionId, isRight, scoreDetail, answerId);
        return result;
    }

    public Vector<Quiz> getQuizByUserId(String userId, int start, int end) {
        String sql = "SELECT quiz_id,user_id,subject_id,quiz_date,total_score\n"
                + "FROM quiz\n"
                + "WHERE quiz.user_id like ?\n"
                + "ORDER BY quiz_id\n"
                + "                OFFSET ? ROWS \n"
                + "                FETCH NEXT ? ROWS ONLY;";
        Vector<Quiz> quizList = query(sql, new QuizMapper(), userId, start, end);
        return quizList;
    }

    public Page getAllQuizByUserId(Page page, String userId) {
        String sql = "SELECT quiz_id,user_id,subject_id,quiz_date,total_score\n"
                + "FROM quiz\n"
                + "WHERE quiz.user_id like ?";
        Vector<Quiz> quizList = query(sql, new QuizMapper(), userId);
        page.setTotalRecordNum(quizList);
        return page;
    }

    public Vector<Quiz> getQuizBySubjectAndUserId(String userId, String subjectId, int start, int end) {
        String sql = "SELECT quiz_id,user_id,subject_id,quiz_date,total_score\n"
                + "FROM quiz\n"
                + "WHERE subject_id like ? AND user_id like ?\n"
                + "ORDER BY quiz_id\n"
                + "                OFFSET ? ROWS \n"
                + "                FETCH NEXT ? ROWS ONLY;";
        Vector<Quiz> quizList = query(sql, new QuizMapper(), subjectId, userId, start, end);
        return quizList;
    }

    public Page getAllQuizBySubjectAndUserId(Page page, String userId, String subjectId) {
        String sql = "SELECT quiz_id,user_id,subject_id,quiz_date,total_score\n"
                + "FROM quiz\n"
                + "WHERE subject_id like ? AND user_id like ?";
        Vector<Quiz> quizList = query(sql, new QuizMapper(), subjectId, userId);

        page.setTotalRecordNum(quizList);
        return page;
    }

}
