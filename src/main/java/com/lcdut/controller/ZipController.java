package com.lcdut.controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import static com.lcdut.helpers.WorkFolder.WORK_FOLDER_DOC;

@RestController
public class ZipController {
    @RequestMapping(value = "/zip/students", method = RequestMethod.POST)
    public void zip(@RequestBody Object obj) {

        List<Object> list = (List<Object>)obj;

        String s=list.get(0).toString();
        s = s.substring(s.indexOf("[") + 1);
        s = s.substring(0, s.indexOf("]"));

        String s2=list.get(0).toString().split("=")[2];

        try (ZipOutputStream zout = new ZipOutputStream(new FileOutputStream(
                WORK_FOLDER_DOC +Integer.parseInt(s2.replaceAll("}", ""))+".zip"))) {
            for (int i = 0; i < s.split(",").length; i++) {
                addFile(WORK_FOLDER_DOC, Integer.parseInt(s.split(",")[i].replaceAll(" ", ""))+".docx", zout);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    private static void addFile(String folder, String fileName, ZipOutputStream stream)
            throws IOException {
        // Creating next entry in zip file
        stream.putNextEntry(new ZipEntry(fileName));

        byte[] buffer = new byte[1024];
        int count;

        try (FileInputStream in = new FileInputStream(folder + fileName)) {
            while ((count = in.read(buffer)) > 0) {
                stream.write(buffer, 0, count);
            }
        }
        stream.closeEntry();
    }
}
