package com.lcdut.service;


import com.lcdut.model.FieldsStudModel;

import java.util.List;

public interface FieldsStudService {
    FieldsStudModel addFieldsStud(FieldsStudModel m);
    void delete(int  id);
    FieldsStudModel edit(FieldsStudModel m);
    List<FieldsStudModel> getAll();
}
