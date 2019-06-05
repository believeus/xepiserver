package com.epidial.controller;

import com.epidial.bean.Address;
import com.epidial.bean.Task;
import com.epidial.bean.User;
import com.epidial.dao.Info.AddressDao;
import com.epidial.dao.Info.TaskDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {
    @Resource
    private AddressDao addressDao;
    @Resource
    private TaskDao cartDao;

    @RequestMapping("/user/cart/index")
    public ModelAndView index() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/cart.jsp");
        modelView.addObject("title", " cart");
        modelView.addObject("canback", true);
        return modelView;
    }

    @RequestMapping("/user/cart/check")
    public ModelAndView check() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/check.jsp");
        modelView.addObject("title", " My Task");
        modelView.addObject("canback", true);
        return modelView;
    }

    @ResponseBody
    @RequestMapping("/user/cart/del")
    public String del(String id) {
        if (cartDao.delete("id", id)) {
            return "success";
        } else return "error";
    }

    @ResponseBody
    @RequestMapping("/user/cart/price")
    public float price(HttpSession session){
        User user=(User)session.getAttribute("sessionuser");
        return cartDao.price(user.getId());
    }

    @RequestMapping("/user/cart/watchagain")
    public ModelAndView order(String addrid,HttpSession session) {
        User user = (User) session.getAttribute("sessionuser");
        //将其他地址状态归置
        addressDao.update("valid",0,"uuid",user.getUuid());
        addressDao.update("valid",1,"id",addrid);//将当前地址为正在使用的地址
        //查找当前正在使用的地址
        Address address = addressDao.findValidAddress("uuid", user.getUuid(), "valid", "1");
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/order.jsp");
        modelView.addObject("title", " Order display");
        modelView.addObject("canback", true);
        modelView.addObject("address", address);
        return modelView;
    }

    @ResponseBody
    @RequestMapping("/user/cart/list")
    public List<Task> list(HttpSession session) {
        User user = (User) session.getAttribute("sessionuser");
        List<Task> tasks = cartDao.find(user.getId());
        return tasks;
    }
}
