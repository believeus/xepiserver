package com.Bean;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @ CreateDate : Create in 9:55 2019/3/9
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Component
@ConfigurationProperties(prefix = "order")
public class Order {
    private long Order_id;
    private int Goods_id;
    private int Goods_count;
    private long Order_time;
    private int PayStatus_Code;
    private int identifier;
    private List<Wares> list;

    public long getOrder_id() {
        return Order_id;
    }

    public void setOrder_id(long order_id) {
        Order_id = order_id;
    }

    public int getGoods_id() {
        return Goods_id;
    }

    public void setGoods_id(int goods_id) {
        Goods_id = goods_id;
    }

    public int getGoods_count() {
        return Goods_count;
    }

    public void setGoods_count(int goods_count) {
        Goods_count = goods_count;
    }

    public long getOrder_time() {
        return Order_time;
    }

    public void setOrder_time(long order_time) {
        Order_time = order_time;
    }

    public int getPayStatus_Code() {
        return PayStatus_Code;
    }

    public void setPayStatus_Code(int payStatus_Code) {
        PayStatus_Code = payStatus_Code;
    }

    public int getIdentifier() {
        return identifier;
    }

    public void setIdentifier(int identifier) {
        this.identifier = identifier;
    }

    public List<Wares> getList() {
        return list;
    }

    public void setList(List<Wares> list) {
        this.list = list;
    }
}
