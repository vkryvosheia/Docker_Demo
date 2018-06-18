package com.lcdut.controller;

import com.lcdut.model.FieldsStudModel;
import com.lcdut.repository.FieldsStudRepository;
import com.lcdut.service.FieldsStudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class FieldsStudController {

    @Autowired
    FieldsStudService service;

    @RequestMapping("/fieldsstud/getall")
    public List<FieldsStudModel> getAll(){
        return service.getAll();
    }

    @RequestMapping(value = "/fieldsstud/add", method = RequestMethod.POST)
    public FieldsStudModel add(@RequestBody FieldsStudModel f){
        return service.addFieldsStud(f);
    }

    @RequestMapping(value = "/fieldsstud/delete/{id}", method = RequestMethod.GET)
    public void delete(@PathVariable int id){
        service.delete(id);
    }

    @RequestMapping(value = "/fieldsstud/edit", method = RequestMethod.POST)
    public FieldsStudModel edit(@RequestBody FieldsStudModel f){
        return service.edit(f);

    }
}
