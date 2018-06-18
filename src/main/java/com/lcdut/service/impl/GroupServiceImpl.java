package com.lcdut.service.impl;


import com.lcdut.model.GroupsModel;
import com.lcdut.model.StudentsModel;
import com.lcdut.repository.GroupRepository;
import com.lcdut.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GroupServiceImpl implements GroupService {
    @Autowired
    private GroupRepository groupRepository;

    @Override
    public GroupsModel addGroup(GroupsModel groupsModel) {
        return groupRepository.save(groupsModel);
    }

    @Override
    public void delete(int id) {
        groupRepository.delete(id);
    }

    @Override
    public GroupsModel editGroup(GroupsModel groupsModel) {
        return groupRepository.saveAndFlush(groupsModel);
    }

    @Override
    public List<GroupsModel> getAll() {
        return groupRepository.findAll();
    }

    @Override
    public List<GroupsModel> getByIdSpec(int id) {
        return groupRepository.findByIdSpec(id);
    }

    @Override
    public GroupsModel getById(int id) {
        return groupRepository.findById(id);
    }

    @Override
    public List<GroupsModel> compareGroups(List<GroupsModel> list, StudentsModel stud) {
            List<GroupsModel> groups = new ArrayList<>();
            GroupsModel group=getById(stud.getIdGroup());
            for (GroupsModel aList : list) {
                int adding = 1;
                for (GroupsModel groupsModel : groups) {
                    if (aList.getName().charAt(3)==groupsModel.getName().charAt(3)) {
                        adding = 0;
                    }
                }

                System.out.println(aList.getName().charAt(4));
                System.out.println(group.getName().charAt(4));
                if (adding==1 && aList.getName().charAt(4)==group.getName().charAt(4)) {
                    groups.add(aList);
                }
            }
            return groups;
    }

    @Override
    public List<GroupsModel> findByName(String name) {
        return groupRepository.findByName(name);
    }

    @Override
    public GroupsModel findById(int id) {
        return groupRepository.findById(id);
    }

}
