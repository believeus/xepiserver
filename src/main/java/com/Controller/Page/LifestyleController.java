package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LifestyleController {
	@RequestMapping("/lifestyle/index")
	public ModelAndView lifestyle(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.setViewName("/WEB-INF/front/lifestyle.jsp");
		modelView.addObject("title","Life Style Questionnaire");
		return modelView;
	}

}
