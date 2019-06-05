package com.epidial.controller;

import com.alibaba.fastjson.JSONObject;
import com.epidial.dao.Info.UserDao;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @ CreateDate : Create in 15:32 2019/3/12
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@RestController
@RequestMapping(value = "/User")
public class UserController {
    @Resource
    private UserDao userDao;

    //用户更新地址板块
    @RequestMapping(value = "/updateAddress")
    public Integer updateAddress(@RequestBody JSONObject jsonObject) {
        return  0;
    }
}
