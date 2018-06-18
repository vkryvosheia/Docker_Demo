package com.lcdut.service;

import com.lcdut.model.StudentsModel;

import java.util.List;

public interface StudentsService {
    StudentsModel addStudent(StudentsModel studentsModel);
    void delete(int id);
    StudentsModel editStudent(StudentsModel studentsModel);
    List<StudentsModel> getAll();
    StudentsModel getById(int id);
    List<StudentsModel> getByIdGroup(int id);
}
