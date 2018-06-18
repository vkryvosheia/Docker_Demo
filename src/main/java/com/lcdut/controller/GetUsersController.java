package com.lcdut.controller;

import com.lcdut.model.UserRole;
import com.lcdut.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class GetUsersController {

    @Autowired
    UserRoleService service;

    @RequestMapping("/get_all_users")
    public List<UserRole> getAllUsers(){
        List<UserRole> list = service.findAll();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getUser().getUsername());
        }

        return list;
    }


}
