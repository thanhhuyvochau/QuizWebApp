/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapper;

import java.sql.ResultSet;
import java.util.Date;
import model.Question;
import org.apache.log4j.Logger;

/**
 *
 * @author ADMIN
 */
public class QuestionMapper implements MapperInterface<Question> {
    static Logger log = Logger.getLogger(QuestionMapper.class.getName());
    public Question mapper(ResultSet result) {
        Question question = null;
        try {
            int questionId = result.getInt("question_id");
            String questionContent = result.getString("question_content");
            Date createDate = result.getDate("create_date");
            String subjecId = result.getString("subject_id");
            boolean status = result.getBoolean("status");
            question = new Question(questionId, questionContent, subjecId, createDate, status);
        } catch (Exception e) {
            //log
            log.info(e.toString());
        }
        return question;
    }

}
