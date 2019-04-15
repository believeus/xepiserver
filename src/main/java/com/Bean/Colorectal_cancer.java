package com.Bean;


import org.springframework.stereotype.Component;

/**
 * @ CreateDate : Create in 10:10 2019/4/1
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Component
public class Colorectal_cancer {
    private String UserInfo;
    private String General;
    private String Smoking;
    private String Drink;
    private String Tea;
    private String Food;
    private String ID;
    private String Tumor;
    private String Code;
    private String Body;
    private long Time;

    public String getUserInfo() {
        return UserInfo;
    }

    public void setUserInfo(String userInfo) {
        UserInfo = userInfo;
    }

    public String getGeneral() {
        return General;
    }

    public void setGeneral(String general) {
        General = general;
    }

    public String getSmoking() {
        return Smoking;
    }

    public void setSmoking(String smoking) {
        Smoking = smoking;
    }

    public String getDrink() {
        return Drink;
    }

    public void setDrink(String drink) {
        Drink = drink;
    }

    public String getTea() {
        return Tea;
    }

    public void setTea(String tea) {
        Tea = tea;
    }

    public String getFood() {
        return Food;
    }

    public void setFood(String food) {
        Food = food;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getTumor() {
        return Tumor;
    }

    public void setTumor(String tumor) {
        Tumor = tumor;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String code) {
        Code = code;
    }

    public long getTime() {
        return Time;
    }

    public void setTime(long time) {
        Time = time;
    }

    public String getBody() {
        return Body;
    }

    public void setBody(String body) {
        Body = body;
    }

}
