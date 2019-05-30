package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {
	@RequestMapping("/user/cart/index")
	public ModelAndView  index(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/cart.jsp");
		modelView.addObject("title"," cart");
		modelView.addObject("canback", true);
		return  modelView;
	}
	@RequestMapping("/user/cart/check")
	public ModelAndView   check(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/check.jsp");
		modelView.addObject("title"," My Cart");
		modelView.addObject("canback", true);
		return modelView;
	}

	@RequestMapping("/user/cart/order")
	public ModelAndView   order(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/order.jsp");
		modelView.addObject("title"," Order display");
		modelView.addObject("canback", true);
		return modelView;
	}
}
