package com.epidial.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.epidial.bean.Task;
import com.epidial.bean.User;
import com.epidial.bean.Wares;
import com.epidial.dao.epi.TaskDao;
import com.epidial.dao.epi.WaresDao;
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
    private TaskDao taskDao;

    @Resource
    private WaresDao waresDao;

    //产品信息查询

    //用于接受购物车第一次的商品传递
    @RequestMapping(value = "/user/transaction/postCar")
    @ResponseBody
    public String postCar(@RequestBody JSONObject data, HttpSession session) {
        User user = (User) session.getAttribute("sessionuser");
        long time =System.currentTimeMillis();
        JSONArray waresbox = data.getJSONArray("wares");
        String invite = data.getString("invite");//获得邀请码
        for (int i = 0; i < waresbox.size(); i++) {
            String waresId = ((JSONObject) waresbox.get(i)).getString("wares_id");
            String count = ((JSONObject) waresbox.get(i)).getString("wares_count");
            Wares wares = waresDao.find("id", waresId).get(0);
            Task task=new Task();
            task.setCount(Integer.parseInt(count));
            task.setGid(Integer.parseInt(waresId));
            task.setImgpath(wares.getImgpath());
            task.setInvite(invite);
            task.setOrderno("HKG:"+time);
            task.setPay(0);//未付款
            task.setName(wares.getName());
            task.setPrice(wares.getPrice());
            float total =wares.getPrice() * Float.parseFloat(count);
            task.setTotal(total);
            task.setPrice(wares.getPrice());
            task.setUid(user.getId());
            task.setType(wares.getType());
            task.setValid(0);//0：订单有效
            task.setCreateTime(time);//订单创建时间
            task.setDelivery("Unfilled");
            taskDao.save(task);
        }
        return "/user/cart/check.jhtml";
    }

    @RequestMapping(value = "/user/transaction/success.jhtml")
    public ModelAndView paySuccess() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/success.jsp");
        modelView.addObject("title", " Pay Success!");
        modelView.addObject("canback", false);
        return modelView;
    }

}
