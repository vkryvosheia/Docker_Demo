package com.lcdut.service;

import com.lcdut.model.User;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserService {

    User findById(int id);
    void delete(int id);
    List<User> findAll();
    User findByName(String name);


}
