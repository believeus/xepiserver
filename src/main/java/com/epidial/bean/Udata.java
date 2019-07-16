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
    private long createTime;//创建时间
    private long uploadTime;//上传barcode时间
    private String email;
    public Udata(){}

    public Udata(int uid,String username,String email) {
        this.username = username;
        this.uid = uid;
        this.naturally=0;
        this.biological=0;
        this.status="pending";
        this.createTime=System.currentTimeMillis();
        this.barcode="";
        this.email=email;
    }

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

    public long getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(long uploadTime) {
        this.uploadTime = uploadTime;
    }

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
