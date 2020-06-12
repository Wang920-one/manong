package com.hengjun.service.impl;
import com.hengjun.mapper.UserMapper;
import com.hengjun.pojo.User;
import com.hengjun.pojo.UserExample;
import com.hengjun.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.ResponseJsonResult;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public ResponseJsonResult checkUser(String name, String password) {

//    criteria.andParentEqualTo(parentid);
//        List<Category> CategoryList = categoryMapper.selectByExample(categoryExample);

        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameEqualTo(name);
        List<User> users = userMapper.selectByExample(userExample);
        ResponseJsonResult responseJsonResult = new ResponseJsonResult();
        if(users.size() == 0) return  responseJsonResult;
        User user = (User)users.get(0);

        if (user.getPassword().trim().equals(password)){
            responseJsonResult.setMsg("登录成功");
            responseJsonResult.setStatus(200);
        }
        else
            responseJsonResult.setMsg("登录失败");
        return responseJsonResult;
    }
}
