package com.lcdut.helpers.XmlParser;

import com.lcdut.model.StudentsModel;
import com.lcdut.model.SubjectsModel;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import java.util.ArrayList;
import java.util.List;

public class AddPractices {
    public AddPractices(Document doc, Node dpa, List<List<SubjectsModel>> subjectsModel) {
        System.out.println(subjectsModel.size());
        for(int i=0, i3=0; i<subjectsModel.size(); i3++, i++){
            for(int i2=0; i2<subjectsModel.get(i).size(); i2++){
                    Element el0 = doc.createElement("w:r");
                    Element el1 = doc.createElement("w:t");
                    Element el2 = doc.createElement("w:r");
                    Element el3 = doc.createElement("w:t");
                    dpa.getChildNodes().item(i3+3).getChildNodes().item(0).getChildNodes().item(1).appendChild(el0).appendChild(el1).setTextContent(String.valueOf(i3));
                    dpa.getChildNodes().item(i3+3).getChildNodes().item(1).getChildNodes().item(1).appendChild(el2).appendChild(el3).setTextContent(String.valueOf(subjectsModel.get(i).get(i2).getNameOfSubject()));
                if(subjectsModel.get(i).size()>1){
                    i3++;
                }
            }
        }

    }
}
