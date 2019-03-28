package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BioReportController {
	@RequestMapping("/bioreport/index")
	public ModelAndView  index(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/bioreport.jsp");
		modelView.addObject("title"," biological Age report");
		modelView.addObject("canback", true);
		return  modelView;
	}
}
