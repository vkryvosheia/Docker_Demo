package com.lcdut.repository;


import com.lcdut.model.StudentsModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentRepository extends JpaRepository<StudentsModel, Integer> {
    List<StudentsModel> findByIdGroup(int id);
}