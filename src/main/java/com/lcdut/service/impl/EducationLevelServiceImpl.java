package com.lcdut.service.impl;


import com.lcdut.model.EducationLevelModel;
import com.lcdut.repository.EducationLevelRepository;
import com.lcdut.service.EducationLevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EducationLevelServiceImpl implements EducationLevelService{

    @Autowired
    EducationLevelRepository rep;


    @Override
    public EducationLevelModel addEducationLevel(EducationLevelModel m) {
        return rep.save(m);
    }

    @Override
    public EducationLevelModel editEducationLevel(EducationLevelModel m) {
        return rep.save(m);
    }

    @Override
    public void delete(int id) {
        rep.delete(id);
    }

    @Override
    public List<EducationLevelModel> getAll() {
        return rep.findAll();
    }
}
