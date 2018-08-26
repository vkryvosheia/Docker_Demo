package com.dockerwear.service;


import com.dockerwear.Model.Color;

import java.util.List;

public interface ColorService {
    List<Color> findAll(Iterable<Integer> integers);
    List<Color> findAll();
}
