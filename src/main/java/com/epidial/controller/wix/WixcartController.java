package com.epidial.controller.wix;

import com.epidial.bean.Address;
import com.epidial.bean.User;
import com.epidial.bean.Wares;
import com.epidial.dao.epi.AddressDao;
import com.epidial.dao.epi.WaresDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class WixcartController {

    @Resource
    private WaresDao waresDao;

    @Resource
    private AddressDao addressDao;

    @RequestMapping("/wix/cart/index")
    public ModelAndView wixcart() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixcart.jsp");
        List<Wares> waresbox = waresDao.findAll();
        modelView.addObject("title", " wixcart");
        modelView.addObject("canback", true);
        modelView.addObject("waresbox",waresbox);
        return modelView;
    }
    @RequestMapping("/wix/cart/review")
    public ModelAndView order(HttpSession session){
        User user = (User) session.getAttribute("sessionuser");
        //查找当前正在使用的地址
        Address address = addressDao.findValidAddress("uuid", user.getUuid(), "valid", "1");
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixreview.jsp");
        modelView.addObject("address", address);
        return modelView;
    }
}
