package com.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

/**
 * @ CreateDate : Create in 0:37 2019/3/16
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Controller
public class LoginController {
    static boolean flag = true;

    @RequestMapping(value = "/login")
    public ModelAndView Tologin(){
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/login.jsp");
        modelView.addObject("title","Login");
        modelView.addObject("canback", true);
        return  modelView;
    }

    @RequestMapping(value = "/register")
    public ModelAndView ToRegister(){
        ModelAndView modelView = new ModelAndView();
        if (flag){
            flag = false;
            modelView.setViewName("/WEB-INF/front/concent.jsp");
            modelView.addObject("title","User Informed Consent");
            modelView.addObject("canback",true);
            return  modelView;
        }
        modelView.setViewName("/WEB-INF/front/register.jsp");
        modelView.addObject("title","Register");
        modelView.addObject("canback", true);
        return  modelView;
    }

}
