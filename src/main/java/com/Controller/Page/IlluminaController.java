package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IlluminaController {
	@RequestMapping("/illumina/index")
	public ModelAndView illumina(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/illumina.jsp");
		modelView.addObject("title","Illumina sequencing technology");
		modelView.addObject("canback",true);
		return modelView;
	}


}
