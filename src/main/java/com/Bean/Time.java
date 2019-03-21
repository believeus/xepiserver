package com.Bean;

import org.springframework.stereotype.Component;

/**
 * @ CreateDate : Create in 13:45 2019/3/6
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Component
public class Time {
    private Integer week;
    private long InitTime;
    private long year;
    private long Next_year;

    public long getYear() {
        return year;
    }

    public void setYear(long year) {
        this.year = year;
    }

    public long getNext_year() {
        return Next_year;
    }

    public void setNext_year(long next_year) {
        Next_year = next_year;
    }

    public Integer getWeek() {
        return week;
    }

    public void setWeek(Integer week) {
        this.week = week;
    }

    public long getInitTime() {
        return InitTime;
    }

    public void setInitTime(long initTime) {
        InitTime = initTime;
    }
}
