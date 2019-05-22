package com.Bean;

/**
 * @ CreateDate : Create in 15:30 2019/3/7
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
public class UserInfo {
    private String uuid;
    private String phone;
    private String mail;
    private String wx_openid;
    private String code;
    private String type;
    private String password;
    private String country;
    private String mail_status;
    private String nickname;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }


    public String getPwd() {
        return password;
    }

    public void setPwd(String pwd) {
        this.password = pwd;
    }

    public String getWx_openid() {
        return wx_openid;
    }

    public void setWx_openid(String wx_openid) {
        this.wx_openid = wx_openid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getMail_status() {
        return mail_status;
    }

    public void setMail_status(String mail_status) {
        this.mail_status = mail_status;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "uuid='" + uuid + '\'' +
                ", phone='" + phone + '\'' +
                ", mail='" + mail + '\'' +
                ", wx_openid='" + wx_openid + '\'' +
                ", code='" + code + '\'' +
                ", type='" + type + '\'' +
                ", pwd='" + password + '\'' +
                ", country='" + country + '\'' +
                ", mail_status='" + mail_status + '\'' +
                ", nickname='" + nickname + '\'' +
                '}';
    }
}
