package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CheckController {
	@RequestMapping("/check/index")
	public ModelAndView index(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.setViewName("/WEB-INF/front/check.jsp");
		return modelView;
	}
	@RequestMapping("/order/check") 
	public ModelAndView check(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/order.jsp");
		modelView.addObject("title","Check your order");
		modelView.addObject("canback",true);
		return modelView;
	}

}
