/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapper;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.Date;
import model.Quiz;
import org.apache.log4j.Logger;

/**
 *
 * @author ADMIN
 */
public class QuizMapper implements MapperInterface<Quiz> {
 static Logger log = Logger.getLogger(QuizMapper.class.getName());
    public Quiz mapper(ResultSet result) {
        Quiz quiz = null;
        try {
            String quizId = result.getString("quiz_id");
            String userId = result.getString("user_id");
            String subjectId = result.getString("subject_id");
            Date date = result.getDate("quiz_date");
            BigDecimal totalScore = result.getBigDecimal("total_score");
            quiz = new Quiz(Integer.parseInt(quizId),userId, subjectId, date, Float.parseFloat(totalScore.toString()));
        } catch (Exception e) {
            //log
            e.toString();
        }
        return quiz;

    }

}
