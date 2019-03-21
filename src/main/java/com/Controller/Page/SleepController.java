package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SleepController {
	@RequestMapping("/sleep/index")
	public ModelAndView sleep(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.setViewName("/WEB-INF/front/sleep.jsp");
		modelView.addObject("title","Sleep Self Assessment");
		return modelView;
	}

}
