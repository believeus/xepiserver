package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DataController {
	@RequestMapping("/data/index")
	public ModelAndView data(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/data.jsp");
		modelView.addObject("title","Data Security");
		modelView.addObject("canback",true);
		return modelView;
	}


}
