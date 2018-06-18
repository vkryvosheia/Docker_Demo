package com.lcdut.model;

import javax.persistence.*;

@Entity
@Table(name = "fields_stud")
public class FieldsStudModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;
    @Column(name = "id_name")
    private String idName;
    @Column(name = "use_table")
    private String useTable;


    public FieldsStudModel() {

    }

    public FieldsStudModel(String name, String idName, String useTable) {
        this.name = name;
        this.idName = idName;
        this.useTable = useTable;
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

    public String getIdName() {
        return idName;
    }

    public void setIdName(String idName) {
        this.idName = idName;
    }

    public String getUseTable() {
        return useTable;
    }

    public void setUseTable(String useTable) {
        this.useTable = useTable;
    }
}
