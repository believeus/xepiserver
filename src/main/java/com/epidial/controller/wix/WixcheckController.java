package com.epidial.controller.wix;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WixcheckController {
    @RequestMapping("/wix/check/index")
    public ModelAndView wixcheck(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixcheck.jsp");
        modelView.addObject("wixcheck","Confirm order");
        modelView.addObject("canback",true);
        return modelView;
    }


}
