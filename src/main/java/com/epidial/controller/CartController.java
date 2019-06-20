package com.epidial.controller;

import com.epidial.bean.*;
import com.epidial.dao.epi.AddressDao;
import com.epidial.dao.epi.TaskDao;
import com.epidial.dao.epi.UdataDao;
import com.epidial.dao.epi.WaresDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {
    @Resource
    private AddressDao addressDao;
    @Resource
    private TaskDao taskDao;
    @Resource
    private UdataDao udataDao;
    @Resource
    private WaresDao waresDao;

    @RequestMapping("user/taskrecord/index.jhtml")
    public ModelAndView tasklisk(){
        ModelAndView modelView = new ModelAndView("/WEB-INF/front/taskrecord.jsp");
        modelView.addObject("title","Order record ");
        modelView.addObject("canback",true);
        return modelView;
    }
    @ResponseBody
    @RequestMapping("/user/cart/paygoodslist")
    public List<Task> paygoodslist(HttpSession session){
        User user = (User) session.getAttribute("sessionuser");
        List<Task> taskbox = taskDao.findPayGoods(user.getId());
        return taskbox;
    }

    @RequestMapping("/user/cart/index")
    public ModelAndView index() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/cart.jsp");
        List<Wares> waresbox = waresDao.findAll();
        modelView.addObject("title", " cart");
        modelView.addObject("canback", true);
        modelView.addObject("waresbox",waresbox);
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
        taskDao.delete("id", id);
        return  "success";
    }

    //计算用户购买商品总价
    @ResponseBody
    @RequestMapping("/user/cart/sumprice")
    public String sumprice(HttpSession session){
        User user=(User)session.getAttribute("sessionuser");
        System.out.println(taskDao.sumprice(user.getId()));
        String total=taskDao.sumprice(user.getId());
        return String.format("%.2f", Float.parseFloat(total==null?"0":total));
    }

    @RequestMapping("/user/cart/watchagain")
    public ModelAndView order(String addrid,HttpSession session) {
        User user = (User) session.getAttribute("sessionuser");
        //将其他地址状态归置
        addressDao.update("valid",0,"uuid",user.getUuid());
        addressDao.update("valid",1,"id",addrid);//将当前地址为正在使用的地址
        //查找当前正在使用的地址
        Address address = addressDao.findValidAddress("uuid", user.getUuid(), "valid", "1");
        //设置商品收货地址
        List<Task> unPayGoods = taskDao.findUnPayGoods(user.getId());
        for (Task task:unPayGoods) {
            task.setAddrid(address.getId());
            taskDao.update(task);
        }
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/order.jsp");
        modelView.addObject("title", " Order display");
        modelView.addObject("canback", true);
        modelView.addObject("address", address);
        return modelView;
    }

    @ResponseBody
    @RequestMapping("/user/cart/unPayGoodslist")
    public List<Task> list(HttpSession session) {
        User user = (User) session.getAttribute("sessionuser");
        List<Task> tasks = taskDao.findUnPayGoods(user.getId());
        return tasks;
    }
    @ResponseBody
    @RequestMapping("/user/cart/paydnakit")
    public List<Udata> payDNAKit(HttpSession session){
        User user = (User) session.getAttribute("sessionuser");
        List<Udata> box = udataDao.findBy("uid", user.getId());
        return box;
    }

    @Controller
    public static class UsercenterController {
        @Autowired
        private HttpServletRequest request;

        @RequestMapping("/user/mycenter/index")
        public ModelAndView mycenter(){
            ModelAndView modelView=new ModelAndView();
            modelView.setViewName("/WEB-INF/front/usercenter.jsp");
            modelView.addObject("title","User Center");
            modelView.addObject("canback",true);
            return modelView;
        }


    }
}
