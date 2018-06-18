package com.lcdut.controller;

import com.lcdut.model.StudentsModel;
import com.lcdut.service.GroupService;
import com.lcdut.service.StudentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class StudentController {
    @Autowired
    private StudentsService studentsService;

    @Autowired
    private GroupService groupService;

    @RequestMapping("/c_students")
    public List<StudentsModel> getAll(){
        return studentsService.getAll();
    }

    @RequestMapping("/c_student/{id}")
    public StudentsModel getById(@PathVariable int id){
        return studentsService.getById(id);
    }

    @RequestMapping("/c_student_by_group/{id}")
    public List<StudentsModel> getByIdGroup(@PathVariable int id){
        return studentsService.getByIdGroup(id);
    }

    @RequestMapping("/c_delete_student/{id}")
    public void delete(@PathVariable int id){
        studentsService.delete(id);
    }

    @RequestMapping(value = "/c_add_student", method = RequestMethod.POST)
    public String addStudent(@RequestParam("pib") String pib, @RequestParam("date_of_birth") String dateOfBirth, @RequestParam("place_of_birth") String placeOfBirth, @RequestParam("place_of_living") String placeOfLiving, @RequestParam("institute") String institute, @RequestParam("training_direction") String trainingDirection, @RequestParam("level") String level, @RequestParam("way_of_training") String wayOfTraining, @RequestParam("group") String group, @RequestParam("term") String term){
       StudentsModel student = new StudentsModel();
       student.setPib(pib);
       student.setDateOfBirth(dateOfBirth);
       student.setPlaceOfBirth(placeOfBirth);
       student.setAddressOfResidence(placeOfLiving);
       student.setInstitute(institute);
       student.setTrainingDirection(trainingDirection);
       System.out.println("          " + group.length());
       if(group.length()==11) {
           student.setIdGroup(Character.getNumericValue(group.charAt(10)));
       }else if(group.length()==12){
           int one = Character.getNumericValue(group.charAt(10));
           int two = Character.getNumericValue(group.charAt(11));
           String res = String.valueOf(one).concat(String.valueOf(two));
            student.setIdGroup(Integer.parseInt(res));
       }
       student.setTerm(Integer.parseInt(term));
        studentsService.addStudent(student);


        return "added";
    }

    @RequestMapping(value = "/c_update_student", method = RequestMethod.POST)
    public StudentsModel editStudent(@RequestBody StudentsModel studentsModel){
        return studentsService.editStudent(studentsModel);
    }

    @RequestMapping(value = "/c_update_student_decree", method = RequestMethod.POST)
    public StudentsModel editStudentDecree(@RequestParam("idst") String idst, @RequestParam("decree0") String decree0, @RequestParam("decree1") String decree1, @RequestParam("decree2") String decree2){

        StudentsModel student = studentsService.getById(Integer.parseInt(idst));


        student.setTransfer_to_sec_year(decree0);
        student.setTransfer_to_third_year(decree1);
        student.setTransfer_to_fourth_year(decree2);



        return  studentsService.editStudent(student);
    }
}
