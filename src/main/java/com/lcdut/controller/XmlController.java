package com.lcdut.controller;

import java.io.*;
import java.util.*;
import java.util.stream.Collectors;
import javax.persistence.criteria.CriteriaBuilder;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import com.lcdut.helpers.XmlParser.*;
import com.lcdut.helpers.WordConverting;
import com.lcdut.model.GroupsModel;
import com.lcdut.model.StudentsModel;
import com.lcdut.model.SubjectsModel;
import com.lcdut.service.GroupService;
import com.lcdut.service.MarksService;
import com.lcdut.service.StudentsService;
import com.lcdut.service.SubjectsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.Document;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import static com.lcdut.helpers.WorkFolder.WORK_FOLDER_DOC;

@RestController
public class XmlController{

    @Autowired
    private StudentsService service;
    @Autowired
    private GroupService groupService;
    @Autowired
    private SubjectsService subjectsService;
    @Autowired
    private MarksService marksService;

    @RequestMapping("/c_student/parse/{id}")
    public int parse(@PathVariable int id) {

        StudentsModel stud = service.getById(id);

        try{
            File inputFile = new File("documents/maket.xml");
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
            Document doc = docBuilder.parse(inputFile);
            NodeList zeroNodeList = doc.getElementsByTagName("w:tbl");
            NodeList firstNodeList = doc.getElementsByTagName("w:t");
            NodeList firstNodeList2 = doc.getElementsByTagName("pkg:binaryData");
            Node subject=zeroNodeList.item(1);
            Node dpa=zeroNodeList.item(4);
            Node pract=zeroNodeList.item(2);
            new AddImage(firstNodeList2, stud);


            ArrayList<Integer> semesters = new ArrayList<>();

            for(int i=1, i2=1; i<=subject.getChildNodes().getLength(); i++){
                try{
                    if(String.valueOf(subject.getChildNodes().item(i).getChildNodes().item(3).getChildNodes().item(1).getChildNodes().item(1).getChildNodes().item(1).getTextContent()).equals("S"+i2)){
                        i2++;
                        semesters.add(i);
                    }

                }catch (NullPointerException ignored){
                }
            }

            new AddYears(subject, stud);

            ArrayList<GroupsModel> groupsActive = new ArrayList<>();
            int idSpec=0;
            for(int groupId=0; groupId<groupService.getAll().size(); groupId++){
                if(groupService.getAll().get(groupId).getId()==stud.getIdGroup()){
                    idSpec=groupService.getAll().get(groupId).getId_spec();
                }
            }
            List<GroupsModel> groups=groupService.compareGroups(groupService.getByIdSpec(idSpec), stud);
            groupsActive.addAll(groups.stream().filter(group -> group.getId() <= stud.getIdGroup()).collect(Collectors.toList()));
            List<List<SubjectsModel>> subjects=new ArrayList<>();
            List<List<SubjectsModel>> dpaList=new ArrayList<>();
            List<List<SubjectsModel>> practList=new ArrayList<>();
            for (int i=0; i<groupsActive.size(); i++){
                int term=2;
                if (i == (groupsActive.size()-1)) {
                    term=stud.getTerm();
                }
                List<SubjectsModel> dpaDb=subjectsService.getByIdGroupAndTypeOfTest((int) groupsActive.get(i).getId(), "ДПА");
                dpaList.add(dpaDb);
                List<SubjectsModel> practDb=subjectsService.getByIdGroupAndTypeOfTest((int) groupsActive.get(i).getId(), "Практика");
                practList.add(practDb);
                for(int termStud=1; termStud<=term; termStud++) {
                        List<SubjectsModel> subjectDb = subjectsService.getByIdGroupAndIdSemester((int) groupsActive.get(i).getId(), termStud);
                        subjects.add(subjectDb);
                }
            }
            for(int list=0; list<subjects.size(); list++){
                for (int i=0, i2=semesters.get(list); i<subjects.get(list).size(); i++, i2++){
                    String mark=null;
                    try{
                        mark=String.valueOf(marksService.getByIdStudentAndIdSubject(stud.getId(), subjects.get(list).get(i).getId()).getMark());
                    }catch (NullPointerException ignored){}
//                    subject.getChildNodes().item(i2).getChildNodes().item(3).getChildNodes().item(1).getChildNodes().item(1).getChildNodes().item(1).setTextContent(subjects.get(list).get(i).getNameOfSubject());
                    if(i==0){
                        subject.getChildNodes().item(i2).getChildNodes().item(3).getChildNodes().item(1).getChildNodes().item(1).getChildNodes().item(1).setTextContent(subjects.get(list).get(i).getNameOfSubject());
                    }else {
                        new AddElements(doc, subject, i2, 3, subjects.get(list).get(i).getNameOfSubject());
                    }

                    new AddElements(doc, subject, i2, 4, String.valueOf(subjects.get(list).get(i).getAmountOfHours()));
                    new AddElements(doc, subject, i2, 5, String.valueOf(Math.rint(100.0 * (double)subjects.get(list).get(i).getAmountOfHours()/36) / 100.0));
                    new AddElements(doc, subject, i2, 7, mark);
                }
            }

            for (int i = 0; i < firstNodeList.getLength(); i++) {

                Node node = firstNodeList.item(i);

                switch (node.getTextContent()){
                    case "inst":
                        node.setTextContent(stud.getInstitute());
                        break;
                    case "lev":
                        node.setTextContent(stud.getEducationLevel());
                        break;
                    case "trainway":
                        node.setTextContent(stud.getTrainingDirection());
                        break;
                    case "spec":
                        node.setTextContent(stud.getSpecialty());
                        break;
                    case "special":
                        node.setTextContent(null);
                        break;
                    case "nam":
                        node.setTextContent(stud.getPib());
                        break;
                    case "date":
                        node.setTextContent(stud.getDateOfBirth());
                        break;
                    case "place":
                        node.setTextContent(stud.getPlaceOfBirth());
                        break;
                    case "nation":
                        node.setTextContent(stud.getCitizenship());
                        break;
                    case "educ":
                        node.setTextContent(stud.getEducationLevel());
                        break;
                    case "marital":
                        node.setTextContent(stud.getFamilyStatus());
                        break;
                    case "placeOfLiving":
                        node.setTextContent(stud.getAddressOfResidence());
                        break;
                    case "benefits":
                        node.setTextContent(stud.getPrivilegesForAdmission());
                        break;
                    case "transfer":
                        node.setTextContent(stud.getTransferFrom());
                        break;
                    case "direction":
                        node.setTextContent(stud.getByDirection());
                        break;
                    case "provided":
                        node.setTextContent(stud.getSpecialConditions());
                        break;
                    case "out":
                        node.setTextContent(stud.getOutOfCompetition());
                        break;
                    case "employment":
                        node.setTextContent(stud.getEmploymentHistory());
                        break;
                    case "card":
                        node.setTextContent(stud.getTaxes());
                        break;
                    case "dec_sec_transfer":
                        node.setTextContent(stud.getTransfer_to_sec_year());
                        System.out.println("it caught");
                        break;
                    case "third":
                        node.setTextContent(stud.getTransfer_to_third_year());
                        System.out.println("caught again");
                        break;
                    case "dec_fourth_transfer" :
                        node.setTextContent(stud.getTransfer_to_fourth_year());
                        System.out.println("wooow, and again");
                }
            }

            new AddPractices(doc, pract, practList);
            new AddDpa(doc, dpa, dpaList);
            TransformerFactory transFact = TransformerFactory.newInstance();
            Transformer transformer = transFact.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult streamResult = new StreamResult(new File(WORK_FOLDER_DOC + stud.getId() + ".xml"));
            transformer.transform(source, streamResult);

            WordConverting wordConverting=new WordConverting();
            wordConverting.convertFile(String.valueOf(stud.getId()));
            return 1;

        } catch(Exception en) {
            en.printStackTrace();
            return 0;
        }
    }
}

