package com.epidial.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ShortformController {
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/user/pian/shortform")
	public ModelAndView  shortformpain(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/shortformpain.jsp");
		modelView.addObject("title", "The short-form McGill Questionnaire");
		modelView.addObject("canback", true);
		return modelView;
	}

}
