package com.dockerwear.service;

import com.dockerwear.Model.Category;
import com.dockerwear.Model.Item;
import com.dockerwear.dao.CategoryDao;
import com.dockerwear.dao.ItemDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private ItemDao itemDao;

    @Autowired
    private CategoryDao categoryDao;

    public List<Item> getItemList() {
        return itemDao.findAll();
    }

    @Override
    public List<Category> getCategories() {
        return categoryDao.findAll();
    }

    @Override
    public Item saveItem(Item item) {
        return itemDao.save(item);
    }

    @Override
    public Item getItem(int id) {
        return itemDao.findById(id);
    }
}
