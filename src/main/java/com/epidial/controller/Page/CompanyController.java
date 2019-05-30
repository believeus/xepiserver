package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CompanyController {
	@RequestMapping("/company/index")
	public ModelAndView company(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/company.jsp");
		modelView.addObject("title","Company introduction");
		modelView.addObject("canback",true);
		return modelView;
	}


}
