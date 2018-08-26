package com.dockerwear.controller;

import com.dockerwear.Model.Category;
import com.dockerwear.Model.Color;
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

    @RequestMapping("/colors")
    @ResponseBody
    public List<Color> getColors(){
        return colorService.findAll();
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public Item uploadFile(@RequestParam("file") MultipartFile file,
                             @RequestParam("name") String name,
                             @RequestParam("price") String price,
                             @RequestParam("category") String category,
                             @RequestParam("amount") int amount,
                             @RequestParam("colors") Object colors,
                             HttpServletRequest request){

        try {
            String filePath = request.getServletContext().getRealPath("/") + "images\\catalog\\hats\\"+file.getOriginalFilename();
            file.transferTo(new File(filePath));
            Item item = new Item();
            item.setName(name);
            item.setPrice(Double.parseDouble(price));
            item.setCategory(category);
            item.setAmount(amount);
            ObjectMapper mapper = new ObjectMapper();
            List<LinkedHashMap> colorsList = mapper.readValue((String) colors, ArrayList.class);
            List<Integer> colorIds = new ArrayList<>();
            for(LinkedHashMap map: colorsList){
                colorIds.add((Integer)map.get("id"));
            }

            item.setColors(colorService.findAll(colorIds));
            item.setSrc("./images/catalog/hats/" + file.getOriginalFilename());
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
