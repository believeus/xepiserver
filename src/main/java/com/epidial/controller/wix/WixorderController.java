package com.epidial.controller.wix;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WixorderController {
    @RequestMapping("/wix/wixorder/index")
    public ModelAndView wixorder(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixorder.jsp");
        modelView.addObject("wixorder","Order recording");
        modelView.addObject("canback",true);
        return modelView;
    }


}
