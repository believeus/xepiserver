package com.Controller;

import com.Bean.ChartData;
import com.Serivce.ILifeService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @ CreateDate : Create in 14:18 2019/2/27
 * @ Explain :
 * @ UpdateDate : Update in
 */
@RestController
@RequestMapping(value = "/Life")
public class LifeController {
    @Resource
    private ILifeService lifeService;

    @Resource
    private HttpServletRequest request;


    @RequestMapping(value = "/getPartOfLife")
    public Map<String, Object> getLife(@RequestBody JSONObject jsonObject){
        /*
        *  {
        *   "column" : //栏目内容,
        *   "type" : //如果是Food栏目则需要注明是什么餐,
        *   "value1" : //输入的值1,
        *   "value2" : //输入的值2
        *  }
        * */

        String column = jsonObject.getString("column");
        Double value1 = Double.parseDouble(jsonObject.getString("value1"));
        Double value2 = 0.00;
        if (jsonObject.getString("value2") != null) {
            value2 = Double.parseDouble(jsonObject.getString("value2"));
        }
        String type = jsonObject.getString("type");
        if (column.equals("Food")){
            return lifeService.getLift(column,type,value1,value2);
        }
        else
            return lifeService.getLift(column,value1,value2);
    }

    @RequestMapping(value = "/getDataOfLife")
    public List getDateOfLife(@RequestBody JSONObject jsonObject){
        /*
        *  {
        *   "column" : //栏目名
        *   "type" :  //用于特别指向Food 栏目属于早中午晚餐
        *  }
        * */
        //String uuid = jsonObject.getString("uuid");

        String column = jsonObject.getString("column");
        String type = jsonObject.getString("type");
        return lifeService.getData(column , type);
    }
}
