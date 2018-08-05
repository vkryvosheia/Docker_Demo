package com.dockerwear.controller;

import com.dockerwear.Model.Category;
import com.dockerwear.Model.Item;
import com.dockerwear.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class RestController {

    @Autowired
    private ItemService itemService;

    @RequestMapping("/")
    public String mainPage(){
        return "redirect:/index.html";
    }

    @RequestMapping("/items")
    @ResponseBody
    public List<Item> getItems(){
        return itemService.getItemList();
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public String uploadFile(@RequestParam("file") MultipartFile file, HttpServletRequest request){
        try {
            String filePath = request.getServletContext().getRealPath("/") + "images\\hats\\"+file.getOriginalFilename();
            file.transferTo(new File(filePath));
        }catch (IOException e){
            e.printStackTrace();
        }
        return "";
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
