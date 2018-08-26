package com.dockerwear.dao;

import com.dockerwear.Model.Color;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ColorDao extends JpaRepository<Color, Integer> {

    @Override
    List<Color> findAll(Iterable<Integer> integers);

    @Override
    List<Color> findAll();
}
