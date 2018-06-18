package com.lcdut.helpers.XmlParser;

import com.lcdut.model.StudentsModel;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import static com.lcdut.helpers.WorkFolder.WORK_FOLDER;

public class AddImage {
    public AddImage(NodeList firstNodeList2, StudentsModel stud) throws IOException {
        BufferedImage image=this.getImage(stud);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(image, "jpg", baos);
        String encodedImage = Base64.encode(baos.toByteArray());
        for (int i = 0; i < firstNodeList2.getLength(); i++) {
            if (firstNodeList2.item(i).getTextContent().equals("image")) {
                firstNodeList2.item(i).setTextContent(encodedImage);
            }
        }
    }
    private BufferedImage getImage(StudentsModel stud)throws IOException{
        BufferedImage image;
        try {
            image = ImageIO.read(new File(WORK_FOLDER+"/src/main/webapp/images/" + stud.getId() + ".jpg"));
        } catch (Exception e) {
            image = ImageIO.read(new File(WORK_FOLDER+"/src/main/webapp/images/default.jpg"));
        }
        return image;
    }
}
