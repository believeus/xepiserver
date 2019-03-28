package com.Serivce;

import com.Bean.JsonOrderBean;
import com.Bean.Order;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
public interface OrderService {

    public Map<String , Object> OrderCreate(JsonOrderBean data);

    public String UpdateOrder(String flags);

    public List<Order> CheckOrder(String uuid);

    public boolean CheckOrderExist(String uuid);
}
