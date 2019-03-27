package com.Controller.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderecordController {
	@RequestMapping("/orderecord/index")
	public ModelAndView orderecord(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/orderecord.jsp");
		modelView.addObject("title","Orderecord List");
		modelView.addObject("canback",true);
		return modelView;
	}


}
