package com.Controller.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class SleepController {
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/sleep/index")
	public ModelAndView sleep(){
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
		modelView.setViewName("/WEB-INF/front/sleep.jsp");
		modelView.addObject("title","Sleep Self Assessment");
		return modelView;
	}

}
