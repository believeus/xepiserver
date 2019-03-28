package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsercenterController {
	@RequestMapping("/mycenter/index")
	public ModelAndView mycenter(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/usercenter.jsp");
		modelView.addObject("title","User Center");
		modelView.addObject("canback",true);
		return modelView;
	}


}
