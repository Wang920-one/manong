package com.hengjun.service;

import pojo.EasyUITree;
import pojo.ResponseJsonResult;

import java.util.List;

public interface CategoryService {
    List<EasyUITree> findCategoryListByParentId(short parentId);
    ResponseJsonResult addCategory(short parentId, String name);
    ResponseJsonResult deleteCategory(short parentId, short id);
    ResponseJsonResult renameCategory(short id, String name);

}
