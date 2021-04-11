/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapper;

import java.sql.ResultSet;
import model.Answer;
import org.apache.log4j.Logger;

/**
 *
 * @author ADMIN
 */
public class AnswerMapper implements MapperInterface<Answer> {
        static Logger log = Logger.getLogger(AnswerMapper.class.getName());
    public Answer mapper(ResultSet result) {
        Answer answer = null;
        try {
            int questionId = result.getInt("question_id");
            int answerId = result.getInt("answer_id");
            String answerContent = result.getString("answer_content");
            boolean isCorrect = result.getBoolean("is_correct");
            
            answer = new Answer(questionId,answerId, answerContent, isCorrect);
        } catch (Exception e) {
            //log
            log.info(e.toString());
        }
        return answer;
    }

}
