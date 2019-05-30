package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChifatController {
	@RequestMapping("/chifat/index")
	public ModelAndView chifat(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/chifat.jsp");
		modelView.addObject("title","Chifat Introduction");
		modelView.addObject("canback",true);
		return modelView;
	}


}
