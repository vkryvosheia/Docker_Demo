package com.lcdut.model;


import javax.persistence.*;

@Entity
@Table(name = "competition")
public class CompetitionModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

}

