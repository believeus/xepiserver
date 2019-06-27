package com.epidial.controller.wix;

import com.epidial.bean.Wares;
import com.epidial.dao.epi.WaresDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class WixcartController {

    @Resource
    private WaresDao waresDao;



    @RequestMapping("/wix/wixcart/index")
    public ModelAndView wixcart() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixcart.jsp");
        List<Wares> waresbox = waresDao.findAll();
        modelView.addObject("title", " wixcart");
        modelView.addObject("canback", true);
        modelView.addObject("waresbox",waresbox);
        return modelView;
    }

}
