package com.lcdut.service;

import com.lcdut.model.UserRole;

import java.util.List;

public interface UserRoleService {

    UserRole findById(int id);
    void delete(int id);
    List<UserRole> findAll();
}
