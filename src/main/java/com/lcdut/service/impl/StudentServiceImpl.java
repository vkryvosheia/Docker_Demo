package com.lcdut.service.impl;

import com.lcdut.model.StudentsModel;
import com.lcdut.repository.StudentRepository;
import com.lcdut.service.StudentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentsService {
    @Autowired
    private StudentRepository studentRepository;

    @Override
    public StudentsModel addStudent(StudentsModel studentsModel) {
        return studentRepository.save(studentsModel);
    }

    @Override
    public void delete(int id) {
        studentRepository.delete(id);
    }

    @Override
    public StudentsModel editStudent(StudentsModel studentsModel) {
        return studentRepository.saveAndFlush(studentsModel);
    }

    @Override
    public List<StudentsModel> getAll() {
        return studentRepository.findAll();
    }

    @Override
    public StudentsModel getById(int id) {
        System.out.println("FOUND");
        return studentRepository.findOne(id);
    }

    @Override
    public List<StudentsModel> getByIdGroup(int id) {
        return studentRepository.findByIdGroup(id);
    }
}
