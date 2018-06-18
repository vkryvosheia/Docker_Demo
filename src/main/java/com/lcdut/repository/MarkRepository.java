package com.lcdut.repository;

import com.lcdut.model.MarksModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface MarkRepository extends JpaRepository<MarksModel, Integer> {
    List<MarksModel> findByIdGroupAndIdSem(int id, int idSem);
    List<MarksModel> findByIdStud(int id);
    MarksModel findByIdStudAndIdSubject(int idStud, int idSubject);
}