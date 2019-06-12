package com.epidial.controller;

import com.alibaba.fastjson.JSONObject;
import com.epidial.bean.Question;
import com.epidial.bean.Questionnaire;
import com.epidial.bean.User;
import com.epidial.serivce.QuestionnaireService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
@RestController
@CrossOrigin
@RequestMapping(value = "/Questionnaire")
public class QuestionnaireController {

    @Resource
    private QuestionnaireService questionnaireService;


    @RequestMapping(value = "/Input")
    @ResponseBody
    public Map<String , Object> InputData(@RequestBody JSONObject jsonObject,HttpSession session){
        /*
        * {
        *   "type" : //问卷调查表的类型
        *   "data" : {
        *           "id" : //题号
        *           "value" : //值
        *   }//问卷提交的数据
        * }
        * */
        //获取问卷调查表的类型
        String type = jsonObject.getString("type");
        User userInfo = (User)session.getAttribute("sessionuser");
        //System.out.println(type);

        //userInfo.setUuid("HKEPI201937192024320");
        //String uuid = "HKEPI201937192024320";

        //System.out.println(jsonArray);
        Question data = jsonObject.getObject("data" , Question.class);
        //String a [] = null;
//        for (int i = 0 ; i < jsonArray.size() ; i++){
//            JSONObject jsonObject = jsonArray.getJSONObject(i);
//            System.out.println(jsonObject,.);
//            a[i] = jsonObject.toString();
//            //a[i] = list.get(i).toString();
//        }
        //String type = a[0];
        //Question data = new Question();
        //data.setId(Integer.parseInt(a[1]));
        //data.setValue(a[2]);


        Questionnaire questionnaire = new Questionnaire();

        //questionnaire.setUuid(jsonObject.getString("uuid"));
        //questionnaire.setUuid(uuid);
        questionnaire.setUuid(userInfo.getUuid());
        questionnaire.setType(type);

        return questionnaireService.setData(questionnaire , data);
    }

    @RequestMapping(value = "/GetData")
    //@RequestBody JSONObject jsonObject
    public List GetData(@RequestBody JSONObject jsonObject, HttpServletResponse response,HttpSession session){

        response.setHeader("Access-Control-Allow-Origin", "*");
        //System.out.println("------>" + data);
        //从json对象中获取数据
        Integer number = jsonObject.getInteger("number");
        String type = jsonObject.getString("type");
        List list = new LinkedList();

        User userInfo = (User)session.getAttribute("sessionuser");
        String uuid = userInfo.getUuid();

        Questionnaire questionnaire = new Questionnaire();
        //questionnaire.setUuid(jsonObject.getString("uuid"));
        questionnaire.setType(type);
        //questionnaire.setUuid("HKEPI201937192024320");
        questionnaire.setUuid(uuid);

        Map map = questionnaireService.getData(questionnaire);



        //把后台处理完成的数据分别存放入不同的数组中
        String [][] data = (String [][])map.get("data");
        String [] time = (String [])map.get("time");

        if (time.length > 0) {
            //用于渲染用户题号实际的回答
            list.add(data[number - 1]);
            //用户指向用户填写了该提号的时间
            list.add(time);
            //最新一条记录
            list.add(data[number - 1][time.length - 1]);
        }


//        for (int m = 0 ; m < data.length ; m++){
////            System.out.printf("数组" + m + ": [");
////            for (int n = 0 ; n < 2 ; n++){
////                System.out.printf(data[m][n] + ",");
////            }
////            System.out.println("]");
//
//            System.out.println(Arrays.toString(data[m]));
//        }

        return list;
    }

//    @RequestMapping(value = "/GetReport")
//    public Map<String , Object> GetReport(@RequestBody JSONObject jsonObject){
//
//    }
}
