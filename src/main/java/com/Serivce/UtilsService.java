package com.Serivce;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface UtilsService {

    public String SendCodeByAli(String code);
}
