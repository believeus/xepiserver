package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	@RequestMapping("/order/index")
	public ModelAndView order(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/order.jsp");
		modelView.addObject("title","Order List");
		modelView.addObject("canback",true);
		return modelView;
	}


}
