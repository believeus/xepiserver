package com.epidial.utils;

import com.epidial.bean.Time;

import java.util.Calendar;

/**
 * @ CreateDate : Create in 8:35 2019/3/20
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
public class TimeUtils {

    public static Time getNowInitTime(long nowTime){
        Time time = new Time();

        //用于初始化今日时间
        Calendar calendar = Calendar.getInstance();
        int h = calendar.get(Calendar.HOUR_OF_DAY);
        int mi = calendar.get(Calendar.MINUTE);
        int s = calendar.get(Calendar.SECOND);

        //用于计算时间区间，截取出今年内的数据
        time.setYear(h * 60 * 60 * 1000);
        time.setNext_year((h + 1) * 60 * 60 * 1000);

        //获取今日零点时间的时间戳
        long dayTime = nowTime - ((h * 60 * 60 * 1000) + (mi * 60 * 1000) + (s * 1000));
        time.setInitTime(dayTime);

        int week = calendar.get(Calendar.WEEK_OF_YEAR);
        time.setWeek(week);

        return time;
    }
}
