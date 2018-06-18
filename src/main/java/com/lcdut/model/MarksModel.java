package com.lcdut.model;

import javax.persistence.*;


@Entity
@Table(name = "marks")

public class MarksModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    @Column(name = "id_stud")
    private Integer idStud;
    @Column(name = "id_subject")
    private Integer idSubject;
    private Integer mark;
    @Column(name = "id_group")
    private Integer idGroup;
//    @ManyToOne(cascade = CascadeType.ALL)
//    @JoinColumn(name = "id_stud")
//    private StudentsModel student;
//    @ManyToOne(cascade = CascadeType.ALL)
//    @JoinColumn(name = "id_subject")
//    private SubjectsModel subject;

    private Integer idSem;

    public MarksModel() {
        super();
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "mark")
    public Integer getMark() {
        return mark;
    }

    public void setMark(Integer mark) {
        this.mark = mark;
    }

    public Integer getIdGroup() {
        return idGroup;
    }

    public void setIdGroup(Integer idGroup) {
        this.idGroup = idGroup;
    }
    @Basic
    @Column(name = "sem")
    public Integer getIdSem() {
        return idSem;
    }

    public void setIdSem(Integer idSem) {
        this.idSem = idSem;
    }

    public Integer getIdStud() {
        return idStud;
    }

    public void setIdStud(Integer idStud) {
        this.idStud = idStud;
    }

    public Integer getIdSubject() {
        return idSubject;
    }

    public void setIdSubject(Integer idSubject) {
        this.idSubject = idSubject;
    }

//
//    public StudentsModel getStudent() {
//        return student;
//    }
//
//    public void setStudent(StudentsModel student) {
//        this.student = student;
//    }
//
//    public SubjectsModel getSubject() {
//        return subject;
//    }
//
//    public void setSubject(SubjectsModel subject) {
//        this.subject = subject;
//    }
}
