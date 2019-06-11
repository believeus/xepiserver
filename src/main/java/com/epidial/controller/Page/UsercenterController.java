package com.epidial.controller.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UsercenterController {
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/user/mycenter/index")
	public ModelAndView mycenter(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/usercenter.jsp");
		modelView.addObject("title","User Center");
		modelView.addObject("canback",true);
		return modelView;
	}


}
