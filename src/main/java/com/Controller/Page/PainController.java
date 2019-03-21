package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PainController {
	@RequestMapping("/pain/index")
	public ModelAndView pain(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.addObject("title","McGill Pain Questionnaire");
		modelView.setViewName("/WEB-INF/front/pain.jsp");
		return modelView;
	}

}
