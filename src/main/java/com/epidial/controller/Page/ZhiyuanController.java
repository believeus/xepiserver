package com.epidial.controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ZhiyuanController {
	@RequestMapping("/zhiyuan/index")
	public ModelAndView zhiyuan(){
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("canback",true);
		modelView.addObject("title","Zhiyuan Lv Introduction");
		modelView.setViewName("/WEB-INF/front/zhiyuan.jsp");
		return modelView;
	}

}
