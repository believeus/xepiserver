package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AgingController {
	@RequestMapping("/aging/index")
	public ModelAndView aging(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/aging.jsp");
		modelView.addObject("title","epiAging introduction");
		modelView.addObject("canback",true);
		return modelView;
	}


}
