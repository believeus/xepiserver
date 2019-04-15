package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContactController {
	@RequestMapping("/contact/index")
	public ModelAndView contact(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.addObject("title","Contact Us");
		modelView.setViewName("/WEB-INF/front/contact.jsp");
		return modelView;
	}

}
