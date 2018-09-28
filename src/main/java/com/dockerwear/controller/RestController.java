package com.dockerwear.controller;

import com.dockerwear.Model.Category;
import com.dockerwear.Model.Color;
import com.dockerwear.Model.FileUpload;
import com.dockerwear.Model.Item;
import com.dockerwear.service.ColorService;
import com.dockerwear.service.ItemService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
public class RestController {

    @Autowired
    private ItemService itemService;

    @Autowired
    private ColorService colorService;

    @RequestMapping("/")
    public String mainPage(){
        return "redirect:/index.html";
    }

    @RequestMapping("/items")
    @ResponseBody
    public List<Item> getItems(){
        return itemService.getItemList();
    }

    @RequestMapping("/items/{id}")
    @ResponseBody
    public Item getItem(@PathVariable("id") int id){
        return itemService.getItem(id);
    }
    @RequestMapping("/colors")
    @ResponseBody
    public List<Color> getColors(){
        return colorService.findAll();
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public Item uploadFile(
                             @RequestParam("photo1") MultipartFile photo1,
                             @RequestParam(name="photo2", required = false) MultipartFile photo2,
                             @RequestParam(name="photo3", required = false) MultipartFile photo3,
                             @RequestParam("name") String name,
                             @RequestParam("price") String price,
                             @RequestParam("description") String description,
                             HttpServletRequest request){

        try {
            String totalSrc = "";
            if(photo1 != null) {
                String fileName = "images\\catalog\\hats\\" + photo1.getOriginalFilename();
                String filePath1 = request.getServletContext().getRealPath("/") + fileName;
                photo1.transferTo(new File(filePath1));
                totalSrc += fileName + ";";
            }
            if(photo2 != null) {
                String fileName = "images\\catalog\\hats\\" + photo2.getOriginalFilename();
                String filePath2 = request.getServletContext().getRealPath("/") + fileName;
                photo2.transferTo(new File(filePath2));
                totalSrc += fileName + ';';
            }
            if(photo3 != null) {
                String fileName = "images\\catalog\\hats\\" + photo3.getOriginalFilename();
                String filePath3 = request.getServletContext().getRealPath("/") + fileName;
                photo3.transferTo(new File(filePath3));
                totalSrc += fileName + ";";
            }
            Item item = new Item();
            item.setName(name);
            item.setPrice(Double.parseDouble(price));
            item.setDescription(description);
            item.setSrc(totalSrc);
            return itemService.saveItem(item);
        }catch (IOException e){
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/categories")
    @ResponseBody
    public List<Category> getCategories(){
        return itemService.getCategories();
    }

    @RequestMapping("/admin/main/hats")
    public String adminPage(){
        return "redirect:/hats-admin.html";
    }

}
