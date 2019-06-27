package com.epidial.controller.wix;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WixconsentController {
    @RequestMapping("/wix/wixconsent/index")
    public ModelAndView wixconsent(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixconsent.jsp");
        modelView.addObject("wixconsent","Consent form");
        modelView.addObject("canback",true);
        return modelView;
    }


}
