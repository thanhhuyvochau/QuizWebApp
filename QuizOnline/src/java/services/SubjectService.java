/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.SubjectDao;
import java.util.Vector;
import model.Subject;

/**
 *
 * @author ADMIN
 */
public class SubjectService {

    private SubjectDao subjectDao;

    public SubjectService() {
        subjectDao = new SubjectDao();

    }

    public Vector<Subject> getAllSubject() {
        Vector<Subject> subjects = subjectDao.getAllSubject();
        return subjects;
    }

    public Subject getSubjectById(String subjectId) {
        Subject subject = null;
        subject = subjectDao.getSubjectById(subjectId);
        return subject;
    }

}
