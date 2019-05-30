package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MoodController {
	@RequestMapping("/user/mood/index")
	public ModelAndView mood(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.addObject("title","Mood Self Assessment");
		modelView.setViewName("/WEB-INF/front/mood.jsp");
		return modelView;
	}

}
