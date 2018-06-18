package com.lcdut.controller;

import com.lcdut.model.GroupsModel;
import com.lcdut.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class GroupController{
    @Autowired
    private GroupService groupService;

    @RequestMapping("/c_groups")
    public List<GroupsModel> getAll(){
        return groupService.getAll();
    }

    @RequestMapping("/c_group_by_spec/{id}")
    public List<GroupsModel> getByIdSpec(@PathVariable int id){
        return groupService.getByIdSpec(id);
    }

    @RequestMapping("/c_delete_group/{id}")
    public void delete(@PathVariable int id){
        groupService.delete(id);
    }

    @RequestMapping(value = "/c_add_group", method = RequestMethod.POST)
    public GroupsModel addGroup(@RequestBody GroupsModel groupsModel){
        return groupService.addGroup(groupsModel);
    }

    @RequestMapping(value = "/c_update_group", method = RequestMethod.POST)
    public GroupsModel editGroup(@RequestBody GroupsModel groupsModel){
        return groupService.editGroup(groupsModel);
    }

    }

