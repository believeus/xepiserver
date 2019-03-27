package com.Controller.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class PainController {
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/pain/index")
	public ModelAndView pain(){
		HttpSession session = request.getSession();
		if (session.getAttribute("userInfo") == null){
			ModelAndView modelView=new ModelAndView();
			modelView.setViewName("/WEB-INF/front/login.jsp");
			modelView.addObject("title","Log In");
			modelView.addObject("canback",true);
			return modelView;
		}
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.addObject("title","McGill Pain Questionnaire");
		modelView.setViewName("/WEB-INF/front/pain.jsp");
		return modelView;
	}

}
