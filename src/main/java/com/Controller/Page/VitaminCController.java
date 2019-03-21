package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VitaminCController {
	@RequestMapping("/vitaminC/index")
	public ModelAndView vitaminC(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/vitaminC.jsp");
		modelView.addObject("title","VitaminC introduction");
		modelView.addObject("canback",true);
		return modelView;
	}		
	}

