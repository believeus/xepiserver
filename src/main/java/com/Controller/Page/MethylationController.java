package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MethylationController {
	@RequestMapping("/methylation/index")
	public ModelAndView  methylation(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/methylation.jsp");
		modelView.addObject("title","Methylation introduction");
		modelView.addObject("canback",true);
		return modelView;
	}


}
