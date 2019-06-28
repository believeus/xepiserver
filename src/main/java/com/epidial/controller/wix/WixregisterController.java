package com.epidial.controller.wix;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WixregisterController {
    @RequestMapping("/wix/register/index")
    public ModelAndView wixregister(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixregister.jsp");
        modelView.addObject("wixregister","Register");
        modelView.addObject("canback",true);
        return modelView;
    }

    @RequestMapping(value = "/wix/register/success")
    public ModelAndView success() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/wix/wixsuccess.jsp");
        modelView.addObject("registration", "Thank you for your registration.");
        modelView.addObject("canback", false);
        return modelView;
    }


}
