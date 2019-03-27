package com.Serivce.impl;

import com.Bean.JsonOrderBean;
import com.Bean.Order;
import com.Bean.Wares;
import com.Dao.CartDao;
import com.Dao.IUserDao;
import com.Dao.OrderDao;
import com.Dao.WaresDao;
import com.Serivce.OrderService;
import com.Utils.GeneratorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ CreateDate : Create in 10:33 2019/3/9
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Service(value = "orderSerice")
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;

    @Resource
    private WaresDao waresDao;

    @Resource
    private IUserDao userDao;

    @Resource
    private CartDao cartDao;

    @Autowired
    private HttpServletRequest request;


    public Map<String , Object> OrderCreate(JsonOrderBean data) {
        Map<String , Object> map = new HashMap<String , Object>();
        Map<String , Object> dataMap = new HashMap<String , Object>();

        System.out.println("----------------------");
        System.out.println(data.toString());
        System.out.println("----------------------");

        //截取获取当前的时间戳
        long time = System.currentTimeMillis();

        long order_id = GeneratorCode.getOrderCode(time);

        map.put("order_id" , order_id);
        map.put("list" , data.getList());
        map.put("uuid" , data.getUuid());

        System.out.println(data.toString());

        //更新详细订单情况表（订单号，商品id,商品数量）
        orderDao.OrderMessCreate(map);

        //计算当前提交的商品总价格
//        List<Wares> wares = data.getList();
//        Double sum = 000.0;
//        for (int i = 0 ; i < wares.size() ; i++){
//            //获得商品的单价
//            Double Unit_price = (waresDao.selectWares(wares.get(i).getWares_id())).getSell_price();
//            //获得顾客选择该商品的总价格 （单价 * 数量）
//            Double pro = Unit_price * wares.get(i).getWares_count();
//            sum += pro;
//            System.out.println("sum = " + sum + "  " + wares.get(i).getWares_name() + "price = " + pro);
//        }

        //创建一个新的地址
        map.put("addr" , data.getAddress());
//        if ( userDao.InsertNewAddress(map) <= 0){
//            dataMap.put("msg" , "创建新地址失败！");
//            return dataMap;
//        }

        if ( userDao.InsertNewAddress(data) <= 0){
            dataMap.put("msg" , "创建新地址失败！");
            return dataMap;
        }

        //设置发货地址链接到地址表中
        int i = userDao.getKey(data.getUuid());

//        System.out.println("----------------------");
//        System.out.println(data.getId());
//        System.out.println("----------------------");

        dataMap.put("order_id" , order_id);
        dataMap.put("uuid" , data.getUuid());
        dataMap.put("Total_price" , data.getTotal_price());
        dataMap.put("PayStatus_code" , 101);
        dataMap.put("order_time" , time);
        dataMap.put("identifier" , i);
        dataMap.put("promo_code" , data.getPromo_code());

        System.out.println("---------------》");
        System.out.println(data.getPromo_code());
        System.out.println("---------------》");

        HttpSession session = request.getSession();
        session.setAttribute("Order" , dataMap);
        if (orderDao.OrderListCreate(dataMap) > 0){
            System.out.println("更新订单表成功");

            //成功创建订单后，销毁在购物车的情况
            cartDao.MoveCartWares(map);
        }

        return dataMap;
    }

    @Override
    public String UpdateOrder(String flags) {
        HttpSession session = request.getSession();
        Map<String , Object> data = (Map<String , Object>)session.getAttribute("Order");

        if (flags.equals("success")){
            orderDao.OrderUpdate(data);
        }
        return "error";
    }

    @Override
    public List<Order> CheckOrder(String uuid) {
        return orderDao.CheckOrder(uuid);
    }
}
