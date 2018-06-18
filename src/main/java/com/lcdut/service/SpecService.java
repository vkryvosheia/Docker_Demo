package com.lcdut.service;

import com.lcdut.model.SpecModel;

import java.util.List;

public interface SpecService {
    SpecModel addSpec(SpecModel specModel);
    void delete(int id);
    SpecModel editSpec(SpecModel specModel);
    List<SpecModel> getAll();
    SpecModel getById(int id);
}
