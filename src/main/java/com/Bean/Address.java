package com.Bean;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @ CreateDate : Create in 16:12 2019/3/12
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Component
@ConfigurationProperties(value = "address")
public class Address {
    private String uuid;
    private String recipient;
    private String phone;
    private String country;
    private String address;
    private String postalcode;
    private Integer address_id;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode;
    }

    public Integer getAddress_id() {
        return address_id;
    }

    public void setAddress_id(Integer address_id) {
        this.address_id = address_id;
    }

    @Override
    public String toString() {
        return "Address{" +
                "uuid='" + uuid + '\'' +
                ", recipient='" + recipient + '\'' +
                ", phone='" + phone + '\'' +
                ", country='" + country + '\'' +
                ", address='" + address + '\'' +
                ", postalcode='" + postalcode + '\'' +
                ", address_id=" + address_id +
                '}';
    }
}
