package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@RequestMapping("/index.jhtml")
	public ModelAndView   home(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/index.jsp");
		modelView.addObject("title","Home");
		modelView.addObject("canback",false);
		return modelView;
	}

	@RequestMapping("/")
	public ModelAndView   home2(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/index.jsp");
		modelView.addObject("title","Home");
		modelView.addObject("canback",false);
		return modelView;
	}
}
