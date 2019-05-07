package com.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DietController {
	@RequestMapping("/diet/index")
	public ModelAndView diet(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/diet.jsp");
		modelView.addObject("title","Diet Recommendation");
		modelView.addObject("canback",true);
		return modelView;
	}


}
