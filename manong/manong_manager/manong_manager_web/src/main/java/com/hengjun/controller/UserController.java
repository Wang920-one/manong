package com.hengjun.controller;

import com.hengjun.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.ResponseJsonResult;


@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/checkUser")
    @ResponseBody
    public ResponseJsonResult getUserByExample(String username, String password){
        ResponseJsonResult responseJsonResult = userService.checkUser(username,password);
        return responseJsonResult;
    }


}