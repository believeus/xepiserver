package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FaqlistController {
    @RequestMapping("/faqlist/index")
    public ModelAndView faqlist(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/faqlist.jsp");
        modelView.addObject("title","FAQ");
        modelView.addObject("canback",true);
        return modelView;
    }


}
