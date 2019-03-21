package com.Controller;

import com.Bean.Question;
import com.Bean.Questionnaire;
import com.Bean.User;
import com.Serivce.QuestionnaireService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @ CreateDate : Create in 19:32 2019/3/9
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@RestController
@CrossOrigin
@RequestMapping(value = "/Questionnaire")
public class QuestionnaireController {

    @Resource
    private QuestionnaireService questionnaireService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping(value = "/Input")
    @ResponseBody
    public Map<String , Object> InputData(@RequestBody JSONObject jsonObject){
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
        //HttpSession session = request.getSession();
        //User userInfo = (User)session.getAttribute("userInfo");
        System.out.println(type);
        User userInfo = new User();
        userInfo.setUuid("HKEPI201937192024320");

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

        questionnaire.setUuid(userInfo.getUuid());
        questionnaire.setType(type);

        return questionnaireService.setData(questionnaire , data);
    }

    @RequestMapping(value = "/GetData")
    public List GetData(@RequestBody JSONObject jsonObject){
        //从json对象中获取数据
        Integer number = jsonObject.getInteger("number");
        String type = jsonObject.getString("type");
        List list = new LinkedList();

        Questionnaire questionnaire = new Questionnaire();
        questionnaire.setUuid("HKEPI201937192024320");
        questionnaire.setType(type);

        Map map = questionnaireService.getData(questionnaire);

//        if (map.get("msg").toString().equals("error")){
//            list.add("Update Error!");
//            return list;
//        }

        String [][] data = (String [][])map.get("data");
        String [] time = (String [])map.get("time");


        //for (int i = 0 ; i < time.length ; i++){
//            String [] a = new String[2];
//            a[0] = data[number - 1][i];
//            a[1] = time[i];

            list.add(data[number - 1]);
            list.add(time);
        //}

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
