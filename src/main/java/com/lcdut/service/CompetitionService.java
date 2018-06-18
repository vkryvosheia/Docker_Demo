package com.lcdut.service;

import com.lcdut.model.CompetitionModel;

import java.util.List;

public interface CompetitionService {
    CompetitionModel addCompetition(CompetitionModel m);
    CompetitionModel editCompetition(CompetitionModel m);
    void delete(int id);
    List<CompetitionModel> getAll();
}
