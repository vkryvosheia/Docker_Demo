package com.lcdut.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="groups")
public class GroupsModel {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;


    @Column(name="name")
    private String name;

    @Column(name="id_spec")
    private int idSpec;

    public GroupsModel() {
        super();
    }


    public GroupsModel(String name, int id_spec) {
        this.name = name;
        this.idSpec = id_spec;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_spec() {
        return idSpec;
    }

    public void setId_spec(int id_spec) {
        this.idSpec = id_spec;
    }

}
