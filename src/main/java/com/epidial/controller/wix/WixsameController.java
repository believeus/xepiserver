package com.epidial.controller.wix;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WixsameController {
    @RequestMapping("/wixsame/index")
    public ModelAndView wixsame(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixsame.jsp");
        modelView.addObject("wixsame","SAM-e");
        modelView.addObject("canback",true);
        return modelView;
    }


}
