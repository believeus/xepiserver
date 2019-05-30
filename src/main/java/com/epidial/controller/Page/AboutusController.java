package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AboutusController {
	@RequestMapping("/aboutus/index")
	public ModelAndView index(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.setViewName("/WEB-INF/front/aboutus.jsp");
		return  modelView;
	}
	@RequestMapping("/aboutus/prof")
	public ModelAndView   prof(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/prof.jsp");
		modelView.addObject("title","About us introduction");
		modelView.addObject("canback",true);
		return modelView;
	}

}
