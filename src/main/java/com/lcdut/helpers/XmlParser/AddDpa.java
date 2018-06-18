package com.lcdut.helpers.XmlParser;

import com.lcdut.model.SubjectsModel;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import java.util.List;

public class AddDpa {
    public AddDpa(Document doc, Node dpa, List<List<SubjectsModel>> subjectsModel) {
        System.out.println(subjectsModel.size());
        for (int i=4, i2=0; i<subjectsModel.size()+4; i++, i2++){
            for(int i3=0; i3<subjectsModel.get(i2).size(); i3++){
                if(subjectsModel.get(i2).size()>0) {
                    Element el0 = doc.createElement("w:r");
                    Element el1 = doc.createElement("w:t");
                    Element el2 = doc.createElement("w:r");
                    Element el3 = doc.createElement("w:t");
                    dpa.getChildNodes().item(i).getChildNodes().item(0).getChildNodes().item(1).appendChild(el0).appendChild(el1).setTextContent(String.valueOf(i2+1));
                    dpa.getChildNodes().item(i).getChildNodes().item(1).getChildNodes().item(1).appendChild(el2).appendChild(el3).setTextContent(String.valueOf(subjectsModel.get(i2).get(i3).getNameOfSubject()));
                }
            }
        }
    }
}
