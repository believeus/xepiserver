package com.epidial.controller.wix;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WixagingController {
    @RequestMapping("/wixaging/index")
    public ModelAndView wixaging(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixaging.jsp");
        modelView.addObject("wixaging","Aging test");
        modelView.addObject("canback",true);
        return modelView;
    }


}
