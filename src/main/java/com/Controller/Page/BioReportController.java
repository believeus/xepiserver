package com.Controller.Page;

import com.Bean.User;
import com.Serivce.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BioReportController {
	@Autowired
	private HttpServletRequest request;

	@Autowired
	private OrderService orderService;


	@RequestMapping("/bioreport/index")
	public ModelAndView  index(){
		HttpSession session = request.getSession();
		if (session.getAttribute("userInfo") == null){
			ModelAndView modelView=new ModelAndView();
			modelView.setViewName("/WEB-INF/front/login.jsp");
			modelView.addObject("title","Login");
			modelView.addObject("canback",false);
			return modelView;
		}
		User userInfo = (User)session.getAttribute("userInfo");

		if (!orderService.CheckOrderExist(userInfo.getUuid())){
			ModelAndView modelView=new ModelAndView();
			modelView.setViewName("/WEB-INF/front/aging.jsp");
			modelView.addObject("title","Aging");
			modelView.addObject("canback",false);
			return modelView;
		}
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/bioreport.jsp");
		modelView.addObject("title"," biological Age report");
		modelView.addObject("canback", true);
		return  modelView;
	}
}
