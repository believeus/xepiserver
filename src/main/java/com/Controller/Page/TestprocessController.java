package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestprocessController {
	@RequestMapping("/testprocess/index")
	public ModelAndView testprocess(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.setViewName("/WEB-INF/front/testprocess.jsp");
		modelView.addObject("title","Test Process");
		return  modelView;
	}

}
