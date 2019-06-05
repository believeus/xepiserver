package com.epidial.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GoodsController {
    @RequestMapping("/admin/goods/view")
    public ModelAndView view(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("");
        modelView.addObject("","");
        return  modelView;
    }
}
