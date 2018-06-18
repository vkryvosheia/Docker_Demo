package com.lcdut.controller;


import com.lcdut.model.AdditionalMarkInfoModel;
import com.lcdut.model.MarksModel;
import com.lcdut.model.PointMarksModel;
import com.lcdut.service.AdditionalMarksService;
import com.lcdut.service.MarksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class MarkController {
    @Autowired
    private MarksService marksService;

    @Autowired
    private AdditionalMarksService additionalMarksService;

    @RequestMapping("/c_get_mark_by_group/{id}/{idSem}")
    public List<MarksModel> getByIdGroup(@PathVariable int id, @PathVariable int idSem){
        return marksService.getByIdGroup(id, idSem);
    }

    @RequestMapping(value = "/c_addit_mark_info", method = RequestMethod.GET)
    public List<AdditionalMarkInfoModel> getAddMarks(){
        return additionalMarksService.findAll();
    }

    @RequestMapping(value = "/c_add_mark_point", method = RequestMethod.POST)
    public PointMarksModel addMarkPoint(@RequestBody PointMarksModel pointMarksModel){
        return additionalMarksService.addMark(pointMarksModel);
    }

    @RequestMapping(value = "/c_get_mark_point_stud_sem_group/{idStud}/{idSem}/{idGroup}", method = RequestMethod.GET)
    public Double getByIdStudSemGroup(@PathVariable int idStud, @PathVariable int idSem, @PathVariable int idGroup){
        return additionalMarksService.findByIdStudAndIdSemAndIdGroup(idStud, idSem, idGroup);
    }
    @RequestMapping(value = "/c_get_mark_point_stud_sem_group_delete/{idStud}/{idSem}/{idGroup}", method = RequestMethod.GET)
    public void deleteByIdStudSemGroup(@PathVariable int idStud, @PathVariable int idSem, @PathVariable int idGroup){
        additionalMarksService.deleteByIdStudAndIdSemAndIdGroup(idStud, idSem, idGroup);
    }
    @RequestMapping(value = "/c_get_mark_point_stud_sem_group_list/{idStud}/{idSem}/{idGroup}", method = RequestMethod.GET)
    public List<PointMarksModel> getByIdStudSemGroupList(@PathVariable int idStud, @PathVariable int idSem, @PathVariable int idGroup){
        return additionalMarksService.findByIdStudAndIdSemAndIdGroupList(idStud, idSem, idGroup);
    }
    @RequestMapping("/c_delete/{id}")
    public void delete(@PathVariable int id){
        marksService.delete(id);
    }

    @RequestMapping(value = "/c_add_mark", method = RequestMethod.POST)
    public MarksModel addMark(@RequestBody MarksModel marksModel){
        return marksService.addMark(marksModel);
    }
}
