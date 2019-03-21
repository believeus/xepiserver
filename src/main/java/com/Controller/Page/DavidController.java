package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DavidController {
	@RequestMapping("/david/index")
	public ModelAndView david(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.addObject("title","Senior Scientific Adviser");
		modelView.setViewName("/WEB-INF/front/david.jsp");
		return modelView;
	}

}
