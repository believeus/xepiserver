package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SameController {
	@RequestMapping("/same/index")
	public ModelAndView same(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/same.jsp");
		modelView.addObject("title","Same introduction");
		modelView.addObject("canback",true);
		return modelView;
	}


}
