package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {
	@RequestMapping("/cart/index.jhtml")
	public ModelAndView  index(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/cart.jsp");
		modelView.addObject("title"," cart");
		modelView.addObject("canback", true);
		return  modelView;
	}
	@RequestMapping("/cart/check.jhtml")
	public ModelAndView   check(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/check.jsp");
		modelView.addObject("title"," Cart display");
		modelView.addObject("canback", true);
		return modelView;
	}

	@RequestMapping("/cart/order.jhtml")
	public ModelAndView order(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/order.jsp");
		modelView.addObject("title"," Order Display");
		modelView.addObject("canback", true);
		return modelView;
	}
}
