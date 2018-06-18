package com.lcdut.controller;

import com.lcdut.model.EducationLevelModel;
import com.lcdut.service.EducationLevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class EducationLevelController {
    @Autowired
    EducationLevelService service;

     @RequestMapping("/educat_level/getall")
    public List<EducationLevelModel> getAll(){
         return service.getAll();
     }

     @RequestMapping(value = "/educat_level/add",method = RequestMethod.POST)
     public EducationLevelModel add(@RequestBody EducationLevelModel m){
         return service.addEducationLevel(m);
     }

     @RequestMapping(value = "/educat_level/edit", method = RequestMethod.POST)
     public EducationLevelModel edit(@RequestBody EducationLevelModel m){
         return service.editEducationLevel(m);
     }

     @RequestMapping("/educat_level/delete/{id}")
     public void delete(@PathVariable int id){
         service.delete(id);
     }


}
