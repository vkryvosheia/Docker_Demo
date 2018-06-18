package com.lcdut.controller;

import com.lcdut.model.DocumentsModel;
import com.lcdut.service.DocumentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class DocumentController {

    @Autowired
    DocumentsService service;


    @RequestMapping(value = "/documents/add", method = RequestMethod.POST)
    public DocumentsModel add(@RequestBody DocumentsModel d){
        return service.addDocument(d);
    }

    @RequestMapping("/documents/getall")
    public List<DocumentsModel> getAll(){
        return service.getAll();
    }

    @RequestMapping(value = "/documents/edit", method = RequestMethod.POST)
    public DocumentsModel edit(@RequestBody DocumentsModel d){
        return service.editDocument(d);
    }

    @RequestMapping("/documents/delete/{id}")
    public void delete(@PathVariable int id){
        service.delete(id);
    }
}
