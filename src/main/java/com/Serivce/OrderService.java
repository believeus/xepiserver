package com.Serivce;

import com.Bean.JsonOrderBean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Transactional
public interface OrderService {

    public Map<String , Object> OrderCreate(JsonOrderBean data);

    public String UpdateOrder(String flags);
}
