package com.lcdut.service;

import com.lcdut.model.GroupsModel;
import com.lcdut.model.StudentsModel;

import java.util.List;


public interface GroupService {
    GroupsModel addGroup(GroupsModel groupsModel);
    void delete(int id);
    GroupsModel editGroup(GroupsModel groupsModel);
    List<GroupsModel> getAll();
    List<GroupsModel> getByIdSpec(int id);
    List<GroupsModel> findByName(String name);
    GroupsModel findById(int id);
    GroupsModel getById(int id);
    List<GroupsModel> compareGroups(List<GroupsModel> list, StudentsModel stud);
}
