package com.hengjun.controller;


import com.hengjun.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.EasyUITree;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


//页面管理控制器
@Controller
public class PageController {


    //导入service
    @Autowired
    CategoryService categoryService;

    @RequestMapping("/{page}")
    public  String requestPage(@PathVariable String page){
        return  page;
}


    @RequestMapping("/index")
    public String requestIndex(HttpServletRequest request){
        return "index";
    }
    @RequestMapping("/product_add")
    public String requestProductAdd(HttpServletRequest request){
        List<EasyUITree> categories = categoryService.findCategoryListByParentId((short)0);
        request.getSession().setAttribute("categories",categories);
        return "product_add";
    }
}
