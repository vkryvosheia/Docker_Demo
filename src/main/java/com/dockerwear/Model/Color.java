package com.dockerwear.Model;

import javax.persistence.*;

@Table(name = "color")
@Entity
public class Color {

    @Id
    @GeneratedValue
    private int id;
    @Column
    private String name;


    public Color() {
    }

    public Color(String name) {
        this.name = name;
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
