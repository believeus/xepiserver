package com.epidial.controller;

import com.epidial.bean.Address;
import com.epidial.bean.Task;
import com.epidial.bean.User;
import com.epidial.dao.epi.AddressDao;
import com.epidial.dao.epi.TaskDao;
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
    @Resource
    private TaskDao taskDao;

    @ResponseBody
    @RequestMapping(value = "/user/address/save")
    public String saveAddr(Address address, HttpSession session) {
        User user = (User) session.getAttribute("sessionuser");
        addressDao.update("valid",0,"uuid",user.getUuid());
        address.setUuid(user.getUuid());
        address.setValid(1);//地址使用中
        addressDao.save(address);
        Address validAddress = addressDao.findValidAddress("uuid", user.getUuid(), "valid", 1);
        List<Task> unPayGoods = taskDao.findUnPayGoods(user.getId());
        for (Task task:unPayGoods){
            task.setAddrid(validAddress.getId());
            taskDao.update(task);
        }
        return "success";

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
