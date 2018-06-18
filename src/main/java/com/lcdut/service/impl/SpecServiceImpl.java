package com.lcdut.service.impl;

import com.lcdut.model.SpecModel;
import com.lcdut.repository.SpecRepository;
import com.lcdut.service.SpecService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpecServiceImpl implements SpecService {
    @Autowired
    private SpecRepository specRepository;

    @Override
    public SpecModel addSpec(SpecModel specModel) {
        return specRepository.save(specModel);
    }

    @Override
    public void delete(int id) {
        specRepository.delete(id);
    }

    @Override
    public SpecModel editSpec(SpecModel specModel) {
        return specRepository.saveAndFlush(specModel);
    }

    @Override
    public List<SpecModel> getAll() {
        return specRepository.findAll();
    }

    @Override
    public SpecModel getById(int id) {
        return specRepository.getOne(id);
    }
}
