package com.epidial.bean;

public class Wares {
    private int wares_id;
    private int wares_count;
    private String uuid;
    private String wares_name;
    private String wares_info;
    private Double sell_price;
    private Double discount;
    private String wares_img;

    public int getWares_id() {
        return wares_id;
    }

    public void setWares_id(int wares_id) {
        this.wares_id = wares_id;
    }

    public int getWares_count() {
        return wares_count;
    }

    public void setWares_count(int wares_count) {
        this.wares_count = wares_count;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getWares_name() {
        return wares_name;
    }

    public void setWares_name(String wares_name) {
        this.wares_name = wares_name;
    }

    public String getWares_info() {
        return wares_info;
    }

    public void setWares_info(String wares_info) {
        this.wares_info = wares_info;
    }

    public Double getSell_price() {
        return sell_price;
    }

    public void setSell_price(Double sell_price) {
        this.sell_price = sell_price;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "wares_id=" + wares_id +
                ", wares_count=" + wares_count +
                ", uuid='" + uuid + '\'' +
                ", wares_name='" + wares_name + '\'' +
                ", wares_info='" + wares_info + '\'' +
                ", sell_price=" + sell_price +
                ", discount=" + discount +
                '}';
    }

    public String getWares_img() {
        return wares_img;
    }

    public void setWares_img(String wares_img) {
        this.wares_img = wares_img;
    }
}
