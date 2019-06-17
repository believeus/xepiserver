package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsermanualController {
    @RequestMapping("/usermanual/index")
    public ModelAndView usermanual(){
        ModelAndView modelView=new ModelAndView();
        modelView.addObject("canback",true);
        modelView.setViewName("/WEB-INF/front/usermanual.jsp");
        modelView.addObject("title","User Manual");
        return  modelView;
    }

}
