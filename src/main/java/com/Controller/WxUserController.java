package com.Controller;

import com.Serivce.IUserSerivce;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ CreateDate : Create in 13:21 2019/2/26
 * @ Explain :
 * @ UpdateDate : Update in 13:25 2019/2/26
 */
@RequestMapping("/wxUser")
@RestController
public class WxUserController {
    @Resource
    private IUserSerivce iUserSerivce;


    /**
     *
     * 功能描述: 用户测试Springboot与数据库连接
     *
     * @param:
     * @return: List
     * @author: Eestill
     * @date: 2019/2/26 13:22
     */
    @RequestMapping("/getUser")
    public List getUser(){
        return iUserSerivce.getUser();
    }


    @RequestMapping("/getUserid")
    /**
     *
     * 功能描述:
     * @author: Eestill
     * @date: 2019/2/26 14:38
     * @param wx_openid
     */
    public String getUserid(String wx_openid){
        return iUserSerivce.CheckStatus(wx_openid);
    }
        
    @RequestMapping("/createUser")
    /**
     *
     * 功能描述: 用于微信用户根据wx_openid来向后台申请uuid创建用户
     * @author: Eestill
     * @date: 2019/2/26 14:40
     * @param wx_openid
     */
    public String createUser(String wx_openid){
        String uuid = null;
        try {
            uuid = iUserSerivce.getUserId_CreateUser(wx_openid);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        return uuid;
    }

}
