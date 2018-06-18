package com.lcdut.controller;


import com.lcdut.model.SpecModel;

import com.lcdut.service.SpecService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.List;


@RestController
public class SpecController {
    @Autowired
    private SpecService specService;



    @RequestMapping("/c_specs")
    public List<SpecModel> getAll() {
        return specService.getAll();
    }
    
    @RequestMapping("/c_spec/{id}")
    public SpecModel getById(@PathVariable int id){
        System.out.println(id);
        return specService.getById(id);
    }

    @RequestMapping("/c_delete_spec/{id}")
    public void delete(@PathVariable int id){
        specService.delete(id);
    }

    @RequestMapping(value = "/c_add_spec", method = RequestMethod.POST)
    public SpecModel addSpec(@RequestBody SpecModel specModel){
        return specService.addSpec(specModel);
    }

    @RequestMapping(value = "/c_update_spec", method = RequestMethod.POST)
    public SpecModel editSpec(@RequestBody SpecModel specModel){
        return specService.editSpec(specModel);
    }
}