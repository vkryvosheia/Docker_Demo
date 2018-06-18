package com.lcdut.service.impl;

import com.lcdut.model.CompetitionModel;
import com.lcdut.repository.CompetitionRepository;
import com.lcdut.service.CompetitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompetitionServiceImpl implements CompetitionService{

    @Autowired
    CompetitionRepository repository;

    @Override
    public CompetitionModel addCompetition(CompetitionModel m) {
        return null;
    }

    @Override
    public CompetitionModel editCompetition(CompetitionModel m) {
        return null;
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

    @Override
    public List<CompetitionModel> getAll() {
        return repository.findAll();
    }
}
