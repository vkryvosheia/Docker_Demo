package com.lcdut.service;


import com.lcdut.model.EducationLevelModel;

import java.util.List;

public interface EducationLevelService {
    EducationLevelModel addEducationLevel(EducationLevelModel m);
    EducationLevelModel editEducationLevel(EducationLevelModel m);
    void delete(int id);
    List<EducationLevelModel> getAll();


}
