package com.lcdut.service;

import com.lcdut.model.SubjectsModel;

import java.util.List;

public interface SubjectsService {
    SubjectsModel addSubject(SubjectsModel subjectsModel);
    void delete(int id);
    SubjectsModel editSubject(SubjectsModel subjectsModel);
    List<SubjectsModel> getByIdGroupAndIdSemester(int idGroup, int idSemester);
    List<SubjectsModel> getAll();
    List<SubjectsModel> getByIdGroup(int idGroup);
    List<SubjectsModel> getByIdGroupAndTypeOfTest(int idGroup, String type);
}
