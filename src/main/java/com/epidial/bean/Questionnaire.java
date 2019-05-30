package com.epidial.bean;

import org.springframework.stereotype.Component;

/**
 * @ CreateDate : Create in 19:31 2019/3/9
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Component
public class Questionnaire {
    private String fraction;
    private String uuid;
    private long updata_time;
    private int week;
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getFraction() {
        return fraction;
    }

    public void setFraction(String fraction) {
        this.fraction = fraction;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public long getUpdata_time() {
        return updata_time;
    }

    public void setUpdata_time(long updata_time) {
        this.updata_time = updata_time;
    }

    public int getWeek() {
        return week;
    }

    public void setWeek(int week) {
        this.week = week;
    }
}
