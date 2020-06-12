package com.hengjun.service;

import com.hengjun.pojo.Product;
import pojo.EasyGrid;
import pojo.ResponseJsonResult;

/**
 * Created by IntelliJ IDEA.
 * User: hengjun
 * Date: 2019/6/15
 */
public interface ProductService {
    ResponseJsonResult saveProduct(Product product);
    EasyGrid ListProduct(int pages, int rows);
}
