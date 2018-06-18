package com.lcdut.repository;


import com.lcdut.model.GroupsModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GroupRepository extends JpaRepository<GroupsModel, Integer> {
    List<GroupsModel> findByIdSpec(int idSpec);
    List<GroupsModel> findByName(String name);
    GroupsModel findById(int id);
}