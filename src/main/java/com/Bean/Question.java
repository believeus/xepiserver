package com.Bean;

import org.springframework.stereotype.Component;

/**
 * @ CreateDate : Create in 19:43 2019/3/19
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Component
public class Question {

    private Integer id;
    private String value;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
