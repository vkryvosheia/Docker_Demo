package com.dockerwear.service;

import com.dockerwear.Model.Color;
import com.dockerwear.dao.ColorDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ColorServiceImpl implements ColorService{

    @Autowired
    private ColorDao colorDao;

    @Override
    public List<Color> findAll(Iterable<Integer> integers) {
        return colorDao.findAll(integers);
    }

    @Override
    public List<Color> findAll() {
        return colorDao.findAll();
    }
}
