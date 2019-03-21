package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class VitaminDController {
	@RequestMapping("/vitaminD/index")
	public ModelAndView  vitaminD(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/vitaminD.jsp");
		modelView.addObject("title","VitaminD introduction");
		modelView.addObject("canback",true);
		return modelView;
	}
	

}
