package com.lcdut.repository;


import com.lcdut.model.PointMarksModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AdditionalMarkRepository extends JpaRepository<PointMarksModel, Integer>{
    List<PointMarksModel> findByIdStudAndIdSemAndIdGroup(int idStud, int idSem, int idGroup);
    @Transactional
    void deleteByIdStudAndIdSem(int idStud, int idSem);
}
