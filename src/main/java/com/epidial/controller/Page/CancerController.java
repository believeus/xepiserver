package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CancerController {
	@RequestMapping("/cancer/index")
	public ModelAndView cancer(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/cancer.jsp");
		modelView.addObject("title","Colorectal cancer");
		modelView.addObject("canback",true);
		return modelView;
	}


}
