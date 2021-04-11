/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.Vector;
import mapper.SubjectMapper;
import model.Subject;

/**
 *
 * @author ADMIN
 */
public class SubjectDao extends AbstractDao<Subject> {

    public Vector<Subject> getAllSubject() {
        String sql = "SELECT subject_id,subject_name,question_num,time_to_test\n"
                + "FROM subjects";
        Vector<Subject> subjectList = query(sql, new SubjectMapper());
        return subjectList;
    }
    
    
     public Subject getSubjectById(String id) {
        String sql = "SELECT subject_id,subject_name,question_num,time_to_test\n"
                + "FROM subjects\n"
                +"WHERE subject_id = ?";
        Vector<Subject> subjectList = query(sql, new SubjectMapper(),id);
        return subjectList.get(0);
    }
}
