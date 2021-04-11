/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.Vector;
import mapper.QuestionMapper;
import model.Page;
import model.Question;
import model.Subject;
import org.apache.log4j.Logger;
import ultis.DBUltils;

/**
 *
 * @author ADMIN
 */
public class QuestionDao extends AbstractDao<Question> {

    static Logger log = Logger.getLogger(QuestionDao.class.getName());

    public Question getQuestionById(int questionId) {
        String sql = "SELECT question_id,question_content,create_date,subject_id,status\n"
                + "FROM questions\n"
                + "WHERE question_id = ?";
        Vector<Question> questionList = query(sql, new QuestionMapper(), questionId);
        Question result = null;
        if (!questionList.isEmpty()) {
            result = questionList.get(0);
        }
        return result;
    }

    public Vector<Question> getQuestionBySubject(String subjectId, int start, int end) {
        String sql = "SELECT question_id,question_content,create_date,subject_id,status\n"
                + "               FROM questions\n"
                + "                WHERE questions.subject_id like ?\n"
                + "                ORDER BY\n"
                + "			CAST(question_content as Varchar(1000))\n"
                + "                OFFSET ? ROWS \n"
                + "                FETCH NEXT ? ROWS ONLY;";;
        Vector<Question> questionList = query(sql, new QuestionMapper(), subjectId, start, end);
        return questionList;
    }

    public Page getAllNumBySubject(Page pageOb, String subjectId) {
        String sql = "SELECT question_id,question_content,create_date,subject_id,status\n"
                + "FROM questions\n"
                + "WHERE questions.subject_id like ?\n";
        Vector<Question> questionList = query(sql, new QuestionMapper(), subjectId);
        if (questionList != null) {
            pageOb.setTotalRecordNum(questionList);
        }
        return pageOb;
    }

    public Vector<Question> getQuestionByName(String name, String subjectId, int start, int end) {
        String sql = "SELECT question_id,question_content,create_date,subject_id,status\n"
                + "               FROM questions\n"
                + "                WHERE questions.question_content like ? AND questions.subject_id = ?\n"
                + "                ORDER BY\n"
                + "			CAST(question_content as Varchar(1000))\n"
                + "                OFFSET ? ROWS \n"
                + "                FETCH NEXT ? ROWS ONLY;";
        Vector<Question> questionList = query(sql, new QuestionMapper(), "%" + name + "%", subjectId, start, end);
        return questionList;

    }

    public Page getAllNumByName(Page pageOb, String name, String subjectId) {
        String sql = "SELECT question_id,question_content,create_date,subject_id,status\n"
                + "FROM questions\n"
                + " WHERE questions.question_content like ? AND questions.subject_id = ?\n";
        Vector<Question> questionList = query(sql, new QuestionMapper(), "%" + name + "%", subjectId);
        if (questionList != null) {
            pageOb.setTotalRecordNum(questionList);
        }
        return pageOb;
    }

    public Vector<Question> getQuestionByState(boolean state, String subjectId, Integer start, int end) {
        String sql = "SELECT question_id,question_content,create_date,subject_id,status\n"
                + "               FROM questions\n"
                + "                WHERE questions.status = ? AND questions.subject_id = ?\n"
                + "                ORDER BY\n"
                + "			CAST(question_content as Varchar(1000))\n"
                + "                OFFSET ? ROWS \n"
                + "                FETCH NEXT ? ROWS ONLY;";;
        Vector<Question> questionList = query(sql, new QuestionMapper(), state, subjectId, start, end);
        return questionList;
    }

    public Page getAllNumByState(Page pageOb, boolean state, String subjectId) {
        String sql = "SELECT question_id,question_content,create_date,subject_id,status\n"
                + "FROM questions\n"
                + "   WHERE questions.status = ? AND questions.subject_id = ?\n";
        Vector<Question> questionList = query(sql, new QuestionMapper(), state, subjectId);
        if (questionList != null) {
            pageOb.setTotalRecordNum(questionList);
        }
        return pageOb;
    }

    public Integer createQuestion(String questionName, String subjectId) {
        String sql = "INSERT INTO questions (question_content,create_date,subject_id,status)\n"
                + "VALUES\n"
                + "(?,?,?,?);";
        Connection cnn = DBUltils.getConnection();
        PreparedStatement pre = null;
        ResultSet result = null;
        Integer key = null;
        try {
            if (cnn != null) {
                pre = cnn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                pre.setString(1, questionName);
                pre.setDate(2, new java.sql.Date(new Date().getTime()));
                pre.setString(3, subjectId);
                pre.setBoolean(4, true);
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

    public boolean updateQuestion(int questionId, String questionContent, String subjectId) {
        String itemId = null;
        String sql = "UPDATE questions\n"
                + "SET question_content = ?,subject_id = ?\n"
                + "WHERE question_id = ?;";
        boolean result = updateQuery(sql, questionContent, subjectId, questionId);
        return result;
    }

    public boolean deleteQuestion(int questionId) {
        String itemId = null;
        String sql = "UPDATE questions\n"
                + "SET questions.status = 0\n"
                + "WHERE question_id = ?;";
        boolean result = updateQuery(sql, questionId);
        return result;
    }

    public Vector<Question> getQuestionForQuiz(String subjectId) {
        int numOfQuestion = 0;
        Vector<Question> questionsList = null;
        SubjectDao subjectDao = new SubjectDao();
        Subject subject = subjectDao.getSubjectById(subjectId);
        numOfQuestion = subject.getQuestionNum();      
        String sql = "SELECT TOP " + Integer.toString(numOfQuestion) + " question_id,question_content,create_date,subject_id,status\n"
                + "FROM  questions\n"
                + "WHERE status = 1 AND subject_id = ?\n"
                + "ORDER BY NEWID()";
        questionsList = query(sql, new QuestionMapper(), subjectId);
        return questionsList;
    }

    public Vector<Question> getQuestionByQuizId(int quizId) {
        Vector<Question> questionList = null;
        String sql = "SELECT questions.question_id,questions.question_content,questions.create_date,questions.subject_id,questions.status\n"
                + "FROM questions,quiz_detail\n"
                + "WHERE quiz_detail.quiz_id = ? AND quiz_detail.question_id = questions.question_id";
        questionList = query(sql, new QuestionMapper(), quizId);
        return questionList;
    }
  
}
