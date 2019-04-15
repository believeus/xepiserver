package com.Controller.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UsercenterController {
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/mycenter/index")
	public ModelAndView mycenter(){
		ModelAndView modelView=new ModelAndView();

		HttpSession session = request.getSession();
		if (session.getAttribute("userInfo") == null){
			modelView.setViewName("/WEB-INF/front/login.jsp");
			modelView.addObject("title","Log In");
			modelView.addObject("canback",true);
			return modelView;
		}
		modelView.setViewName("/WEB-INF/front/usercenter.jsp");
		modelView.addObject("title","User Center");
		modelView.addObject("canback",true);
		return modelView;
	}


}
