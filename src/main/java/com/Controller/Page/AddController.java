package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AddController {
	@RequestMapping("/add/index")
	public ModelAndView index(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/add.jsp");
		modelView.addObject("canback",true);
		return modelView;
	}
	@RequestMapping("/product/cart.jsp")
	public ModelAndView   cart(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/cart.jsp");
		modelView.addObject("title","Add");
		modelView.addObject("canback",true);
		return modelView;
	}

}
