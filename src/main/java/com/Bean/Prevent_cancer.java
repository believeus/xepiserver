package com.Bean;

import org.springframework.stereotype.Component;

/**
 * @ CreateDate : Create in 8:53 2019/4/2
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Component
public class Prevent_cancer {
    private String UserInfo;
    private String First;
    private String Second;
    private String Code;
    private Long Time;

    public String getUserInfo() {
        return UserInfo;
    }

    public void setUserInfo(String userInfo) {
        UserInfo = userInfo;
    }

    public String getFirst() {
        return First;
    }

    public void setFirst(String first) {
        First = first;
    }

    public String getSecond() {
        return Second;
    }

    public void setSecond(String second) {
        Second = second;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String code) {
        Code = code;
    }

    public Long getTime() {
        return Time;
    }

    public void setTime(Long time) {
        Time = time;
    }
}
