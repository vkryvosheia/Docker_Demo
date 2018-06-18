package com.lcdut.repository;


import com.lcdut.model.SpecModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SpecRepository extends JpaRepository<SpecModel, Integer> {

}