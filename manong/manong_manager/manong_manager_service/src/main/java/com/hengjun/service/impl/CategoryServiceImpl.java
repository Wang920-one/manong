package com.hengjun.service.impl;

import com.hengjun.mapper.CategoryMapper;
import com.hengjun.pojo.Category;
import com.hengjun.pojo.CategoryExample;
import com.hengjun.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.EasyUITree;
import pojo.ResponseJsonResult;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;


    @Override
    public List<EasyUITree> findCategoryListByParentId(short parentid) {
        CategoryExample categoryExample = new CategoryExample();
        CategoryExample.Criteria criteria = categoryExample.createCriteria();
        criteria.andParentEqualTo(parentid);
        List<Category> CategoryList = categoryMapper.selectByExample(categoryExample);

        List<EasyUITree> easyUITrees = new ArrayList<>(CategoryList.size());

        for (Category category : CategoryList) {

            EasyUITree easyuiTree = new EasyUITree();

            easyuiTree.setId(category.getId());
            easyuiTree.setText(category.getName());
            easyuiTree.setState(category.getParentId() == 0 ? "closed" : "open");
            easyuiTree.setAttributes(category.getParentId() + "");
            easyUITrees.add(easyuiTree);
        }

        return easyUITrees;
    }

    @Override
    public ResponseJsonResult addCategory(short parentId, String name) {
        Category category = new Category();
        category.setParentId(parentId);
        category.setName(name);
        categoryMapper.insert(category);

        ResponseJsonResult responseJsonResult = new ResponseJsonResult();
        responseJsonResult.setMsg(category.getId() + "");
        responseJsonResult.setStatus(200);
        return  responseJsonResult;
    }

    @Override
    public ResponseJsonResult deleteCategory(short parentId, short id) {
        CategoryExample productCategoryExample = new CategoryExample();
        CategoryExample.Criteria criteria = productCategoryExample.createCriteria();

        if(parentId == 0){
            criteria.andIdEqualTo(id);
            CategoryExample.Criteria criteria1 = productCategoryExample.createCriteria();
            criteria1.andParentEqualTo(id);
            productCategoryExample.or(criteria1);
        }else{
            criteria.andIdEqualTo(id);
        }

        categoryMapper.deleteByExample(productCategoryExample);

        ResponseJsonResult responseJsonResult = new ResponseJsonResult();
        responseJsonResult.setStatus(200);
        responseJsonResult.setMsg("success");

        return responseJsonResult;
    }

    @Override
    public ResponseJsonResult renameCategory(short id, String name) {
        CategoryExample productCategoryExample = new CategoryExample();
        CategoryExample.Criteria criteria = productCategoryExample.createCriteria();
        criteria.andIdEqualTo(id);
        List<Category> categories = categoryMapper.selectByExample(productCategoryExample);
        Category category = categories.get(0);
        category.setName(name);
        categoryMapper.updateByExample(category,productCategoryExample);

        ResponseJsonResult responseJsonResult = new ResponseJsonResult();
        responseJsonResult.setStatus(200);
        return responseJsonResult;
    }


}