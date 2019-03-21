package com.Controller;

import com.Bean.Address;
import com.Serivce.IUserSerivce;
import com.alibaba.fastjson.JSONObject;
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
    private IUserSerivce userSerivce;

    //用户更新地址板块
    @RequestMapping(value = "/updateAddress")
    public Integer updateAddress(@RequestBody JSONObject jsonObject){
        /*
        * {
        *   "type" : insert | update | delete,
        *   "address_id" : //用来识别用户地址的指向性id
        *   //如果用户是insert | update
        *   -> "data" : {
        *                   "recipient" : // 收件人，
        *                   "phone" : //手机号码,
        *                   "country" : //国家，
        *                   "address" : //完整收件地址
        *                   "postalcode" : //邮政编码
        *               }
        * }
        * */
        String type = jsonObject.getString("type");

        if (type.equals("insert") || type.equals("update")){
            //获取json中的数据
            JSONObject address = jsonObject.getJSONObject("data");
            Address addr = new Address();
            addr.setRecipient(address.getString("recipient"));
            addr.setCountry(address.getString("country"));
            addr.setPhone(address.getString("phone"));
            addr.setAddress(address.getString("address"));
            addr.setPostalcode(address.getString("postalcode"));
            addr.setAddress_id(address.getInteger("address_id"));

            if (type.equals("insert")){
                //插入方法
                if (userSerivce.AddAddress(addr) > 0 ){
                    return 200;
                }
            }else{
                //更新方法
                if (userSerivce.UpdateAddress(addr) > 0){
                    return 200;
                }
                else
                    return -1;
            }
        }else if (type.equals("delete")){}

        return -1;


    }
}
