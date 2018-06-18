package com.lcdut.service;


import com.lcdut.model.AdditionalMarkInfoModel;
import com.lcdut.model.PointMarksModel;

import java.util.List;

public interface AdditionalMarksService {
    List<AdditionalMarkInfoModel> findAll();
    void delete(int id);
    void deleteByIdStudAndIdSemAndIdGroup(int idStud, int idSem, int idGroup);
    Double findByIdStudAndIdSemAndIdGroup(int idStud, int idSem, int idGroup);
    List<PointMarksModel> findByIdStudAndIdSemAndIdGroupList(int idStud, int idSem, int idGroup);
    PointMarksModel addMark(PointMarksModel pointMarksModel);
}
