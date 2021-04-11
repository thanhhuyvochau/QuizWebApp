/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapper;

import java.sql.ResultSet;
import model.Subject;
import org.apache.log4j.Logger;

/**
 *
 * @author ADMIN
 */
public class SubjectMapper implements MapperInterface<Subject>{
 static Logger log = Logger.getLogger(SubjectMapper.class.getName());
    public Subject mapper(ResultSet result) {
        Subject subject = null;
        try {
            String subjectId = result.getString("subject_id");
            String subjectName = result.getString("subject_name");
            int timeOfTest = result.getInt("time_to_test");
            int questionNum = result.getInt("question_num");
            subject = new Subject(subjectId, subjectName,timeOfTest,questionNum);
        } catch (Exception e) {
            //log
            log.toString();
        }
        return subject;
    }
    
}
