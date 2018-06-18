package com.lcdut.controller;

import com.lcdut.model.CompetitionModel;
import com.lcdut.service.CompetitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CompetitionController {

    @Autowired
    CompetitionService service;


    @RequestMapping("/competition/findall")
    public List<CompetitionModel> getAll(){
        return service.getAll();
    }

    @RequestMapping(value = "/competition/add", method = RequestMethod.POST)
    public CompetitionModel add(@RequestBody CompetitionModel m){
        return service.addCompetition(m);
    }

    @RequestMapping(value = "/competition/edit", method = RequestMethod.POST)
    public CompetitionModel edit(@RequestBody CompetitionModel m){
        return service.editCompetition(m);
    }

    @RequestMapping("/competition/delete/{id}")
    public void delete(@PathVariable int id){
        service.delete(id);
    }
}
