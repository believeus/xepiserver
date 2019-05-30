package com.epidial.controller;

import com.epidial.bean.User;
import com.epidial.serivce.ILifeService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ CreateDate : Create in 14:18 2019/2/27
 * @ Explain :
 * @ UpdateDate : Update in
 */
@Controller
@CrossOrigin
@RequestMapping(value = "/Life")
public class LifeController {
    @Resource
    private ILifeService lifeService;

    @Resource
    private HttpServletRequest request;


    @RequestMapping(value = "/InsertPartOfLife")
    @ResponseBody
    public Map<String , Object> getLife(@RequestBody JSONObject jsonObject){
        /*
        *  {
        *   "column" : //栏目内容,
        *   "type" : //如果是Food栏目则需要注明是什么餐,
        *   "value1" : //输入的值1,
        *   "value2" : //输入的值2
        *  }
        * */
        System.out.println("*****************************");
        System.out.println(jsonObject);
        System.out.println("*****************************");

        //column 去空格处理
        String column = jsonObject.getString("column");
        column = column.replace(" " , "");

        Double value1 = 0.0;
        Double value2 = 0.0;

        //前端传值 uuid 去空格处理
//        String uuid = jsonObject.getString("uuid");
//        uuid = uuid.replace(" " , "");

        HttpSession session = request.getSession();
        User userInfo = (User)session.getAttribute("sessionuser");
        String uuid = userInfo.getUuid();

        System.out.println(jsonObject);
        if (jsonObject.getString("value1") != null){
            value1 = Double.parseDouble(jsonObject.getString("value1"));
        }

        if (jsonObject.getString("value2") != null) {
            value2 = Double.parseDouble(jsonObject.getString("value2"));
        }
        String type = jsonObject.getString("type");
        if (column.equals("Food")){
            lifeService.getLift(column,type,value1,value2,uuid);
            Map map = new HashMap();
            map.put("msg" , "success");
            return map;
        }
        else
            lifeService.getLift(column,value1,value2,uuid);
            Map map = new HashMap();
            map.put("msg" , "success");
            return map;
    }

    @RequestMapping(value = "/getDataOfLife")
    @ResponseBody
    public List getDateOfLife(@RequestBody JSONObject jsonObject){
        /*
        *  {
        *   "column" : //栏目名
        *   "type" :  //用于特别指向Food 栏目属于早中午晚餐
        *  }
        * */
        //String uuid = jsonObject.getString("uuid");

        System.out.println("-------------------------------");
        System.out.println(jsonObject);
        System.out.println("-------------------------------");

        HttpSession session = request.getSession();
        User userInfo = (User)session.getAttribute("sessionuser");
        String uuid = userInfo.getUuid();

        //column 去空格处理
        String column = jsonObject.getString("column");
        column = column.replace(" " , "");

        String type = jsonObject.getString("type");

        //前端传值 uuid 去空格处理
        //String uuid  = jsonObject.getString("uuid");
        uuid = uuid.replace(" " , "");
        return lifeService.getData(column , type , uuid);
    }
}
