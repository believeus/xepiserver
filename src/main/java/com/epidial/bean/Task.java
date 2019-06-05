package com.epidial.bean;

public class Task {
    private  int id;
    private  int uid;
    private  int gid;
    private  String name;
    private float price;
    private String imgpath;
    private int pay;
    private int count;
    private String orderno; //订单号
    private int type;
    private String invite;//邀请码
    private  int valid; //0:订单未消费 1 订单已消费

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getOrderno() {
        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }

    public int getPay() {
        return pay;
    }

    public void setPay(int pay) {
        this.pay = pay;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getInvite() {
        return invite;
    }
    public void setInvite(String invite) {
        this.invite = invite;
    }

    public int getValid() {
        return valid;
    }

    public void setValid(int valid) {
        this.valid = valid;
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + id +
                ", uid=" + uid +
                ", gid=" + gid +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", imgpath='" + imgpath + '\'' +
                ", pay=" + pay +
                ", count=" + count +
                ", orderno='" + orderno + '\'' +
                ", type=" + type +
                ", invite='" + invite + '\'' +
                ", valid=" + valid +
                '}';
    }
}
