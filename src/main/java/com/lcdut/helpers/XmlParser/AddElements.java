package com.lcdut.helpers.XmlParser;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

public class AddElements {
    public AddElements(Document doc, Node subject, int tr, int col, String element) throws Exception{
        try {
            Element el = doc.createElement("w:r");
            Element el2 = doc.createElement("w:t");
//            Element el3=doc.createElement("w:rPr");
//            Element el4=doc.createElement("w:sz");
//            subject.getChildNodes()
//                    .item(tr).getChildNodes()
//                    .item(col).getChildNodes()
//                    .item(1).appendChild(el).appendChild(el3).appendChild(el4).getParentNode().set;
            subject.getChildNodes()
                    .item(tr).getChildNodes()
                    .item(col).getChildNodes()
                    .item(1).appendChild(el).appendChild(el2).setTextContent(element);
        }catch (NullPointerException ignored){

        }
    }
}
