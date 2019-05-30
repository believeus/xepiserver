package com.epidial.utils;

import java.util.Calendar;
import java.util.Random;

import static java.lang.Math.random;

/**
 * @ CreateDate : Create in 8:57 2019/3/7
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
public class UserCreate {

    //系统自动生成uuid
    public static String getUuid(){
        Random rand = new Random();

        Calendar date = Calendar.getInstance();
        String uuid = "HKGEPI"
                + date.get(Calendar.YEAR)
                + (date.get((Calendar.MONTH)) + 1)
                + date.get(Calendar.DAY_OF_MONTH)
                + date.get(Calendar.MINUTE)
                + date.get(Calendar.SECOND)
                + rand.nextInt(99)+100;

        return uuid;
    }
}
