package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConcentController {
	@RequestMapping("/concent/index")
	public ModelAndView concent(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/concent.jsp");
		modelView.addObject("title","User Informed Consent");
		modelView.addObject("canback",true);
		return modelView;
	}


}
