package com.epidial.bean;

public class User {
    private int id;
    private String uuid;
    private String nickname;
    private String password;
    private String mail;
    private int valid; //1：验证通过 0：未验证通过
    private String country;
    private String province;
    private int naturally;//自然年龄
    private int biological;//生物学年龄
    private long register;//注册时间
    private long lastLogin;//上次登录时间
    private byte pay; //是否已经付款 1 已经付款 0 未付款
    private String state;//实验状态 pending doing done


    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public byte getPay() {
        return pay;
    }

    public void setPay(byte pay) {
        this.pay = pay;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getValid() {
        return valid;
    }

    public void setValid(int valid) {
        this.valid = valid;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public int getNaturally() {
        return naturally;
    }

    public void setNaturally(int naturally) {
        this.naturally = naturally;
    }

    public int getBiological() {
        return biological;
    }

    public void setBiological(int biological) {
        this.biological = biological;
    }

    public long getRegister() {
        return register;
    }

    public void setRegister(long register) {
        this.register = register;
    }

    public long getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(long lastLogin) {
        this.lastLogin = lastLogin;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", uuid='" + uuid + '\'' +
                ", nickname='" + nickname + '\'' +
                ", password='" + password + '\'' +
                ", mail='" + mail + '\'' +
                ", valid=" + valid +
                ", country='" + country + '\'' +
                ", province='" + province + '\'' +
                ", naturally=" + naturally +
                ", biological=" + biological +
                ", register=" + register +
                ", lastLogin=" + lastLogin +
                ", pay=" + pay +
                ", state='" + state + '\'' +
                '}';
    }
}
