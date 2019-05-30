package com.epidial.bean;

import org.springframework.stereotype.Component;

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
