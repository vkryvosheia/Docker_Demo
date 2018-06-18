package com.lcdut.repository;


import com.lcdut.model.DecreeModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DecreesRepository extends JpaRepository<DecreeModel, Integer> {
}
