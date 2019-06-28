package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HuiliController {
	@RequestMapping("/huili/index")
	public ModelAndView huili(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.addObject("title","Hui Li Introduction");
		modelView.setViewName("/WEB-INF/front/huili.jsp");
		return modelView;
	}

}
