package com.epidial.bean;

//生物学年龄信息
public class Udata {
    private String id;
    private String username;
    private int uid;//用户id
    private double naturally;
    private double biological;
    private String barcode;
    private String status;//状态：pending processing finished

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getNaturally() {
        return naturally;
    }

    public void setNaturally(double naturally) {
        this.naturally = naturally;
    }

    public double getBiological() {
        return biological;
    }

    public void setBiological(double biological) {
        this.biological = biological;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}