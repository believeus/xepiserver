package com.epidial.bean;

import org.springframework.stereotype.Component;

/**
 * @ CreateDate : Create in 10:41 2019/3/4
 * @ Explain :
 * @ UpdateDate : Update in
 */
@Component
public class FormSubmit {
    private String uuid;
    private String column;
    private String type;
    private Double value1;
    private Double value2;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getColumn() {
        return column;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setColumn(String column) {
        this.column = column;
    }

    public Double getValue1() {
        return value1;
    }

    public void setValue1(Double value1) {
        this.value1 = value1;
    }

    public Double getValue2() {
        return value2;
    }

    public void setValue2(Double value2) {
        this.value2 = value2;
    }

    @Override
    public String toString() {
        return "FormSubmit{" +
                "uuid='" + uuid + '\'' +
                ", column='" + column + '\'' +
                ", value1=" + value1 +
                ", value2=" + value2 +
                '}';
    }
}
