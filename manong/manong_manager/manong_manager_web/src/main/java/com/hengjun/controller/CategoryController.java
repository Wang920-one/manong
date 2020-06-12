package com.hengjun.controller;

import com.hengjun.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.EasyUITree;
import pojo.ResponseJsonResult;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
//@RequestMapping 来映射请求，也就是通过它来指定控制器可以处理哪些URL请求

@Controller
@RequestMapping("/category")
public class CategoryController {

//导入service
    @Autowired
    CategoryService categoryService;

    //根据parentid返回列表
    @RequestMapping("/list")
    @ResponseBody
    public List<EasyUITree> getCategoryByParentId(@RequestParam(value = "id", defaultValue = "0") short parentId){
        List<EasyUITree> easyUITrees = categoryService.findCategoryListByParentId(parentId);
        return  easyUITrees;
    }


//    添加分类
    @RequestMapping("/add")
    @ResponseBody
    public ResponseJsonResult addCategory(short parentId, String name){
        ResponseJsonResult responseJsonResult = categoryService.addCategory(parentId, name);
        return responseJsonResult;
    }

    //    删除
    @RequestMapping("/del")
    @ResponseBody
    public ResponseJsonResult delCategory(short parentId, short id){
        ResponseJsonResult responseJsonResult = categoryService.deleteCategory(parentId, id);
        return  responseJsonResult;
    }

    @RequestMapping("/rename")
    @ResponseBody
    public ResponseJsonResult renameCategory(short id,String name){
        ResponseJsonResult responseJsonResult = categoryService.renameCategory(id, name);
        return  responseJsonResult;
    }
}
