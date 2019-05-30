package com.epidial.controller.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class OrderecordController {
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/orderecord/index")
	public ModelAndView orderecord(){
		HttpSession session = request.getSession();

		ModelAndView modelView=new ModelAndView();
		if (session.getAttribute("userInfo") != null) {
			modelView.setViewName("/WEB-INF/front/orderecord.jsp");
			modelView.addObject("title", "Orderecord List");
			modelView.addObject("canback", true);
			return modelView;
		}
		else
		{
			modelView.setViewName("/WEB-INF/front/login.jsp");
			modelView.addObject("title", "Log In");
			modelView.addObject("canback", true);
			return modelView;
		}
	}


}
