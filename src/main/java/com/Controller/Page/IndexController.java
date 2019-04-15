package com.Controller.Page;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
//@PropertySource("classpath:project.properties")
public class IndexController {

	@RequestMapping("/index")
	public ModelAndView   home(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/index.jsp");
		modelView.addObject("title","Home");
		modelView.addObject("canback",false);
		return modelView;
	}

}
