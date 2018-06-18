package com.lcdut.service;


import com.lcdut.model.DecreeModel;

import java.util.List;

public interface DecreeService {

    DecreeModel add(DecreeModel model);
    void delete(int id);
    DecreeModel find(int id);
    List<DecreeModel> findAll();

}
