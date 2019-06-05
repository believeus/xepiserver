package com.epidial.controller.Page;

import com.epidial.bean.User;
import com.epidial.dao.Info.TaskDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class BioReportController {

	@Resource
	private TaskDao cartDao;


	@RequestMapping("/user/bioreport/index")
	public ModelAndView  index(HttpSession session){
		ModelAndView modelView=new ModelAndView();
		User user = (User)session.getAttribute("sessionuser");
		//检查是否购买了生物学年龄试剂检测
		if (cartDao.findDNA(user.getUuid()).isEmpty()){
			modelView.setViewName("/WEB-INF/front/aging.jsp");
			modelView.addObject("title","Aging");
			modelView.addObject("canback",true);
			return modelView;
		}
		modelView.setViewName("/WEB-INF/front/bioreport.jsp");
		modelView.addObject("title"," biological Age report");
		modelView.addObject("canback", true);
		return  modelView;
	}
}
