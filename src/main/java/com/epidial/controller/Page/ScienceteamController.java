package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ScienceteamController {
	@RequestMapping("/scienceteam/index")
	public ModelAndView index(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.setViewName("/WEB-INF/front/scienceteam.jsp");
		modelView.addObject("title","Scienceteam introduction");
		return modelView;
	}
	@RequestMapping("/scienceteam/prof")
	public ModelAndView  scienceteam(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/prof.jsp");
		modelView.addObject("canback",true);
		modelView.addObject("title","Scienceteam introduction");
		return modelView;
	}

}
