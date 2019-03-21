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
    private String pwd;

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
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
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

    @Override
    public String toString() {
        return "UserInfo{" +
                "uuid='" + uuid + '\'' +
                ", phone='" + phone + '\'' +
                ", mail='" + mail + '\'' +
                ", wx_openid='" + wx_openid + '\'' +
                ", code='" + code + '\'' +
                ", pwd='" + pwd + '\'' +
                '}';
    }
}
