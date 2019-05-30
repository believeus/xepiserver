package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProfController {
	@RequestMapping("/prof/index")
	public ModelAndView prof(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/prof.jsp");
		modelView.addObject("title"," introduction");
		modelView.addObject("canback",true);
		return modelView;
	}


}
