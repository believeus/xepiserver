package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuantitycancerController {
	@RequestMapping("/quantitycancer/index")
	public ModelAndView quantitycancer(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/quantity.jsp");
		modelView.addObject("title","Quantity cancer");
		modelView.addObject("canback",true);
		return modelView;
	}


}
