package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PreventcancerController {
	@RequestMapping("/preventcancer/index")
	public ModelAndView preventcancer(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/prevent.jsp");
		modelView.addObject("title","Prevnet colorectal cancer");
		modelView.addObject("canback",true);
		return modelView;
	}


}
