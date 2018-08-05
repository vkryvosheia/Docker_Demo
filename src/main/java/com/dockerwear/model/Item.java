package com.dockerwear.Model;

import javax.persistence.*;

@Entity
@Table(name = "items")
public class Item {

    @Id
    @GeneratedValue
    private int id;
    @Column
    private String name;
    @Column
    private String type;
    @Column
    private String color;
    @Column
    private int amount;
    @Column
    private String size;
    @Column
    private String src;
    @Column
    private double price;


    public Item(){}
    
    public Item(int id, String name, String type, String color, int amount, String size, String src, double price) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.color = color;
        this.amount = amount;
        this.size = size;
        this.src = src;
        this.price = price;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
