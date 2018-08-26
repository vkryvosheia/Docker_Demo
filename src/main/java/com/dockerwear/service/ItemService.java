package com.dockerwear.service;

import com.dockerwear.Model.Category;
import com.dockerwear.Model.Item;

import java.util.List;

public interface ItemService{
    List<Item> getItemList();
    List<Category> getCategories();
    Item saveItem(Item item);
}
