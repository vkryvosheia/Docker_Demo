package com.lcdut.service.impl;

import com.lcdut.model.AdditionalMarkInfoModel;
import com.lcdut.model.PointMarksModel;
import com.lcdut.repository.AdditionalMarkInfoRepository;
import com.lcdut.repository.AdditionalMarkRepository;
import com.lcdut.service.AdditionalMarksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdditionalMarksServiceImpl implements AdditionalMarksService {
    @Autowired
    private AdditionalMarkInfoRepository additionalMarkInfoRepository;
    @Autowired
    private AdditionalMarkRepository pointMarksModelRepository;

    @Override
    public List<AdditionalMarkInfoModel> findAll() {
        return additionalMarkInfoRepository.findAll();
    }

    @Override
    public void delete(int id) {
        pointMarksModelRepository.delete(id);
    }

    @Override
    public void deleteByIdStudAndIdSemAndIdGroup(int idStud, int idSem, int idGroup) {
        pointMarksModelRepository.deleteByIdStudAndIdSem(idStud, idSem);
    }

    @Override
    public Double findByIdStudAndIdSemAndIdGroup(int idStud, int idSem, int idGroup) {
        List<PointMarksModel> listMarks=pointMarksModelRepository.findByIdStudAndIdSemAndIdGroup(idStud, idSem, idGroup);
        double sumMarks=0.0;
        for (int i = 0; i < listMarks.size();i++) {
            System.out.println("mark is : " + listMarks.get(i).getMark());
            //sumMarks += listMarks.get(i).getMark();
        }

        System.out.println(sumMarks);
        if(sumMarks>10){
            sumMarks=10;
        }
        return sumMarks;
    }
    @Override
    public List<PointMarksModel> findByIdStudAndIdSemAndIdGroupList(int idStud, int idSem, int idGroup) {
        return pointMarksModelRepository.findByIdStudAndIdSemAndIdGroup(idStud, idSem, idGroup);
    }
    @Override
    public PointMarksModel addMark(PointMarksModel pointMarksModel) {
        return pointMarksModelRepository.save(pointMarksModel);
    }
}
