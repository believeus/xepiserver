package com.epidial.controller.wix;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WixorderController {

    @RequestMapping("/wix/order/index")
    public ModelAndView wixorder(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixreview.jsp");
        modelView.addObject("wixorder","Order recording");
        modelView.addObject("canback",true);
        return modelView;
    }


}
