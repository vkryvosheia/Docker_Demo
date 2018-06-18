package com.lcdut.controller;

import com.lcdut.model.DecreeModel;
import com.lcdut.service.DecreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class DecreeController {

    @Autowired
    DecreeService service;

@RequestMapping("/get_all_decrees")
    public List<DecreeModel> getAllDecrees(){

    return service.findAll();
}

}
