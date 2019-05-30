package com.epidial.controller;

import com.epidial.bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ShortformController {
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/shortformpain")
	public ModelAndView   home(){
		HttpSession session = request.getSession();
		ModelAndView modelView=new ModelAndView();
		if ((User)session.getAttribute("userInfo") != null) {
			modelView.setViewName("/WEB-INF/front/shortformpain.jsp");
			modelView.addObject("title", "The short-form McGill Questionnaire");
			modelView.addObject("canback", true);
			return modelView;
		}
		else
		{
			modelView.setViewName("/WEB-INF/front/login.jsp");
			modelView.addObject("title", "Log in");
			modelView.addObject("canback", false);
			return modelView;
		}
	}

}
