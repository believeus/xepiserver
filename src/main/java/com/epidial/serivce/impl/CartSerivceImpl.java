package com.epidial.serivce.impl;

import com.epidial.bean.Wares;
import com.epidial.dao.Info.CartDao;
import com.epidial.dao.Info.WaresDao;
import com.epidial.serivce.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ CreateDate : Create in 13:33 2019/3/8
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Component
@Service(value = "CartService")
public class CartSerivceImpl implements CartService {

    @Resource
    private CartDao cartDao;

    @Resource
    private WaresDao waresDao;

    @Autowired
    private HttpServletRequest request;

    public Map<String , Object> CheckCart(String uuid){
        //User user = (User)request.getSession().getAttribute("userInfo");

        //List<Wares> list = waresDao.selectCartWares(user.getUuid());

        List<Wares> list = waresDao.selectCartWares(uuid);
        Map<String , Object> map = new HashMap<String , Object>();
        map.put("CartList" , list);
        return map;
    }

    @Override
    public String InsertIntoCart(Wares wares) {
        if (cartDao.InsertIntoCart(wares) == 1){
            return "加入购物车成功！";
        }
        return "加入购物车失败";
    }

    @Override
    public String UpdataSetCart(Wares wares) {
        if (cartDao.UpdateSetCart(wares) == 1){
            return "更新购物车成功！";
        }
        return "更新购物车出错";
    }

    @Override
    public String deleteFromCart(Wares wares) {
        if (cartDao.DeleteFromCart(wares) == 1){
            return "删除栏目成功！";
        }
        return "删除栏目失败！";
    }
}
