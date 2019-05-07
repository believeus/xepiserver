package com.Controller.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
//@PropertySource("classpath:project.properties")
public class IndexController {

	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/index")
	public ModelAndView   home(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/index.jsp");
		modelView.addObject("title","Home");
		modelView.addObject("canback",false);
		return modelView;
	}

	@RequestMapping("/")
	public ModelAndView   home2(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/index.jsp");
		modelView.addObject("title","Home");
		modelView.addObject("canback",false);
		return modelView;
	}

	@RequestMapping("/welcome")
	public ModelAndView welcome(){
		HttpSession session = request.getSession();
		ModelAndView modelView = new ModelAndView();

		if (session.getAttribute("userInfo") == null){

			modelView.setViewName("/WEB-INF/front/welcome.jsp");
			return modelView;
		}
		else{
			modelView.setViewName("/WEB-INF/front/index.jsp");
			modelView.addObject("title","Home");
			modelView.addObject("canback",false);
			return modelView;
		}
	}
}
