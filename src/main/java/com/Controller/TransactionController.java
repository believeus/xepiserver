package com.Controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.Serivce.CartService;
import com.Serivce.OrderService;
import com.Serivce.WaresService;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import org.springframework.web.servlet.ModelAndView;

/**
 * @ CreateDate : Create in 11:29 2019/3/8
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Controller
@CrossOrigin
@RequestMapping(value = "/transaction")
public class TransactionController {

    @Resource
    private CartService cartService;

    @Resource
    private OrderService orderService;

    @Resource
    private WaresService waresService;

    @Autowired
    private HttpServletRequest request;

    //产品信息查询


    //用于接受购物车第一次的商品传递
    @RequestMapping(value = "/PostCar")
    @ResponseBody
    public String PostCar(@RequestBody JSONObject jsonObject, HttpServletResponse response){
        ModelAndView modelView=new ModelAndView();
        List<Wares> list = new ArrayList<Wares>();
        System.out.println("wares:");

        //获得存放在wares中的商品编号和数量
        JSONArray seconddataArray = jsonObject.getJSONArray("wares");
        for (int x = 0; x < seconddataArray.size(); x++)
        {
            Wares wares = new Wares();
            JSONObject seconddata = (JSONObject) seconddataArray.get(x);
            System.out.println("wares_id:" + seconddata.get("wares_id"));
            wares.setWares_id(Integer.parseInt(seconddata.get("wares_id").toString()));
            System.out.println("wares_count:" + seconddata.get("wares_count"));
            wares.setWares_count(Integer.parseInt(seconddata.get("wares_count").toString()));
            list.add(wares);
        }
        //将数据临时存入对象中
        JsonOrderBean data = new JsonOrderBean();

        //处理商品信息（包括商品本身信息，以及用户加入购物车商品的数量）
        List<Wares> list2 = waresService.getInfo(list);
        for (int i = 0 ; i < list.size() ; i++){
            list2.get(i).setWares_count(list.get(i).getWares_count());
        }

        data.setList(list2);

        data.setTotal_price(new BigDecimal(jsonObject.getString("total_price")));
        HttpSession session = request.getSession();
        session.setAttribute("Cart" , data);

        System.out.println(data);
        Map map = new HashMap();
        map.put("data" ,data);

        if (session.getAttribute("userInfo") == null){

            map.put("msg" , "error");
            return "login.jhtml";
        }
        //return map;
        return "cart/check.jhtml";
    }

    //购物车查询
    @RequestMapping(value = "/checkCart")
    public Map checkCart(@Param("uuid")String uuid, HttpServletResponse response){
        response.addHeader( "Access-Control-Allow-Origin", "*" );
        //User user = (User)request.getSession().getAttribute("userInfo");
        return cartService.CheckCart(uuid);
    }

    //更新购物车
    @RequestMapping(value = "/updatdCart" , method = RequestMethod.GET)
    public Map updataCart(@RequestBody JSONObject jsonObject){
        //获取session中的user的对象
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user");

        Map<String , Object> map = new HashMap<String , Object>();
        Wares wares = new Wares();
        wares.setUuid(userInfo.getUuid());
        wares.setWares_id(Integer.parseInt(jsonObject.getString("wares_id")));
        wares.setWares_count(Integer.parseInt(jsonObject.getString("wares_count")));

        String type = jsonObject.getString("type");

        if (type.equals("insert")){
            map.put("data" , cartService.InsertIntoCart(wares));
            return map;
        }
        else if (type.equals("updata")){
            map.put("data" , cartService.UpdataSetCart(wares));
            return map;
        }

        map.put("data" , "请查看url格式是否有误");
        return map;

    }

    //移出购物车
    @RequestMapping(value = "/deleteCart")
    public Map deleteCart(@RequestBody JSONObject jsonObject){
        //获取session中的user的对象
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user");

        Map<String , Object> map = new HashMap<String , Object>();
        Wares wares = new Wares();
        wares.setUuid(userInfo.getUuid());
        wares.setWares_id(Integer.parseInt(jsonObject.getString("wares_id")));

        if (wares != null){
            map.put("data" , cartService.deleteFromCart(wares));
            return map;
        }

        map.put("data" , "删除失败");
        return map;
    }


    //提交订单
    @ResponseBody
    @RequestMapping(value = "/LoadOrder" , produces = "application/json;charset=UTF-8")
    public Map PostOrder(@RequestBody JSONObject jsonObject) {
        /*
        * {
        *   "wares" : [ //用户选择提交的商品列表
        *           {"wares_id" : 1 , "wares_count" : 1},
        *           {"wares_id" : 2 , "wares_count" : 1}
        *   ],
        *   "addr" : {
        *               "recipient" : //收件人,
        *               "phone" : //收件人联系方式,
        *               "postalcode" : //收件人邮编,
        *               "country" : //国家,
        *               "address" : //地址
        *            },
        *   "total_price" : //总价[BigDecimal类型，如果需要传入则以String传入即可,
        *   "promo_code" : //优惠码，用于分销商
        *
        * }
        * */

        HttpSession session = request.getSession();
        session.setAttribute("ORDER" , jsonObject);
        Map<String , Object> map = new HashMap<String , Object>();

