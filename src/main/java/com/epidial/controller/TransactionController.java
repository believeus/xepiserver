package com.epidial.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.epidial.bean.User;
import com.epidial.bean.Wares;
import com.epidial.dao.Info.AddressDao;
import com.epidial.dao.Info.TaskDao;
import com.epidial.dao.Info.WaresDao;
import com.epidial.serivce.WaresService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@CrossOrigin
@RequestMapping
public class TransactionController {

    @Resource
    private WaresService waresService;

    @Resource
    private AddressDao addressDao;

    @Resource
    private TaskDao cartDao;

    @Resource
    private WaresDao waresDao;

    //产品信息查询

    //用于接受购物车第一次的商品传递
    @RequestMapping(value = "/user/transaction/postCar")
    @ResponseBody
    public String postCar(@RequestBody JSONObject data, HttpSession session) {
        User user = (User) session.getAttribute("sessionuser");
        String orderNo = System.currentTimeMillis() + "@" + data.getString("total_price");
        JSONArray waresbox = data.getJSONArray("wares");
        String invite = data.getString("invite");//获得邀请码
        for (int i = 0; i < waresbox.size(); i++) {
            String wareId = ((JSONObject) waresbox.get(i)).getString("wares_id");
            String count = ((JSONObject) waresbox.get(i)).getString("wares_count");
            Wares wares = waresDao.find("id", wareId).get(0);
            float total =wares.getPrice() * Float.parseFloat(count);
            cartDao.save(wares, user.getId(), count, orderNo,invite,total);
        }
        return "/user/cart/check.jhtml";
    }



    @RequestMapping(value = "/user/transaction/success.jhtml")
    public ModelAndView PaySuccess() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/success.jsp");
        modelView.addObject("title", " Pay Success!");
        modelView.addObject("canback", false);
        return modelView;
    }

}
