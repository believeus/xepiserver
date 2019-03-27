package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SuccessController {
	@RequestMapping("/success/index")
	public ModelAndView success(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("title","Successful Payment");
		modelView.addObject("canback",false);
		modelView.setViewName("/WEB-INF/front/success.jsp");
		return modelView;
	}

}
