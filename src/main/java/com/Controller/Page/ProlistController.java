package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProlistController {
	@RequestMapping("/prolist/index")
	public ModelAndView  prolist(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/prolist.jsp");
		modelView.addObject("title","Product list");
		modelView.addObject("canback",true);
		return modelView;
	}

}
