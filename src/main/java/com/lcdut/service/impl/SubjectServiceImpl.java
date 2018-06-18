package com.lcdut.service.impl;

import com.lcdut.model.SubjectsModel;
import com.lcdut.repository.SubjectRepository;
import com.lcdut.service.SubjectsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectsService {
    @Autowired
    private SubjectRepository subjectRepository;

    @Override
    public SubjectsModel addSubject(SubjectsModel subjectsModel) {
        return subjectRepository.save(subjectsModel);
    }

    @Override
    public void delete(int id) {
        subjectRepository.delete(id);
    }

    @Override
    public SubjectsModel editSubject(SubjectsModel subjectsModel) {
        return subjectRepository.saveAndFlush(subjectsModel);
    }

    @Override
    public List<SubjectsModel> getByIdGroupAndIdSemester(int idGroup, int idSemester) {
        return subjectRepository.findByGroupsAndSemester(idGroup, idSemester);
    }

    @Override
    public List<SubjectsModel> getAll() {
        return subjectRepository.findAll();
    }

    @Override
    public List<SubjectsModel> getByIdGroup(int idGroup) {
        return subjectRepository.findByGroups(idGroup);
    }

    @Override
    public List<SubjectsModel> getByIdGroupAndTypeOfTest(int idGroup, String type) {
        return subjectRepository.findByGroupsAndTypeOfTest(idGroup, type);
    }
}
