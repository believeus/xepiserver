package com.epidial.controller;

import com.epidial.serivce.QuestionnaireService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @ CreateDate : Create in 16:02 2019/3/27
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Controller
@CrossOrigin
@RequestMapping(value = "/FormTableController")
public class FormTableController {
    @Resource
    private QuestionnaireService questionnaireService;

    @RequestMapping(value = "/getForm")
    public void GetForm(HttpServletRequest request , HttpServletResponse response){
        System.out.println("进入了方法");
        Map<String,String[]> map = request.getParameterMap();

//        Iterator<Map.Entry<String,String[]>> entries = map.entrySet().iterator();
//        while (entries.hasNext()) {
//            Map.Entry<String,String[]> entry = entries.next();
//            System.out.println("Key = " + entry.getKey() + ", Value = " + Arrays.toString(entry.getValue()));
//        }

        String type = map.get("Code")[0];

        if (type.equals("001")) {
            //插入大肠癌高危人群基本信息调查表
            questionnaireService.InsertColorectal(map);
        }
        else if (type.equals("002")) {
            //插入癌症预防知识调查表
            questionnaireService.Insertprevent(map);
        }
        else if (type.equals("003")) {
            //插入大肠癌筛查数量化风险评估问卷
            questionnaireService.Insertquantity(map);
        }


    }

    @RequestMapping(value = "/toCancer")
    public String toCancer(){
        return "cancer";
    }

    @RequestMapping(value = "/toPrevent")
    public String toPrevent(){
        return "prevent";
    }

    @RequestMapping(value = "/toQuantity")
    public String toQuantity(){
        return "quantity";
    }
}
