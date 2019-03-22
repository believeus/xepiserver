package com.Controller;

import com.Dao.ReportDao;
import com.Serivce.ReportService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping(value = "/getData")
    @ResponseBody
    public List getData(@RequestBody JSONObject jsonObject){
        return reportService.GetDataForReport(jsonObject.getString("id"));
    }

    @RequestMapping(value = "/report")
    public ModelAndView index(){
        response.setHeader("Access-Control-Allow-Origin", "*");
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/report.jsp");
        modelView.addObject("title","Home");
        modelView.addObject("canback",false);
        return modelView;
    }
}
