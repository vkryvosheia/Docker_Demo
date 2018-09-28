package com.dockerwear.Model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "items")
public class Item {

    @Id
    @GeneratedValue
    private int id;
    @Column
    private String name;
//    @Column
//    private String category;
//    @Column
//    @ManyToMany(cascade = { CascadeType.ALL })
//    @JoinTable(
//            name = "items_colors",
//            joinColumns = { @JoinColumn(name = "item_id") },
//            inverseJoinColumns = { @JoinColumn(name = "color_id") }
//    )
//    private List<Color> colors;
//    @Column
//    private int amount;
    @Column
    private String src;
    @Column
    private String description;
    @Column
    private double price;


    public Item(){}
    
    public Item(int id, String name, String src, String description, double price) {
        this.id = id;
        this.name = name;
//        this.category = category;
//        this.colors = colors;
//        this.amount = amount;
        this.src = src;
        this.description = description;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
