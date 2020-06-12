package com.hengjun.service;

import pojo.ResponseJsonResult;

public interface UserService {

//    User getUserById(Integer id);
    ResponseJsonResult checkUser(String name, String password);
}
