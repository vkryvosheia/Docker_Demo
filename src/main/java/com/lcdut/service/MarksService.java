package com.lcdut.service;

import com.lcdut.model.MarksModel;

import java.util.List;

public interface MarksService {
    void delete(int id);
    MarksModel addMark(MarksModel marksModel);
    List<MarksModel> getByIdGroup(int id, int idSem);
    List<MarksModel> getByIdStudent(int id);
    MarksModel getByIdStudentAndIdSubject(int idStud, int idSubject);
}
