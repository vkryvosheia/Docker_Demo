package com.lcdut.service.impl;

import com.lcdut.model.DecreeModel;
import com.lcdut.repository.DecreesRepository;
import com.lcdut.service.DecreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class DecreeServiceImpl implements DecreeService {

    @Autowired
    DecreesRepository repository;


    @Override
    public DecreeModel add(DecreeModel model) {
        return repository.save(model);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

    @Override
    public DecreeModel find(int id) {
        return repository.findOne(id);
    }

    @Override
    public List<DecreeModel> findAll() {
        return repository.findAll();
    }
}
