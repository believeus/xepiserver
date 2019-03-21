package com.Serivce.impl;

import com.Bean.ChartData;
import com.Bean.Life;
import com.Bean.Time;
import com.Bean.User;
import com.Dao.ILifeDao;
import com.Serivce.ILifeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @ CreateDate : Create in 14:07 2019/2/27
 * @ Explain :
 * @ UpdateDate : Update in
 */
@Service(value = "LifeService")
@Component
public class LifeServiceImpl implements ILifeService {

    @Resource
    private ILifeDao lifeDao;

    @Autowired
    private HttpServletRequest request;

    private Time getNowInitTime(long nowTime){
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

    //身体属性
    private List<Life> Body(String uuid,Double value1,Double value2){
        //默认list中的顺序为[身高(cm)，体重]
        //前台默认传递身高的单位为cm,体重的单位为kg
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        Double height = value1 / 100;
        Double weight = value2;
        Double BMI = weight / (height * height);

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setWeight(weight);
        life.setHeight(height);
        life.setBmi(BMI);
        life.setUuid(uuid);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(dateBaseTime);
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);


        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        switch (flag){
            case 0 :
                    lifeDao.upDateBody(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                    life.setUpdate_time(dayTime / 1000);
                    life.setWeek(week);
                    lifeDao.insertBody(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }


        return lifeDao.selectBody(uuid);
    }
    //心率
    private List<Life> HeartRate(String uuid,Double value1){
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //前台默认传递心率的单位为beats/min
        Double HeartRate = value1;

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setHeart_rate(HeartRate);
        life.setUuid(uuid);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(lifeDao.getDateLast(uuid));
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        //根据标识符flag来判断是否进行更新或是插入操作
        switch (flag){
            case 0 : lifeDao.upDateHeart(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertHeart(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

        return lifeDao.selectHeart(uuid);
    }
    //有氧运动情况
    private List<Life> Sport(String uuid,Double value1){
        //前台默认传递为有氧运动的分钟数值
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        int value = value1.intValue();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setSport(value);
        life.setUuid(uuid);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(dateBaseTime);
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);


        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        switch (flag){
            case 0 :
                lifeDao.upDateSport(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertSport(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }


        return lifeDao.selectSport(uuid);
    }
    //血压
    private List<Life> BP(String uuid,Double value1,Double value2){
        //默认顺序为[收缩压，舒张压]
        //前台默认传递统一单位为mmHQ
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        Double systolic = value1;
        Double diastolic = value2;

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setUuid(uuid);
        life.setSystolic_BP(systolic);
        life.setDiastolic_BP(diastolic);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(dateBaseTime);
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);


        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        switch (flag){
            case 0 : lifeDao.upDateBP(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertBP(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

        return lifeDao.selectBP(uuid);
    }
    //胆固醇
    private List<Life> Cholesterol(String uuid,Double value1){
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //前台默认传递胆固醇的单位为：mg/dL
        Double cholesterol = value1;

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setCholesterol(cholesterol);
        life.setUuid(uuid);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(lifeDao.getDateLast(uuid));
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        //根据标识符flag来判断是否进行更新或是插入操作
        switch (flag){
            case 0 : lifeDao.upDateCholesterol(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertCholesterol(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

        return lifeDao.selectCholesterol(uuid);
    }
    //睡眠
    private List<Life> Sleep(String uuid,Double value1){
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //前台默认传递睡眠的单位为：hours/day
        Double sleep = value1;

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setSleep(sleep);
        life.setUuid(uuid);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(lifeDao.getDateLast(uuid));
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        //根据标识符flag来判断是否进行更新或是插入操作
        switch (flag){
            case 0 : lifeDao.upDateSleep(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertSleep(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

        return lifeDao.selectSleep(uuid);
    }
    //冥想
    private List<Life> Mediatation(String uuid,Double value1){
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //前台默认传递冥想的单位为：hours/day
        Double mediatation = value1;

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setMediatation(mediatation);
        life.setUuid(uuid);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(lifeDao.getDateLast(uuid));
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        //根据标识符flag来判断是否进行更新或是插入操作
        switch (flag){
            case 0 : lifeDao.upDateMediatation(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertMediatation(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

        return lifeDao.selectMediatation(uuid);
    }
    //性生活
    private List<Life> SexLife(String uuid,Double value1,Double value2){
        //前端传递数据的默认顺序为：sex_life_frequency 、sex_life_score
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //前台默认传递睡眠的单位为：hours/day
        Double sex_life_frequency = value1;
        Double sex_life_score = value2;

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setSex_life_frequency(sex_life_frequency);
        life.setSex_life_score(sex_life_score);
        life.setUuid(uuid);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(lifeDao.getDateLast(uuid));
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        //根据标识符flag来判断是否进行更新或是插入操作
        switch (flag){
            case 0 : lifeDao.upDateSexLife(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertSexLife(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

        return lifeDao.selectSexLife(uuid);
    }
    //吸烟
    private List<Life> Smoking(String uuid,Double value1,Double value2){
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //前台默认传递吸烟的单位为：stick/day
        Double smoking = value1;
        Double smoking_time = value2;

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setSmoking(smoking);
        life.setSmoking_time(smoking_time);
        life.setUuid(uuid);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(lifeDao.getDateLast(uuid));
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        //根据标识符flag来判断是否进行更新或是插入操作
        switch (flag){
            case 0 : lifeDao.upDateSmoking(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertSmoking(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

        return lifeDao.selectSmoking(uuid);
    }
    //饮酒
    private List<Life> Alcohol(String uuid,Double value1){
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //前台默认传递饮酒的单位为：bottle/day
        Double alcohol = value1;

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setAlcohol(alcohol);
        life.setUuid(uuid);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(lifeDao.getDateLast(uuid));
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        //根据标识符flag来判断是否进行更新或是插入操作
        switch (flag){
            case 0 : lifeDao.upDateAlcohol(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertAlcohol(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

        return lifeDao.selectAlcohol(uuid);
    }
    //维他命A
    private List<Life> Vitamin_A(String uuid,Double value1){
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //前台默认传递维他命A摄入的单位为：mg/day
        Double vitamin_A = value1;

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setVitamin_A(vitamin_A);
        life.setUuid(uuid);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(lifeDao.getDateLast(uuid));
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        //根据标识符flag来判断是否进行更新或是插入操作
        switch (flag){
            case 0 : lifeDao.upDateVitamin_A(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertVitamin_A(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

        return lifeDao.selectVitamin_A(uuid);
    }
    //维他命C
    private List<Life> Vitamin_C(String uuid,Double value1){
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //前台默认传递维他命C摄入的单位为：mg/day
        Double vitamin_C = value1;

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setVitamin_C(vitamin_C);
        life.setUuid(uuid);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(lifeDao.getDateLast(uuid));
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        //根据标识符flag来判断是否进行更新或是插入操作
        switch (flag){
            case 0 : lifeDao.upDateVitamin_C(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertVitamin_C(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

        return lifeDao.selectVitamin_C(uuid);
    }
    //维他命D
    private List<Life> Vitamin_D(String uuid,Double value1){
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //前台默认传递维他命D摄入的单位为：mg/day
        Double vitamin_D = value1;

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setVitamin_D(vitamin_D);
        life.setUuid(uuid);

        //查询数据库中是否有该用户的数据，若无则不需要计算时间
        long dateBaseTime = 0;

        //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
        try {
            if (lifeDao.getDateLast(uuid) != 0) {
                dateBaseTime = lifeDao.getDateLast(uuid);
                life.setUpdate_time(lifeDao.getDateLast(uuid));
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        //计算当前时间和数据库中最新数据差
        double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        //根据标识符flag来判断是否进行更新或是插入操作
        switch (flag){
            case 0 : lifeDao.upDateVitamin_D(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertVitamin_D(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

        return lifeDao.selectVitamin_D(uuid);
    }



    //用于返回对应的数据类型给上一层
    @Override
    public Map<String, Object> getLift(String column, Double value1, Double value2) {

        Map<String, Object> map = new HashMap<>();
        HttpSession session = request.getSession();
        //String uuid = ((User)session.getAttribute("userInfo")).getUuid();
        String uuid = "HKEPI201937192024320";
        System.out.println(uuid);

        //身体属性,操作数据为身高和体重，反馈数据补充修改bmi
        if (column.equals("Body")){
            map.put("data" , Body(uuid, value1, value2));
            map.put("data" , "success");
            return map;
            //return map;
        }
        //心率，操作数据为heart_rate
        else if (column.equals("HeartRate")){
            map.put("data" , HeartRate(uuid, value1));
            map.put("data" , "success");
            return map;
            //return map;
        }
        //血压，操作数据为systolic_BP和diastolic_BP
        else if (column.equals("BP")){
            map.put("data" , BP(uuid, value1,value2));
            map.put("data" , "success");
            return map;
            //return map;
        }
        //胆固醇，操作数据为cholesterol
        //实验室数据
        else if (column.equals("Cholesterol")){
            map.put("data" , Cholesterol(uuid, value1));
            map.put("data" , "success");
            return map;
            //return map;
        }
        //睡眠情况，操作数据为sleep
        else if (column.equals("Sleep")){
            map.put("data" , Sleep(uuid, value1));
            map.put("data" , "success");
            return map;
            //return map;
        }
        //冥想情况，操作数据为mediatation
        else if (column.equals("Mediatation")){
            map.put("data" , Mediatation(uuid, value1));
            map.put("data" , "success");
            return map;
            //return map;
        }
        //性生活情况，操作数据为sex_life_frequency和sex_life_score
        else if (column.equals("SexLife")){
            map.put("data" , SexLife(uuid, value1 , value2));
            map.put("data" , "success");
            return map;
            //return map;
        }
        //吸烟情况，操作数据为smoking
        else if (column.equals("Smoking")){
            map.put("data" , Smoking(uuid, value1 , value2));
            map.put("data" , "success");
            return map;
            //return map;
        }
        //喝酒情况，操作数据为alcohol
        else if (column.equals("Alcohol")){
            map.put("data" , Alcohol(uuid, value1));
            map.put("data" , "success");
            return map;
            //return map;
        }
        //维他命A情况，操作数据为vitamin_A
        else if (column.equals("Vitamin_A")){
            map.put("data" , Vitamin_A(uuid, value1));
            map.put("data" , "success");
            return map;
            //return map;
        }
        //维他命C情况，操作数据为vitamin_C
        else if (column.equals("Vitamin_C")){
            map.put("data" , Vitamin_C(uuid, value1));
            map.put("data" , "success");
            return map;
            //return map;
        }
        //维他命D情况，操作数据为vitamin_D
        else if (column.equals("Vitamin_D")){
            map.put("data" , Vitamin_D(uuid, value1));
            map.put("data" , "success");
            return map;
            //return map;
        }
        //有氧运动情况，操作数据为sport
        else if (column.equals("Sport")){
            map.put("data" , Sport(uuid, value1));
            map.put("data" , "success");
            return map;
            //return map;
        }
        map.put("data" , "error");
        return map;
        //return map;
    }

    //处理卡路里摄入
    @Override
    public Map<String, Object> getLift(String column, String type, Double value1, Double value2) {
        Map<String , Object> map = new HashMap<>();

        //从session中取出uuid
        //String uuid = ((User)request.getSession().getAttribute("userInfo")).getUuid();
        String uuid = "HKEPI201937192024320";

        //反馈的提示信息
        String msg = "";

        //用于信息的存储
        Life life = new Life();

        life.setUuid(uuid);

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //获取type的类型，用于判断更新表中数据的栏目
        //每个栏目下会附带一个snacks
        //将前台获取的卡路里的值存放在对象中
        life.setCalories(value1);
        life.setCalories_plus(value2);

        if (type.equals("breakfast")){

            //查询数据库中是否有该用户的数据，若无则不需要计算时间
            long dateBaseTime = 0;

            //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
            try {
                if (lifeDao.getDateLast(uuid) != 0) {
                    dateBaseTime = lifeDao.getDateLast(uuid);
                    life.setUpdate_time(lifeDao.getDateLast(uuid));
                }
            } catch (NullPointerException e) {
                e.printStackTrace();
            }

            //计算当前时间和数据库中最新数据差
            double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

            //判断情况标识符
            Integer flag = 0;

            //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
            if (timeDiff >= 24){
                flag = 1;
            }else if (timeDiff > 0 && timeDiff < 24 ){
                flag = 0;
            }
            else flag = -1;

            //根据标识符flag来判断是否进行更新或是插入操作
            switch (flag){
                case 0 : lifeDao.upDateFood_1(life);
                    break;//返回值为0，则今日已经有数据了，执行更新操作
                case 1 :
                    life.setUpdate_time(dayTime / 1000);
                    life.setWeek(week);
                    lifeDao.insertFood_1(life);
                    break;//返回值为1，则今日并没有更新数据，执行插入操作
                default:
                    System.out.println("error!");
            }

            //map.put("data" ,lifeDao.selectFood_1(uuid));
            return map;

        }else if (type.equals("lunch")){

            //查询数据库中是否有该用户的数据，若无则不需要计算时间
            long dateBaseTime = 0;

            //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
            try {
                if (lifeDao.getDateLast(uuid) != 0) {
                    dateBaseTime = lifeDao.getDateLast(uuid);
                    life.setUpdate_time(lifeDao.getDateLast(uuid));
                }
            } catch (NullPointerException e) {
                e.printStackTrace();
            }

            //计算当前时间和数据库中最新数据差
            double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

            //判断情况标识符
            Integer flag = 0;

            //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
            if (timeDiff >= 24){
                flag = 1;
            }else if (timeDiff > 0 && timeDiff < 24 ){
                flag = 0;
            }
            else flag = -1;

            //根据标识符flag来判断是否进行更新或是插入操作
            switch (flag){
                case 0 : lifeDao.upDateFood_2(life);
                    break;//返回值为0，则今日已经有数据了，执行更新操作
                case 1 :
                    life.setUpdate_time(dayTime / 1000);
                    life.setWeek(week);
                    lifeDao.insertFood_2(life);
                    break;//返回值为1，则今日并没有更新数据，执行插入操作
                default:
                    System.out.println("error!");
            }

            //map.put("data" ,lifeDao.selectFood_2(uuid));
            return map;
        }
        else if (type.equals("dinner")){

            //查询数据库中是否有该用户的数据，若无则不需要计算时间
            long dateBaseTime = 0;

            //若此用户第一次插入值，则会出现获取最新一条返回值为空的情况
            try {
                if (lifeDao.getDateLast(uuid) != 0) {
                    dateBaseTime = lifeDao.getDateLast(uuid);
                    life.setUpdate_time(lifeDao.getDateLast(uuid));
                }
            } catch (NullPointerException e) {
                e.printStackTrace();
            }

            //计算当前时间和数据库中最新数据差
            double timeDiff = (nowTime - dateBaseTime) / (1000 * 60 * 60);

            //判断情况标识符
            Integer flag = 0;

            //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
            if (timeDiff >= 24){
                flag = 1;
            }else if (timeDiff > 0 && timeDiff < 24 ){
                flag = 0;
            }
            else flag = -1;

            //根据标识符flag来判断是否进行更新或是插入操作
            switch (flag){
                case 0 : lifeDao.upDateFood_3(life);
                    break;//返回值为0，则今日已经有数据了，执行更新操作
                case 1 :
                    life.setUpdate_time(dayTime / 1000);
                    life.setWeek(week);
                    lifeDao.insertFood_3(life);
                    break;//返回值为1，则今日并没有更新数据，执行插入操作
                default:
                    System.out.println("error!");
            }

            //map.put("data" ,lifeDao.selectFood_3(uuid));
            return map;
        }
        else {
            System.out.println(type);
            map.put("msg" , msg);
            return map;
        }
    }

    //用于返回数据给页面渲染表格
    @Override
    public List getData(String column , String type) {
        //从session 中获取用户的信息
        //HttpSession session = request.getSession();
        //User userInfo = (User)session.getAttribute("userInfo");
        User userInfo = new User();
        userInfo.setUuid("HKEPI2019927104750279");

        //设置时间类型
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");


        //获取全部数据
        List<Life> originData = lifeDao.getDateOfLife(userInfo.getUuid());
        List list = new LinkedList<>();

        //存放时间
        String [] time = new String[originData.size()];

        //用于存放数据
        String [][] data = new String[originData.size()][];

        for (int i = 0 ; i < originData.size() ; i++){
            Life life = originData.get(i);

            //将数据库中传递来的数据从时间戳转换成规整格式的String类型的时间
            System.out.println(life.getUpdate_time());
            time[i] = simpleDateFormat.format(life.getUpdate_time() * 1000);

        }

        //用于记录存放需要删除的数据
        List num  = new ArrayList();

        //身体属性,获取的是height、weight、bmi
        if (column.equals("Body")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[3];
                if (life.getHeight() != null){
                    a[0] = life.getHeight().toString();
                }
                if (life.getWeight() != null){
                    a[1] = life.getWeight().toString();
                }

                if (life.getBmi() != null){
                    a[2] = life.getBmi().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {

                    columnList.add(j, data[i][j]);

                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[3];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[3];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }

        }
        //心率，操作数据为heart_rate
        else if (column.equals("HeartRate")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];
                if (life.getHeart_rate() != null){
                    a[0] = life.getHeight().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {
                    columnList.add(j, data[i][j]);
                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }
        }
        //血压，操作数据为systolic_BP和diastolic_BP
        else if (column.equals("BP")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[2];
                if (life.getSystolic_BP() != null){
                    a[0] = life.getSystolic_BP().toString();
                }

                if (life.getDiastolic_BP() != null){
                    a[1] = life.getDiastolic_BP().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {

                    columnList.add(j, data[i][j]);

                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[2];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[2];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }
        }
        //胆固醇，操作数据为cholesterol
        //实验室数据
        else if (column.equals("Cholesterol")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];
                if (life.getCholesterol() != null){
                    a[0] = life.getCholesterol().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {

                    columnList.add(j, data[i][j]);

                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }
        }
        //睡眠情况，操作数据为sleep
        else if (column.equals("Sleep")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];
                if (life.getSleep() != null){
                    a[0] = life.getSleep().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {

                    columnList.add(j, data[i][j]);

                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }
        }
        //冥想情况，操作数据为mediatation
        else if (column.equals("Mediatation")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];
                if (life.getMediatation() != null){
                    a[0] = life.getMediatation().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {

                    columnList.add(j, data[i][j]);

                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }
        }
        //性生活情况，操作数据为sex_life_frequency和sex_life_score
        else if (column.equals("SexLife")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[2];
                if (life.getSex_life_frequency() != null){
                    a[0] = life.getSex_life_frequency().toString();
                }

                if (life.getSex_life_score() != null){
                    a[1] = life.getSex_life_score().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {

                    columnList.add(j, data[i][j]);

                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[2];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[2];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }
        }
        //吸烟情况，操作数据为smoking
        else if (column.equals("Smoking")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];
                if (life.getSmoking() != null){
                    a[0] = life.getSmoking().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {

                    columnList.add(j, data[i][j]);

                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }
        }
        //喝酒情况，操作数据为alcohol
        else if (column.equals("Alcohol")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];
                if (life.getAlcohol() != null){
                    a[0] = life.getAlcohol().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {

                    columnList.add(j, data[i][j]);

                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }
        }
        //维他命A情况，操作数据为vitamin_A
        else if (column.equals("Vitamin_A")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];

                if (life.getVitamin_A() != null){
                    a[0] = life.getVitamin_A().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {

                    columnList.add(j, data[i][j]);

                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }
        }
        //维他命C情况，操作数据为vitamin_C
        else if (column.equals("Vitamin_C")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];
                if (life.getVitamin_C() != null){
                    a[0] = life.getVitamin_C().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {

                    columnList.add(j, data[i][j]);

                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }
        }
        //维他命D情况，操作数据为vitamin_D
        else if (column.equals("Vitamin_D")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];
                if (life.getVitamin_D() != null){
                    a[0] = life.getVitamin_D().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {

                    columnList.add(j, data[i][j]);

                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }
        }
        //有氧运动情况，操作数据为sport
        else if (column.equals("Sport")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];
                if (life.getSport() != null){
                    a[0] = life.getSport().toString();
                }else {
                    num.add(i);
                }
                data[i] = a;
            }

            //数据转换成数列
            List<List<String>> listData = new ArrayList<List<String>>();
            for (int i = 0; i < data.length; i++) {
                List<String> columnList = new ArrayList<String>();
                for (int j = 0; j < data[i].length; j++) {

                    columnList.add(j, data[i][j]);

                }
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            for (int j = 0 ; j < num.size() ; j++){
                System.out.println("进入删除list中" + num.get(j));
                System.out.println(num.get(j).toString());

                //删除数据列中为空的列
                listData.remove(Integer.parseInt(num.get(j).toString()));

                //删除时间列中为空的列
                listTime.remove(Integer.parseInt(num.get(j).toString()));

            }

            for (int i = 0 ; i < listData.size() ; i++){
                System.out.println("测试输出删除后的list");
                System.out.println(listData.get(i));
                System.out.println(listTime.get(i));
            }

            if (listData.size() > 7) {
                //截取前7条数据
                String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
                list.add(t);
                list.add(d);
            }
        }
        //摄入卡路里状况，涉及卡路里等相关信息
        else if (column.equals("Food")){
            if (type.equals("breakfast")) {
                for (int i = 0; i < originData.size(); i++) {
                    Life life = originData.get(i);
                    String[] a = new String[2];
                    if (life.getFood_Breakfast() != null) {
                        a[0] = life.getFood_Breakfast().toString();
                    } else {
                        num.add(i);
                    }
                    if (life.getFood_Breakfast_snacks() != null) {
                        a[1] = life.getFood_Breakfast_snacks().toString();
                    }
                    data[i] = a;
                }

                //数据转换成数列
                List<List<String>> listData = new ArrayList<List<String>>();
                for (int i = 0; i < data.length; i++) {
                    List<String> columnList = new ArrayList<String>();
                    for (int j = 0; j < data[i].length; j++) {
                        columnList.add(j, data[i][j]);
                    }
                    listData.add(i, columnList);
                }

                //时间数据转换成list
                List listTime = new ArrayList();
                for (int i = 0; i < time.length; i++) {
                    listTime.add(time[i]);
                }

                for (int j = 0; j < num.size(); j++) {
                    System.out.println("进入删除list中" + num.get(j));
                    System.out.println(num.get(j).toString());

                    //删除数据列中为空的列
                    listData.remove(Integer.parseInt(num.get(j).toString()));

                    //删除时间列中为空的列
                    listTime.remove(Integer.parseInt(num.get(j).toString()));

                }

                for (int i = 0; i < listData.size(); i++) {
                    System.out.println("测试输出删除后的list");
                    System.out.println(listData.get(i));
                    System.out.println(listTime.get(i));
                }

                if (listData.size() > 7) {
                    //截取前7条数据
                    String[][] d = new String[7][];
                    String[] t = new String[7];
                    for (int i = 0; i < 7; i++) {
                        String[] Cache = new String[2];
                        for (int j = 0; j < listData.get(i).size(); j++) {
                            Cache[j] = listData.get(i).get(j);
                        }
                        d[i] = Cache;
                        t[i] = listTime.get(i).toString();
                    }
                    list.add(t);
                    list.add(d);
                } else {
                    //截取前7条数据
                    String[][] d = new String[listData.size()][];
                    String[] t = new String[listTime.size()];
                    for (int i = 0; i < listData.size(); i++) {
                        String[] Cache = new String[2];
                        for (int j = 0; j < listData.get(i).size(); j++) {
                            Cache[j] = listData.get(i).get(j);
                        }
                        d[i] = Cache;
                        t[i] = listTime.get(i).toString();
                    }
                    list.add(t);
                    list.add(d);
                }
            }
            else if (type.equals("lunch")){
                for (int i = 0 ; i < originData.size() ; i++){
                    Life life = originData.get(i);
                    String [] a = new String[2];
                    if (life.getFood_Lunch() != null){
                        a[0] = life.getFood_Lunch().toString();
                    }else {
                        num.add(i);
                    }
                    if (life.getFood_Lunch() != null){
                        a[1] = life.getFood_Lunch_snacks().toString();
                    }
                    data[i] = a;
                }

                //数据转换成数列
                List<List<String>> listData = new ArrayList<List<String>>();
                for (int i = 0; i < data.length; i++) {
                    List<String> columnList = new ArrayList<String>();
                    for (int j = 0; j < data[i].length; j++) {
                        columnList.add(j, data[i][j]);
                    }
                    listData.add(i, columnList);
                }

                //时间数据转换成list
                List listTime = new ArrayList();
                for (int i = 0 ; i < time.length ; i++){
                    listTime.add(time[i]);
                }

                for (int j = 0 ; j < num.size() ; j++){
                    System.out.println("进入删除list中" + num.get(j));
                    System.out.println(num.get(j).toString());

                    //删除数据列中为空的列
                    listData.remove(Integer.parseInt(num.get(j).toString()));

                    //删除时间列中为空的列
                    listTime.remove(Integer.parseInt(num.get(j).toString()));

                }

                for (int i = 0 ; i < listData.size() ; i++){
                    System.out.println("测试输出删除后的list");
                    System.out.println(listData.get(i));
                    System.out.println(listTime.get(i));
                }

                if (listData.size() > 7) {
                    //截取前7条数据
                    String [][] d = new String[7][];
                    String [] t = new String[7];
                    for (int i = 0; i < 7; i++) {
                        String[] Cache = new String[2];
                        for (int j = 0; j < listData.get(i).size(); j++) {
                            Cache[j] = listData.get(i).get(j);
                        }
                        d[i] = Cache;
                        t[i] = listTime.get(i).toString();
                    }
                    list.add(t);
                    list.add(d);
                }else {
                    //截取前7条数据
                    String [][] d = new String[listData.size()][];
                    String [] t = new String[listTime.size()];
                    for (int i = 0 ; i < listData.size() ; i++){
                        String [] Cache = new String[2];
                        for (int j = 0 ; j < listData.get(i).size() ; j++){
                            Cache[j] = listData.get(i).get(j);
                        }
                        d[i] = Cache;
                        t[i] = listTime.get(i).toString();
                    }
                    list.add(t);
                    list.add(d);
                }
            }
            else if (type.equals("dinner")){
                for (int i = 0 ; i < originData.size() ; i++){
                    Life life = originData.get(i);
                    String [] a = new String[2];
                    if (life.getFood_Dinner() != null){
                        a[0] = life.getFood_Dinner().toString();
                    }else {
                        num.add(i);
                    }
                    if (life.getFood_Dinner_snacks() != null){
                        a[1] = life.getFood_Dinner_snacks().toString();
                    }
                    data[i] = a;
                }

                //数据转换成数列
                List<List<String>> listData = new ArrayList<List<String>>();
                for (int i = 0; i < data.length; i++) {
                    List<String> columnList = new ArrayList<String>();
                    for (int j = 0; j < data[i].length; j++) {
                        columnList.add(j, data[i][j]);
                    }
                    listData.add(i, columnList);
                }

                //时间数据转换成list
                List listTime = new ArrayList();
                for (int i = 0 ; i < time.length ; i++){
                    listTime.add(time[i]);
                }

                for (int j = 0 ; j < num.size() ; j++){
                    System.out.println("进入删除list中" + num.get(j));
                    System.out.println(num.get(j).toString());

                    //删除数据列中为空的列
                    listData.remove(Integer.parseInt(num.get(j).toString()));

                    //删除时间列中为空的列
                    listTime.remove(Integer.parseInt(num.get(j).toString()));

                }

                for (int i = 0 ; i < listData.size() ; i++){
                    System.out.println("测试输出删除后的list");
                    System.out.println(listData.get(i));
                    System.out.println(listTime.get(i));
                }

                if (listData.size() > 7) {
                    //截取前7条数据
                    String [][] d = new String[7][];
                    String [] t = new String[7];
                    for (int i = 0; i < 7; i++) {
                        String[] Cache = new String[2];
                        for (int j = 0; j < listData.get(i).size(); j++) {
                            Cache[j] = listData.get(i).get(j);
                        }
                        d[i] = Cache;
                        t[i] = listTime.get(i).toString();
                    }
                    list.add(t);
                    list.add(d);
                }else {
                    //截取前7条数据
                    String [][] d = new String[listData.size()][];
                    String [] t = new String[listTime.size()];
                    for (int i = 0 ; i < listData.size() ; i++){
                        String [] Cache = new String[2];
                        for (int j = 0 ; j < listData.get(i).size() ; j++){
                            Cache[j] = listData.get(i).get(j);
                        }
                        d[i] = Cache;
                        t[i] = listTime.get(i).toString();
                    }
                    list.add(t);
                    list.add(d);
                }
            }
        }

        return list;
    }
}
