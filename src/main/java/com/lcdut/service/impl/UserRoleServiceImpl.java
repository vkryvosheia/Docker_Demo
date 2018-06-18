package com.lcdut.service.impl;

import com.lcdut.model.UserRole;
import com.lcdut.repository.UserRoleRepository;
import com.lcdut.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserRoleServiceImpl implements UserRoleService{

    @Autowired
    UserRoleRepository repository;

    @Override
    public UserRole findById(int id) {
        return repository.findOne(id);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

    @Override
    public List<UserRole> findAll() {
        return repository.findAll();
    }
}
