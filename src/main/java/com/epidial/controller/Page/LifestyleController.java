package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class LifestyleController {

	@RequestMapping("/user/lifestyle/index")
	public ModelAndView lifestyle(HttpSession session){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.setViewName("/WEB-INF/front/lifestyle.jsp");
		modelView.addObject("title","Life Style Questionnaire");
		return modelView;
	}

}
