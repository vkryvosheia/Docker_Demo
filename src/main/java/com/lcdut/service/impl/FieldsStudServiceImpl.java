package com.lcdut.service.impl;


import com.lcdut.model.FieldsStudModel;
import com.lcdut.repository.FieldsStudRepository;
import com.lcdut.service.FieldsStudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FieldsStudServiceImpl implements FieldsStudService{

    @Autowired
    FieldsStudRepository rep;

    @Override
    public FieldsStudModel addFieldsStud(FieldsStudModel m) {
        return rep.save(m);
    }

    @Override
    public void delete(int id) {
        rep.delete(id);
    }

    @Override
    public FieldsStudModel edit(FieldsStudModel m) {
        return rep.save(m);
    }

    @Override
    public List<FieldsStudModel> getAll() {
        return rep.findAll();
    }
}
