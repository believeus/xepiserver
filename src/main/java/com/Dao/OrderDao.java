package com.Dao;

import com.Bean.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderDao {

    //根据用户order_id ，list<cart> 订单产品表
    public int OrderMessCreate(Map<String , Object> map);

    //根据用户uuid , 订单号，商品价格，支付情况，提交时间，用户收件信息码
    public int OrderListCreate(Map<String , Object> map);

    //修改订单状态
    public int OrderUpdate(Map<String , Object> map);

    //反馈用户所有订单状况
    public List<Order> CheckOrder(String uuid);

    //查看用户是否购买产品
    public Integer CheckOrderExist(String uuid);
}
