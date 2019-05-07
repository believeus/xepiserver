package com.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @ CreateDate : Create in 9:15 2019/5/5
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Controller
public class testController {

    @RequestMapping("/testLoading")
    public ModelAndView testLoading(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/TestLoading.jsp");
        modelView.addObject("title","Loading");
        modelView.addObject("canback",false);
        return modelView;
    }
}
