package com.Bean;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;

/**
 * @ CreateDate : Create in 17:25 2019/3/8
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Component
public class JsonOrderBean {
    private String uuid;
    private List<Wares> list;
    private BigDecimal total_price;
    private Address address;
    private Integer id;
    private String promo_code;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public List<Wares> getList() {
        return list;
    }

    public void setList(List<Wares> list) {
        this.list = list;
    }

    public BigDecimal getTotal_price() {
        return total_price;
    }

    public void setTotal_price(BigDecimal total_price) {
        this.total_price = total_price;
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

    @Override
    public String toString() {
        return "JsonOrderBean{" +
                "uuid='" + uuid + '\'' +
                ", list=" + list +
                ", total_price=" + total_price +
                ", address=" + address +
                ", id=" + id +
                '}';
    }
}
