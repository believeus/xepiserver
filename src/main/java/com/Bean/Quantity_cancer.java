package com.Bean;

import org.springframework.stereotype.Component;

/**
 * @ CreateDate : Create in 13:20 2019/4/2
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Component
public class Quantity_cancer {
    private String UserInfo;
    private String ExtraInfo;
    private String General;
    private String Investigation;
    private String Code;
    private Long Time;

    public String getUserInfo() {
        return UserInfo;
    }

    public void setUserInfo(String userInfo) {
        UserInfo = userInfo;
    }

    public String getExtraInfo() {
        return ExtraInfo;
    }

    public void setExtraInfo(String extraInfo) {
        ExtraInfo = extraInfo;
    }

    public String getGeneral() {
        return General;
    }

    public void setGeneral(String general) {
        General = general;
    }

    public String getInvestigation() {
        return Investigation;
    }

    public void setInvestigation(String investigation) {
        Investigation = investigation;
    }

    public Long getTime() {
        return Time;
    }

    public void setTime(Long time) {
        Time = time;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String code) {
        Code = code;
    }
}
