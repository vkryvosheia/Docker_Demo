package com.lcdut.controller;

import com.lcdut.model.SubjectsModel;
import com.lcdut.service.SubjectsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class SubjectController {

    @Autowired
    private SubjectsService subjectsService;

    @RequestMapping("/c_subjects")
    public List<SubjectsModel> getAll(){
        return subjectsService.getAll();
    }

    @RequestMapping("/c_subject_by_group_and_sem/{idGroup}/{idSemester}")
    public List<SubjectsModel> getByIdGroupAndIdSemester(@PathVariable int idGroup, @PathVariable int idSemester){
        return subjectsService.getByIdGroupAndIdSemester(idGroup, idSemester);
    }
    @RequestMapping("/c_subject_by_group/{idGroup}")
    public List<SubjectsModel> getByIdGroup(@PathVariable int idGroup){
        return subjectsService.getByIdGroup(idGroup);
    }

    @RequestMapping("/c_delete_subject/{id}")
    public void delete(@PathVariable int id){
        subjectsService.delete(id);
    }

    @RequestMapping(value = "/c_add_subject", method = RequestMethod.POST)
    public SubjectsModel addSubject(@RequestBody SubjectsModel subjectsModel){
        return subjectsService.addSubject(subjectsModel);
    }

    @RequestMapping(value = "/c_edit_subject", method = RequestMethod.POST)
    public SubjectsModel editSubject(@RequestBody SubjectsModel subjectsModel){
        return subjectsService.editSubject(subjectsModel);
    }
}
