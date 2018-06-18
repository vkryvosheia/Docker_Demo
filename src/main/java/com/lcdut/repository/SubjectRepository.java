package com.lcdut.repository;

import com.lcdut.model.SubjectsModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubjectRepository extends JpaRepository<SubjectsModel, Integer> {
    List<SubjectsModel> findByGroupsAndSemester(int idGroup, int idSemester);
    List<SubjectsModel> findByGroups(int idGroup);
    List<SubjectsModel> findByGroupsAndTypeOfTest(int idGroup, String type);
}