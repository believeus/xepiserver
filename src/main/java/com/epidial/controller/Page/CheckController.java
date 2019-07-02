package com.epidial.controller.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class CheckController {
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/check/index")
	public ModelAndView index(){
		HttpSession session = request.getSession();

		if (session.getAttribute("userInfo") == null){
			ModelAndView modelView=new ModelAndView();
			modelView.addObject("canback",true);
			modelView.setViewName("/WEB-INF/front/login.jsp");
			modelView.addObject("title","Log In");
			return modelView;
		}
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.setViewName("/WEB-INF/front/check.jsp");
		return modelView;
	}
	@RequestMapping("/order/check") 
	public ModelAndView check(){
		HttpSession session = request.getSession();

		if (session.getAttribute("userInfo") == null){
			ModelAndView modelView=new ModelAndView();
			modelView.addObject("canback",true);
			modelView.setViewName("/WEB-INF/front/login.jsp");
			modelView.addObject("title","Log In");
			return modelView;
		}
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/order.jsp");
		modelView.addObject("title","Confirm order");
		modelView.addObject("canback",true);
		return modelView;
	}

}
