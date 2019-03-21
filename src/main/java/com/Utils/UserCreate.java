package com.Utils;

import java.util.Calendar;

/**
 * @ CreateDate : Create in 8:57 2019/3/7
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
public class UserCreate {

    //系统自动生成uuid
    public static String getUuid(){
        Calendar date = Calendar.getInstance();
        String uuid = "HKGEPI"
                + date.get(Calendar.YEAR)
                + (date.get((Calendar.MONTH)) + 1)
                + date.get(Calendar.DAY_OF_MONTH)
                + date.get(Calendar.HOUR_OF_DAY)
                + date.get(Calendar.MINUTE)
                + date.get(Calendar.SECOND);

        return uuid;
    }
}
