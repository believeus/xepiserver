package com.epidial.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.epidial.bean.*;
import com.epidial.dao.Info.AddressDao;
import com.epidial.dao.Info.CartDao;
import com.epidial.dao.Info.OrderDao;
import com.epidial.serivce.CartService;
import com.epidial.serivce.OrderService;
import com.epidial.serivce.WaresService;
import com.epidial.utils.GeneratorCode;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@CrossOrigin
@RequestMapping
public class TransactionController {

    @Resource
    private CartService cartService;

    @Resource
    private OrderService orderService;

    @Resource
    private WaresService waresService;

    @Resource
    private AddressDao addressDao;

    @Resource
    private OrderDao orderDao;

    @Resource
    private CartDao cartDao;


    //产品信息查询


    //用于接受购物车第一次的商品传递
    @RequestMapping(value = "/user/transaction/postCar")
    @ResponseBody
    public String PostCar(@RequestBody JSONObject jsonObject, HttpSession session) {
        ModelAndView modelView = new ModelAndView();
        List<Wares> list = new ArrayList<Wares>();

        //获得存放在wares中的商品编号和数量
        JSONArray seconddataArray = jsonObject.getJSONArray("wares");
        for (int x = 0; x < seconddataArray.size(); x++) {
            // String wares_id =Integer.parseInt (((JSONObject) seconddataArray.get(x)).get("wares_id").toString());


            Wares wares = new Wares();
            JSONObject seconddata = (JSONObject) seconddataArray.get(x);
            System.out.println("wares_id:" + seconddata.get("wares_id"));
            wares.setWares_id(Integer.parseInt(seconddata.get("wares_id").toString()));
            System.out.println("wares_count:" + seconddata.get("wares_count"));
            wares.setWares_count(Integer.parseInt(seconddata.get("wares_count").toString()));
            list.add(wares);
        }

        //将数据临时存入对象中
        VOrder data = new VOrder();

        //处理商品信息（包括商品本身信息，以及用户加入购物车商品的数量）
        List<Wares> warebox = waresService.getInfo(list);
        for (int i = 0; i < list.size(); i++) {
            warebox.get(i).setWares_count(list.get(i).getWares_count());
        }

        data.setWaresBox(warebox);

        data.setTotal(Float.parseFloat(jsonObject.getString("total_price")));
        session.setAttribute("Cart", data);
        //return map;
        return "/user/cart/check.jhtml";
    }

    //购物车查询
    @RequestMapping(value = "/user/transaction/checkCart")
    public Map checkCart(@Param("uuid") String uuid, HttpServletResponse response) {
        response.addHeader("Access-Control-Allow-Origin", "*");
        //User user = (User)request.getSession().getAttribute("userInfo");
        return cartService.CheckCart(uuid);
    }

    //更新购物车
    @RequestMapping(value = "/user/transaction/updatdCart", method = RequestMethod.GET)
    public Map updataCart(@RequestBody JSONObject jsonObject, HttpServletRequest request) {
        //获取session中的user的对象
        User userInfo = (User) request.getSession().getAttribute("sessionuser");

        Map<String, Object> map = new HashMap<String, Object>();
        Wares wares = new Wares();
        wares.setUuid(userInfo.getUuid());
        wares.setWares_id(Integer.parseInt(jsonObject.getString("wares_id")));
        wares.setWares_count(Integer.parseInt(jsonObject.getString("wares_count")));

        String type = jsonObject.getString("type");

        if (type.equals("insert")) {
            map.put("data", cartService.InsertIntoCart(wares));
            return map;
        } else if (type.equals("updata")) {
            map.put("data", cartService.UpdataSetCart(wares));
            return map;
        }

        map.put("data", "请查看url格式是否有误");
        return map;

    }

    //移出购物车
    @RequestMapping(value = "/user/transaction/deleteCart")
    public Map deleteCart(@RequestBody JSONObject jsonObject, HttpSession session) {
        //获取session中的user的对象
        User userInfo = (User) session.getAttribute("sessionuser");

        Map<String, Object> map = new HashMap<String, Object>();
        Wares wares = new Wares();
        wares.setUuid(userInfo.getUuid());
        wares.setWares_id(Integer.parseInt(jsonObject.getString("wares_id")));

        if (wares != null) {
            map.put("data", cartService.deleteFromCart(wares));
            return map;
        }

        map.put("data", "删除失败");
        return map;
    }


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
    //提交订单
    @ResponseBody
    @RequestMapping(value = "/user/transaction/loadOrder")
    public String PostOrder(@RequestBody JSONObject order, HttpSession session) {
        session.setAttribute("ORDER", order);
        System.out.println(order.toJSONString());
        //用于存储前台传递的数值的对象
        VOrder vOrder = new VOrder();
        //获得uuid
        User user = (User) session.getAttribute("sessionuser");
        vOrder.setUuid(user.getUuid());

        //获取购物车寄存的信息
        VOrder jsb = (VOrder) session.getAttribute("Cart");
        vOrder.setWaresBox(jsb.getWaresBox());

        System.out.println(user);

        //获取json中用户传递的收货地址信息
        Address address = order.getObject("addr", Address.class);
        address.setUuid(user.getUuid());
        vOrder.setAddress(address);
        addressDao.save(address);

        //获得存放在wares中的商品编号和数量
        //获取前端页面传递的价格
        vOrder.setTotal(jsb.getTotal());
        //推广码
        vOrder.setPromo_code(order.getString("promo_code"));
        System.out.println(order.getString("promo_code"));

        HashMap<String, Object> map = new HashMap<String, Object>();
        if (vOrder != null) {
            System.out.println("----------------------");
            System.out.println(vOrder.toString());
            System.out.println("----------------------");

            //截取获取当前的时间戳
            long time = System.currentTimeMillis();
            long order_id = GeneratorCode.getOrderCode(time);
            map.put("order_id", order_id);
            map.put("list", vOrder.getWaresBox());
            map.put("uuid", vOrder.getUuid());

            System.out.println(vOrder.toString());

            //更新详细订单情况表（订单号，商品id,商品数量）
            orderDao.OrderMessCreate(map);

            map.put("addr", vOrder.getAddress());
            System.out.println(vOrder.getAddress());


            map.clear();
            map.put("order_id", order_id);
            map.put("uuid", address.getUuid());
            map.put("Total_price", vOrder.getTotal());
            map.put("PayStatus_code", 101);
            map.put("order_time", time);
            map.put("addressId", address.getAddress_id());
            map.put("promo_code", vOrder.getPromo_code());
            System.out.println("---------------》");
            System.out.println(vOrder.getPromo_code());
            System.out.println("---------------》");

            session.setAttribute("Order", map);
            if (orderDao.OrderListCreate(map) > 0) {
                System.out.println("创建订单表成功");
                //成功创建订单后，销毁在购物车的情况
                //cartDao.MoveCartWares(map);
            }
        }

        return "success";
    }

    //查询用户所有订单情况
    @RequestMapping(value = "/user/transaction/check")
    @ResponseBody
    public List<Order> Check(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userInfo");
        //String uuid = "HKEPI201937192024320";
        return orderService.CheckOrder(user.getUuid());

    }

    @RequestMapping(value = "/user/transaction/success.jhtml")
    public ModelAndView PaySuccess() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/success.jsp");
        modelView.addObject("title", " Pay Success!");
        modelView.addObject("canback", false);
        return modelView;
    }

}
