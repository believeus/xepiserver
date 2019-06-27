package com.epidial.controller.wix;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WixloginController {
    @RequestMapping("/wixlogin/index")
    public ModelAndView wixlogin(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixlogin.jsp");
        modelView.addObject("wixlogin","Login");
        modelView.addObject("canback",true);
        return modelView;
    }


}
