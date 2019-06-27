package com.epidial.controller.wix;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WixregisterController {
    @RequestMapping("/wixregister/index")
    public ModelAndView wixregister(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixregister.jsp");
        modelView.addObject("wixregister","Register");
        modelView.addObject("canback",true);
        return modelView;
    }


}
