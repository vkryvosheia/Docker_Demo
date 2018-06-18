package com.lcdut.helpers.XmlParser;

import com.lcdut.model.StudentsModel;

import org.w3c.dom.Node;
import java.util.ArrayList;
import java.util.List;

public class AddYears {
    public AddYears(Node subject, StudentsModel stud) {
        List<List> yearsTr = new ArrayList<>();
        for(int i=1; i<=subject.getChildNodes().getLength(); i++){
            try{
                if(subject.getChildNodes().item(i).getChildNodes().item(1).getChildNodes().item(1).getChildNodes().item(4).getChildNodes().item(1).getTextContent().charAt(0)=='y'){
                    List<Integer> arr=new ArrayList<>();
                    arr.add(i);
                    arr.add(Character.getNumericValue(subject.getChildNodes().item(i).getChildNodes().item(1).getChildNodes().item(1).getChildNodes().item(4).getChildNodes().item(1).getTextContent().charAt(1)));
                    yearsTr.add(arr);
                }
                if(subject.getChildNodes().item(i).getChildNodes().item(1).getChildNodes().item(1).getChildNodes().item(8).getChildNodes().item(1).getTextContent().charAt(0)=='y'){
                    List<Integer> arr=new ArrayList<>();
                    arr.add(i);
                    arr.add(Character.getNumericValue(subject.getChildNodes().item(i).getChildNodes().item(1).getChildNodes().item(1).getChildNodes().item(8).getChildNodes().item(1).getTextContent().charAt(1)));
                    yearsTr.add(arr);
                }
            }catch (NullPointerException ignored){
            }
        }
        for(List currentYear:yearsTr){
            if(subject.getChildNodes().item((Integer) currentYear.get(0)).getChildNodes().item(1).getChildNodes().item(1).getChildNodes().item(4).getChildNodes().item(1).getTextContent().equals("y"+currentYear.get(1))){
                subject.getChildNodes().item((Integer) currentYear.get(0)).getChildNodes().item(1).getChildNodes().item(1).getChildNodes().item(4).getChildNodes().item(1).setTextContent(String.valueOf(stud.getYear()+(int)currentYear.get(1)-1));
            }
            if(subject.getChildNodes().item((Integer) currentYear.get(0)).getChildNodes().item(1).getChildNodes().item(1).getChildNodes().item(8).getChildNodes().item(1).getTextContent().equals("y"+currentYear.get(1))){
                subject.getChildNodes().item((Integer) currentYear.get(0)).getChildNodes().item(1).getChildNodes().item(1).getChildNodes().item(8).getChildNodes().item(1).setTextContent(String.valueOf(stud.getYear()+(int)currentYear.get(1)-1));
            }
        }
    }
}
