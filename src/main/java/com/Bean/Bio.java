package com.Bean;

import org.springframework.stereotype.Component;

/**
 * @ CreateDate : Create in 19:15 2019/3/21
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Component
public class Bio {
    private Double natural_age;
    private Double biological_age;
    private String name;
    private String id;

    public Double getNatural_age() {
        return natural_age;
    }

    public void setNatural_age(Double natural_age) {
        this.natural_age = natural_age;
    }

    public Double getBiological_age() {
        return biological_age;
    }

    public void setBiological_age(Double biological_age) {
        this.biological_age = biological_age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
