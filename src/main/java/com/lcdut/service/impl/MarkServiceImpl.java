package com.lcdut.service.impl;

import com.lcdut.model.MarksModel;
import com.lcdut.repository.MarkRepository;
import com.lcdut.service.MarksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MarkServiceImpl implements MarksService {
    @Autowired
    private MarkRepository markRepository;

    @Override
    public void delete(int id) {
        markRepository.delete(id);
    }

    @Override
    public MarksModel addMark(MarksModel marksModel) {
        return markRepository.saveAndFlush(marksModel);
    }

    @Override
    public List<MarksModel> getByIdGroup(int id, int idSem) {
        return markRepository.findByIdGroupAndIdSem(id, idSem);
    }

    @Override
    public List<MarksModel> getByIdStudent(int id) {
        return markRepository.findByIdStud(id);
    }

    @Override
    public MarksModel getByIdStudentAndIdSubject(int idStud, int idSubject) {
        System.out.println( "markres : " + markRepository.findByIdStudAndIdSubject(idStud, idSubject));
        return markRepository.findByIdStudAndIdSubject(idStud, idSubject);
    }

}
