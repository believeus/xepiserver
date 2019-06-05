package com.epidial.controller;

import com.epidial.bean.Address;
import com.epidial.bean.User;
import com.epidial.dao.Info.AddressDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AddressController {
    @Resource
    private AddressDao addressDao;

    @ResponseBody
    @RequestMapping(value = "/user/address/save")
    public Address saveAddr(Address address, HttpSession session) {
        User user = (User) session.getAttribute("sessionuser");
        addressDao.update("valid",0,"uuid",user.getUuid());
        address.setUuid(user.getUuid());
        address.setValid(1);//地址使用中
        addressDao.save(address);
        return addressDao.findValidAddress("uuid", user.getUuid(), "valid", 1);

    }

    @ResponseBody
    @RequestMapping(value = "/user/address/del")
    public String delAddr(String id, HttpSession session) {
        addressDao.delete("id", id);
        return "success";
    }
    @ResponseBody
    @RequestMapping("/user/address/list")
    public List<Address> findAddr(HttpSession session){
        User user = (User)session.getAttribute("sessionuser");
        List<Address> addressbox = addressDao.find("uuid", user.getUuid());
        return addressbox;
    }

    //查找当前正在使用的地址
    @ResponseBody
    @RequestMapping("/user/address/addrValid")
    public Address addrValid(HttpSession session){
        User user = (User)session.getAttribute("sessionuser");
        return addressDao.findValidAddress("uuid", user.getUuid(), "valid", 1);
    }

}
