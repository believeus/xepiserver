package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BioageController {
	@RequestMapping("/bioage/index")
	public ModelAndView bioage(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/bioage.jsp");
		modelView.addObject("title","Biological age Introduction");
		modelView.addObject("canback",true);
		return modelView;
	}


}
