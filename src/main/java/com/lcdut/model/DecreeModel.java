package com.lcdut.model;


import javax.persistence.*;

@Entity
@Table(name = "decrees")
public class DecreeModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;


    private String fieldName;

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public DecreeModel() {
    }

    public DecreeModel(String name, String fieldName) {
        this.name = name;
        this.fieldName = fieldName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
