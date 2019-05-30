package com.epidial.bean;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @ CreateDate : Create in 9:22 2019/3/1
 * @ Explain :  用于传递数据Json数据给前端渲染图表
 * @ UpdateDate : Update in
 */
@Component
@ConfigurationProperties(prefix = "chartdata")
public class ChartData {
    private String date;
    private String name;
    private Double value;

    public void setDate(String date) {
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }
}
