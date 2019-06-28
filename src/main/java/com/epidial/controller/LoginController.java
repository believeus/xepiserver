package com.epidial.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @RequestMapping("/forgetPasswd")
    public ModelAndView forgetPasswd(){
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/fpaswd.jsp");
        return  modelView;
    }



}
