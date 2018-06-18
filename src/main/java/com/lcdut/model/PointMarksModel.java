package com.lcdut.model;

import javax.persistence.*;


@Entity
@Table(name = "addit_marks")

public class PointMarksModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    @Column(name = "id_stud")
    private Integer idStud;
    @Column(name = "id_point")
    private Integer idPoint;
    @Column(name = "mark")
    private Double mark;
    @Column(name = "id_group")
    private Integer idGroup;
    @Column(name = "sem")
    private Integer idSem;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getIdStud() {
        return idStud;
    }

    public void setIdStud(Integer idStud) {
        this.idStud = idStud;
    }

    public Integer getIdPoint() {
        return idPoint;
    }

    public void setIdPoint(Integer idPoint) {
        this.idPoint = idPoint;
    }

    public Integer getIdGroup() {
        return idGroup;
    }

    public void setIdGroup(Integer idGroup) {
        this.idGroup = idGroup;
    }

    public Integer getIdSem() {
        return idSem;
    }

    public void setIdSem(Integer idSem) {
        this.idSem = idSem;
    }

    public Double getMark() {
        return mark;
    }

    public void setMark(Double mark) {
        this.mark = mark;
    }
}
