package com.epidial.bean;

import java.util.List;

public class Order {
    private long Order_id;
    private int Goods_id;
    private int Goods_count;
    private long Order_time;
    private int PayStatus_Code;
    private int addressId;//地址id
    private List<Wares> waresbox;

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

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public List<Wares> getWaresbox() {
        return waresbox;
    }

    public void setWaresbox(List<Wares> waresbox) {
        this.waresbox = waresbox;
    }
}
