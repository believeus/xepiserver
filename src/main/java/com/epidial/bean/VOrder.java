package com.epidial.bean;

import java.util.List;

public class VOrder {
    private String uuid;
    private List<Wares> waresBox;
    private float total;
    private Address address;
    private Integer id;
    private String promo_code;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public List<Wares> getWaresBox() {
        return waresBox;
    }

    public void setWaresBox(List<Wares> waresBox) {
        this.waresBox = waresBox;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPromo_code() {
        return promo_code;
    }

    public void setPromo_code(String promo_code) {
        this.promo_code = promo_code;
    }


}
