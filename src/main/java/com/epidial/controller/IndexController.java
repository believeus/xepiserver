package com.epidial.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
	@RequestMapping("/index")
	public ModelAndView   home(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/index.jsp");
		modelView.addObject("title","Home");
		modelView.addObject("canback",false);
		return modelView;
	}


	@RequestMapping("/welcome")
	public ModelAndView welcome(HttpSession session){
		ModelAndView modelView = new ModelAndView();
		if (session.getAttribute("sessionuser") == null){

			modelView.setViewName("/WEB-INF/front/welcome.jsp");
			return modelView;
		}
		else{
			modelView.setViewName("/WEB-INF/front/index.jsp");
			modelView.addObject("title","Home");
			modelView.addObject("canback",false);
			return modelView;
		}
	}
}
