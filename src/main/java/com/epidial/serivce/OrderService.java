package com.epidial.serivce;

import com.epidial.bean.Order;
import com.epidial.dao.Info.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service(value = "orderSerice")
public class OrderService {

    @Resource
    private OrderDao orderDao;

    @Resource
    private WaresDao waresDao;

    @Resource
    private UserDao userDao;

    @Resource
    private CartDao cartDao;

    @Resource
    private AddressDao addressDao;

    @Autowired
    private HttpServletRequest request;




    public String UpdateOrder(String flags) {
        HttpSession session = request.getSession();
        Map<String , Object> data = (Map<String , Object>)session.getAttribute("Order");

        if (flags.equals("success")){
            orderDao.OrderUpdate(data);
        }
        return "error";
    }

    public List<Order> CheckOrder(String uuid) {
        return orderDao.CheckOrder(uuid);
    }

    public boolean CheckOrderExist(String uuid) {
        Integer i = orderDao.CheckOrderExist(uuid);
        if (i > 0){
            return true;
        }
        return false;
    }
}
