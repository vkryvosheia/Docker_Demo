package com.lcdut.controller;

import com.lcdut.model.GroupsModel;
import com.lcdut.model.StudentsModel;
import com.lcdut.service.GroupService;
import com.lcdut.service.StudentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CharacterEditor;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
public class TransferController {


    @Autowired
    StudentsService studentsService;

    @Autowired
    GroupService groupService;


    @RequestMapping(value = "/transfer_students", method = RequestMethod.POST)
    public @ResponseBody
    List<Integer> uploadFileHandler(@RequestParam("transfer_ids") Object object) {

        String result = (String)object;
        System.out.println(result);
        String[] arrayOfStrings = result.split(",");

        List<Integer> listOfIds = new ArrayList<>();


        for (String s :
                arrayOfStrings) {
            listOfIds.add(Integer.parseInt(s));
        }

        List<StudentsModel> listOfStudents = new ArrayList<>();
        List<GroupsModel> listOfGroups = groupService.getAll();

        for (Integer listOfId : listOfIds) {
            listOfStudents.add(studentsService.getById(listOfId));
        }

        for (int i = 0; i < listOfStudents.size(); i++) {
           int c =  Character.getNumericValue(groupService.findById(listOfStudents.get(i).getIdGroup()).getName().charAt(3));
            c++;


            String s = groupService.findById(listOfStudents.get(i).getIdGroup()).getName();
           char [] chars = s.toCharArray();
            chars[3] = Character.forDigit(c,10);
            String res = String.copyValueOf(chars);


            System.out.println("res = " + res);

            System.out.println(" c =   " + c);


                if(listOfStudents.get(i).getTerm()==1){
                    listOfStudents.get(i).setTerm(2);
                    listOfStudents.get(i).setNumOfTransfers(listOfStudents.get(i).getNumOfTransfers()+1);
                    studentsService.addStudent(listOfStudents.get(i));
                }else if(listOfStudents.get(i).getTerm()==2) {
                    if(listOfStudents.get(i).getYear()-7< listOfStudents.get(i).getYear() - listOfStudents.get(i).getNumOfTransfers()) {
                        listOfStudents.get(i).setIdGroup(groupService.findByName(res).get(0).getId());
                        listOfStudents.get(i).setTerm(1);
                        listOfStudents.get(i).setNumOfTransfers(listOfStudents.get(i).getNumOfTransfers()+1);
                        listOfStudents.get(i).setCurrentYear(listOfStudents.get(i).getCurrentYear()+1);
                        studentsService.addStudent(listOfStudents.get(i));
                    }else{
                        listOfStudents.get(i).setIdGroup(28);
                        listOfStudents.get(i).setNumOfTransfers(listOfStudents.get(i).getNumOfTransfers()+1);
                        studentsService.addStudent(listOfStudents.get(i));
                    }
                }
        }

        List<Integer> list = new ArrayList<>();
        for(int i = 0; i < listOfStudents.size();i++){
            list.add(listOfStudents.get(i).getId());
        }
        return list;
    }
}
