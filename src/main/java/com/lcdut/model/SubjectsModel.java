package com.lcdut.model;

import javax.persistence.*;
import java.io.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "subjects")
public class SubjectsModel implements Externalizable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "groups")
    private Integer groups;
    @Column(name = "name_of_subject")
    private String nameOfSubject;
    @Column(name = "system_of_marking")
    private int systemOfMarking;
    @Column(name = "amount_of_hours")
    private int amountOfHours;
    @Column(name = "type_of_test")
    private String typeOfTest;
    @Column(name = "semester")
    private int semester;
    @Column(name = "teacher")
    private int teacher;
//    @ManyToOne
//    private StudentsModel studentsModel;
//    @OneToMany(mappedBy = "")
//    @JoinColumn(name="id", referencedColumnName = "id_subject")
//    private Set<MarksModel> marks;


    public SubjectsModel() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGroups() {
        return groups;
    }

    public void setGroups(int groups) {
        this.groups = groups;
    }

    public String getNameOfSubject() {
        return nameOfSubject;
    }

    public void setNameOfSubject(String nameOfSubject) {
        this.nameOfSubject = nameOfSubject;
    }

    public int getSystemOfMarking() {
        return systemOfMarking;
    }

    public void setSystemOfMarking(int systemOfMarking) {
        this.systemOfMarking = systemOfMarking;
    }

    public int getAmountOfHours() {
        return amountOfHours;
    }

    public void setAmountOfHours(int amountOfHours) {
        this.amountOfHours = amountOfHours;
    }

    public String getTypeOfTest() {
        return typeOfTest;
    }

    public void setTypeOfTest(String typeOfTest) {
        this.typeOfTest = typeOfTest;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public int getTeacher() {
        return teacher;
    }

    public void setTeacher(int teacher) {
        this.teacher = teacher;
    }

    @Override
    public void writeExternal(ObjectOutput out) throws IOException {

    }

    @Override
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {

    }
//
//    public Set<MarksModel> getMarks() {
//        return marks;
//    }
//
//    public void setMarks(Set<MarksModel> marks) {
//        this.marks = marks;
//    }
}