//        if (session.getAttribute("userInfo") == null){
//            map.put("msg" , "error");
//            return map;
//        }

        System.out.println(jsonObject.toJSONString());
        List<Wares> list = new ArrayList<Wares>();


        //用于存储前台传递的数值的对象
        JsonOrderBean data = new JsonOrderBean();

        //获得uuid
        User userInfo = (User)session.getAttribute("userInfo");
        data.setUuid(userInfo.getUuid());

        //获取购物车寄存的信息
        JsonOrderBean jsb = (JsonOrderBean)session.getAttribute("Cart");
        data.setList(jsb.getList());


        System.out.println(userInfo);

        //获取json中用户传递的收货地址信息
        if(jsonObject.getString("addr").isEmpty()){
           map.put("msg" , "获取用户地址失败！");
           return map;
        }
        else {
            Address address = jsonObject.getObject("addr" , Address.class);
            data.setAddress(address);
        }

        //获得存放在wares中的商品编号和数量
        try {
            //获取前端页面传递的价格
            data.setTotal_price(jsb.getTotal_price());

            //data.setTotal_price(new BigDecimal(jsonObject.getString("total_price")));

//            JSONArray seconddataArray = jsonObject.getJSONArray("wares");
//            for (int x = 0; x < seconddataArray.size(); x++)
//            {
//                Wares wares = new Wares();
//                JSONObject seconddata = (JSONObject) seconddataArray.get(x);
////                System.out.println(seconddata.get("wares_id"));
//                wares.setWares_id(Integer.parseInt(seconddata.get("wares_id").toString()));
//                //System.out.println(seconddata.get("wares_count"));
//                wares.setWares_count(Integer.parseInt(seconddata.get("wares_count").toString()));
//                list.add(wares);
//            }
//            data.setList(list);

            //推广码
            data.setPromo_code(jsonObject.getString("promo_code"));
            System.out.println("---------------》");
            System.out.println(jsonObject.getString("promo_code"));
            System.out.println("---------------》");
        } catch (JSONException e) {
            e.printStackTrace();
            map.put("msg" ,"创建订单失败，请联系管理员！");
            map.put("data",null);
            return map;
        }
        if (data != null){
            map.put("msg" , null);
            //Map<String , Object> m2 = orderService.OrderCreate(data);
            map.put("data", orderService.OrderCreate(data));

            return map;
        }

        map.put("msg" ,"创建订单失败，请联系管理员！");
        map.put("data",null);
        return map;
    }

    //查询用户所有订单情况
    @RequestMapping(value = "/Check")
    @ResponseBody
    public List<Order> Check(){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userInfo");
        //String uuid = "HKEPI201937192024320";
        return orderService.CheckOrder(user.getUuid());

    }

    @RequestMapping(value = "/Success.jhtml")
    public ModelAndView PaySuccess(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/front/success.jsp");
        modelView.addObject("title"," Pay Success!");
        modelView.addObject("canback", false);
        return modelView;
    }

}
