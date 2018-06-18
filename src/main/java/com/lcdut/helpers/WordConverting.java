package com.lcdut.helpers;

import java.io.File;
import org.docx4j.Docx4J;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.samples.AbstractSample;

public class WordConverting extends AbstractSample {

    public void convertFile(String file) {
        inputfilepath = System.getProperty("user.dir") + "/src/main/webapp/documents/"+file+".xml";

        String outputfilepath = System.getProperty("user.dir") + "/src/main/webapp/documents/"+file+".docx";

        try {
            WordprocessingMLPackage wmlPackage = Docx4J.load(new File(inputfilepath));
            Docx4J.save(wmlPackage, new File(outputfilepath), Docx4J.FLAG_SAVE_ZIP_FILE);
            System.out.println("Saved: " + outputfilepath);

        } catch (Exception exc) {
            exc.printStackTrace();
            throw new RuntimeException(exc);
        }

    }



}

