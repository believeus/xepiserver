package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	@RequestMapping("/product/index")
	public ModelAndView index(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.setViewName("/WEB-INF/front/aging.jsp");
		return  modelView;
	}
	@RequestMapping("/product/aging")
	public ModelAndView   aging(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/aging.jsp");
		modelView.addObject("title","Standard Edition 2.0 for DNA Methylation Detection");
		modelView.addObject("canback",true);
		return modelView;
	}

}
