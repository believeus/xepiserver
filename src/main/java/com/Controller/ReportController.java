package com.Controller;

import com.Bean.User;
import com.Dao.ReportDao;
import com.Serivce.ReportService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @ CreateDate : Create in 19:32 2019/3/21
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Controller
@CrossOrigin
@RequestMapping(value = "/report")
public class ReportController {

    @Resource
    private ReportService reportService;

    @Resource
    private HttpServletResponse response;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping(value = "/getData")
    @ResponseBody
    public List getData(@RequestBody JSONObject jsonObject){
        HttpSession session = request.getSession();
        User userInfo = (User)session.getAttribute("userInfo");
        return reportService.GetDataForReport(userInfo.getUuid());
    }

    @RequestMapping(value = "/report")
    public ModelAndView index(){
        response.setHeader("Access-Control-Allow-Origin", "*");

        HttpSession session = request.getSession();
        if (session.getAttribute("userInfo") == null){
            ModelAndView modelView=new ModelAndView();
            modelView.setViewName("/WEB-INF/front/login.jsp");
            modelView.addObject("title","Login");
            modelView.addObject("canback",false);
            return modelView;
        }

        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/report.jsp");
        modelView.addObject("title","Home");
        modelView.addObject("canback",false);
        return modelView;
    }

    @RequestMapping(value = "/getDataForOne")
    @ResponseBody
    public List getDataForOne(@RequestBody JSONObject jsonObject){
        //return reportService.GetDataForPerson(jsonObject.getString("id"));
        return reportService.GetDataForPersonById(jsonObject.getString("uuid"));
    }
}
