package com.Serivce.impl;

import com.Bean.Life;
import com.Bean.Time;
import com.Bean.User;
import com.Dao.Qtion.ILifeDao;
import com.Serivce.ILifeService;
import com.Utils.DealWithArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @ CreateDate : Create in 14:07 2019/2/27 @ Explain : @ UpdateDate : Update in
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
    private void Body(String uuid,Double value1,Double value2){
        //默认list中的顺序为[体重 , 身高(cm)]
        //前台默认传递身高的单位为cm,体重的单位为kg
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        Double weight = 0.0;

        if (value1 != 0.0){
            weight = value1;
        }

        Double height = 0.0;

        Double BMI = 1.0;

        if (value2 != 0.0){
            height = value2 / 100;
            BMI = weight / (height * height);
        }

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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);


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
    }
    //心率
    private void HeartRate(String uuid,Double value1){
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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

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
    }
    //有氧运动情况
    private void Sport(String uuid,Double value1){
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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);


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

    }
    //血压
    private void BP(String uuid,Double value1,Double value2){
        //默认顺序为[收缩压，舒张压]
        //前台默认传递统一单位为mmHQ
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        Double systolic = null;
        Double diastolic = null;
        if (value1 != 0.0) {
            systolic = value1;
        }
        if (value2 != 0.0) {
            diastolic = value2;
        }
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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);


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
                if (value2 == 0.0 || value2 == null) {
                    life.setDiastolic_BP(0.0);
                }
                if (value1 == 0.0 || value1 == null) {
                    life.setSystolic_BP(0.0);
                }
                lifeDao.insertBP(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

    }
    //胆固醇
    private void Cholesterol(String uuid,Double value1){
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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

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
    }
    //睡眠
    private void Sleep(String uuid,Double value1){
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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

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
    }
    //冥想
    private void Meditation(String uuid,Double value1){
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //前台默认传递冥想的单位为：hours/day
        Double Meditation = value1;

        //创建对象life，用于存储传递值
        Life life = new Life();
        life.setMeditation(Meditation);
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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

        //时间差计算单位为小时，当时间差大于24小时后，则以新的一天判断为插入数据，否则则为更新数据
        if (timeDiff >= 24){
            flag = 1;
        }else if (timeDiff > 0 && timeDiff < 24 ){
            flag = 0;
        }
        else flag = -1;

        //根据标识符flag来判断是否进行更新或是插入操作
        switch (flag){
            case 0 : lifeDao.upDateMeditation(life);
                break;//返回值为0，则今日已经有数据了，执行更新操作
            case 1 :
                life.setUpdate_time(dayTime / 1000);
                life.setWeek(week);
                lifeDao.insertMeditation(life);
                break;//返回值为1，则今日并没有更新数据，执行插入操作
            default:
                System.out.println("error!");
        }

    }
    //性生活
    private void SexLife(String uuid,Double value1,Double value2){
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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

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

    }
    //吸烟
    private void Smoking(String uuid,Double value1,Double value2){
        Integer flag = 0;

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        //获取今日初始化时间对应的毫秒
        long dayTime = getNowInitTime(nowTime).getInitTime();

        //获取今日对应的周数
        Integer week = getNowInitTime(nowTime).getWeek();

        //创建对象life，用于存储传递值
        Life life = new Life();

        //前台默认传递吸烟的单位为：stick/day
        Double smoking = value1;
        if (value2 != null) {
            Double smoking_time = value2;
            life.setSmoking_time(smoking_time);
        }

        life.setSmoking(smoking);
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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

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

    }
    //饮酒
    private void Alcohol(String uuid,Double value1){
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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

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

    }
    //维他命A
    private void Vitamin_A(String uuid,Double value1){
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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

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
    }
    //维他命C
    private void Vitamin_C(String uuid,Double value1){
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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

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
    }
    //维他命D
    private void Vitamin_D(String uuid,Double value1){
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
        double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

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
    }



    //用于返回对应的数据类型给上一层
    @Override
    public Map<String, Object> getLift(String column, Double value1, Double value2 , String uuid) {

        Map<String, Object> map = new HashMap<String, Object>();
        HttpSession session = request.getSession();
        //String uuid = ((User)session.getAttribute("userInfo")).getUuid();
        //String uuid = "HKEPI201937192024320";
        System.out.println(uuid);

        //身体属性,操作数据为体重和身高，反馈数据补充修改bmi
        if (column.equals("Body")){
            Body(uuid, value1, value2);
            map.put("data" , "success");
            return map;
            //return map;
        }
        //心率，操作数据为heart_rate
        else if (column.equals("HeartRate")){
            HeartRate(uuid, value1);
            map.put("data" , "success");
            return map;
            //return map;
        }
        //血压，操作数据为systolic_BP和diastolic_BP
        else if (column.equals("BP")){
            BP(uuid, value1,value2);
            map.put("data" , "success");
            return map;
            //return map;
        }
        //胆固醇，操作数据为cholesterol
        //实验室数据
        else if (column.equals("Cholesterol")){
            Cholesterol(uuid, value1);
            map.put("data" , "success");
            return map;
            //return map;
        }
        //睡眠情况，操作数据为sleep
        else if (column.equals("Sleep")){
            Sleep(uuid, value1);
            map.put("data" , "success");
            return map;
            //return map;
        }
        //冥想情况，操作数据为Meditation
        else if (column.equals("Meditation")){
            Meditation(uuid, value1);
            map.put("data" , "success");
            return map;
            //return map;
        }
        //性生活情况，操作数据为sex_life_frequency和sex_life_score
        else if (column.equals("SexLife")){
            SexLife(uuid, value1 , value2);
            map.put("data" , "success");
            return map;
            //return map;
        }
        //吸烟情况，操作数据为smoking
        else if (column.equals("Smoking")){
            Smoking(uuid, value1 , value2);
            map.put("data" , "success");
            return map;
            //return map;
        }
        //喝酒情况，操作数据为alcohol
        else if (column.equals("Alcohol")){
            Alcohol(uuid, value1);
            map.put("data" , "success");
            return map;
            //return map;
        }
        //维他命A情况，操作数据为vitamin_A
        else if (column.equals("Vitamin_A")){
            Vitamin_A(uuid, value1);
            map.put("data" , "success");
            return map;
            //return map;
        }
        //维他命C情况，操作数据为vitamin_C
        else if (column.equals("Vitamin_C")){
            Vitamin_C(uuid, value1);
            map.put("data" , "success");
            return map;
            //return map;
        }
        //维他命D情况，操作数据为vitamin_D
        else if (column.equals("Vitamin_D")){
            Vitamin_D(uuid, value1);
            map.put("data" , "success");
            return map;
            //return map;
        }
        //有氧运动情况，操作数据为sport
        else if (column.equals("Sport")){
           Sport(uuid, value1);
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
    public Map<String, Object> getLift(String column, String type, Double value1, Double value2 , String uuid) {
        Map<String , Object> map = new HashMap<String, Object>();

        //从session中取出uuid
        //String uuid = ((User)request.getSession().getAttribute("userInfo")).getUuid();
        //String uuid = "HKEPI201937192024320";

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
        //life.setCalories_plus(value2);

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
            double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

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
            double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

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
            double timeDiff = (nowTime - (dateBaseTime * 1000)) / (1000 * 60 * 60);

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
                    System.out.println("error");
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
    public List getData(String column , String type , String uuid) {
        //从session 中获取用户的信息
        //HttpSession session = request.getSession();
        //User userInfo = (User)session.getAttribute("userInfo");
        User userInfo = new User();
        //userInfo.setUuid("HKEPI201937192024320");
        userInfo.setUuid(uuid);

        //设置时间类型
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");


        //获取全部数据
        List<Life> originData = lifeDao.getDateOfLife(userInfo.getUuid());
        List list = new LinkedList<Object>();

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

        //身体属性,获取的是weight、height、bmi
        //统一返回BMI进行表格渲染
        if (column.equals("Body")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];
//                if (life.getHeight() != null){
//                    a[0] = life.getHeight().toString();
//                }
//                if (life.getWeight() != null){
//                    a[1] = life.getWeight().toString();
//                }
                if (life.getBmi() != null){
                    a[0] = life.getBmi().toString();
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
                //按顺序进行值的插入
                listData.add(i, columnList);
            }

            //时间数据转换成list
            List listTime = new ArrayList();
            for (int i = 0 ; i < time.length ; i++){
                listTime.add(time[i]);
            }

            //删除部分内容为空 的列 避免影响数据渲染
            for (int j = (num.size() - 1) ; j >= 0  ; j--){
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

            //用户数据有可能小于7或大于7
            if (listData.size() > 7) {
                //截取前7条数据
                //String [][] d = new String[7][];
                String [] t = new String[7];
                String [] Td = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);

            }else {
                //截取前7条数据
                //String [][] d = new String[listData.size()][];
                //用处理后的list长度判断数组长度
                String [] Td = new String[listTime.size()];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
            }

        }
        //心率，操作数据为heart_rate
        else if (column.equals("HeartRate")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];
                if (life.getHeart_rate() != null){
                    a[0] = life.getHeart_rate().toString();
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

            for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
                //因为返回的数据只有一条，因此为了更好的判断，则只需要一维数组存放数据
                //String [][] d = new String[7][];
                String [] Td = new String[7];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
                list.add(DealWithArray.DoChange(t));
                //list.add(DealWithArray.DoChangeDouble(d));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
            }else {
                //截取前7条数据
                //String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                String [] Td = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
                list.add(DealWithArray.DoChange(t));
                //list.add(DealWithArray.DoChangeDouble(d));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
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

            for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
                String [] sys = new String[7];
                String [] dia = new String[7];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[2];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    sys[i] = Cache[0];
                    dia[i] = Cache[1];
                    t[i] = listTime.get(i).toString();
                }
                //list.add(t);
                //list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(sys));
                list.add(DealWithArray.DoChange(dia));
                //用于渲染报告时返回的最后一次插入值
                list.add(sys[0]);
                //用于渲染报告时返回的最后一次插入值
                list.add(dia[0]);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] sys = new String[listData.size()];
                String [] dia = new String[listData.size()];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[2];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    d[i] = Cache;
                    sys[i] = Cache[0];
                    dia[i] = Cache[1];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(sys));
                list.add(DealWithArray.DoChange(dia));
                //用于渲染报告时返回的最后一次插入值
                list.add(sys[0]);
                //用于渲染报告时返回的最后一次插入值
                list.add(dia[0]);
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

            for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
                //String [][] d = new String[7][];
                String [] Td = new String[7];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //list.add(DealWithArray.DoChangeDouble(d));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
            }else {
                //截取前7条数据
                //String [][] d = new String[listData.size()][];
                String [] Td = new String[listData.size()];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(DealWithArray.DoChange(t));
//                list.add(DealWithArray.DoChangeDouble(d));
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
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

            for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
                //String [][] d = new String[7][];
                String [] Td = new String[7];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
                //list.add(t);
                //list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
            }else {
                //截取前7条数据
                //String [][] d = new String[listData.size()][];
                String [] Td = new String[listData.size()];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
            }
        }
        //冥想情况，操作数据为Meditation
        else if (column.equals("Meditation")){
            for (int i = 0 ; i < originData.size() ; i++){
                Life life = originData.get(i);
                String [] a = new String[1];
                if (life.getMeditation() != null){
                    a[0] = life.getMeditation().toString();
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

            for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
                //String [][] d = new String[7][];
                String [] Td = new String[7];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
            }else {
                //截取前7条数据
                //String [][] d = new String[listData.size()][];
                String [] Td = new String[listData.size()];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
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

            for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
                String [] score = new String[7];
                String [] frequency = new String[7];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[2];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    score[i] = Cache[0];
                    frequency[i] = Cache[1];
                    t[i] = listTime.get(i).toString();
                }
                //list.add(t);
                //list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(score));
                list.add(DealWithArray.DoChange(frequency));
                //用于渲染报告时返回的最后一次插入值
                list.add(score[0]);
                //用于渲染报告时返回的最后一次插入值
                list.add(frequency[0]);
            }else {
                //截取前7条数据
                String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                String [] score = new String[listData.size()];
                String [] frequency = new String[listData.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[2];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    score[i] = Cache[0];
                    frequency[i] = Cache[1];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(score));
                list.add(DealWithArray.DoChange(frequency));
                //用于渲染报告时返回的最后一次插入值
                list.add(score[0]);
                //用于渲染报告时返回的最后一次插入值
                list.add(frequency[0]);
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

            for (int j = (num.size() - 1) ; j >= 0 ; j--){
                System.out.println("进入删除list中" + num.get(j));
                //System.out.println(num.size());
                //System.out.println(Arrays.toString(listData.toArray()));
                //System.out.println(num.get(j).toString());

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
                //String [][] d = new String[7][];
                String [] Td = new String[7];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);

            }else {
                //截取前7条数据
                //String [][] d = new String[listData.size()][];
                String [] Td = new String[listData.size()];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
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

            for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
                //String [][] d = new String[7][];
                String [] Td = new String[7];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    Td[i] = Cache[0];
                    //d[i] = Cache;
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
            }else {
                //截取前7条数据
                //String [][] d = new String[listData.size()][];
                String [] Td = new String[listData.size()];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
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

            for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
                //String [][] d = new String[7][];
                String [] Td = new String[7];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
            }else {
                //截取前7条数据
                //String [][] d = new String[listData.size()][];
                String [] Td = new String[listData.size()];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
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

            for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
                //String [][] d = new String[7][];
                String [] Td = new String[7];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
            }else {
                //截取前7条数据
                String [] Td = new String[listData.size()];
                //String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
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

            for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
                String [] Td = new String[7];
                //String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                    //d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
            }else {
                //截取前7条数据
                String[] Td = new String [listData.size()];
                //String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                  //  d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
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

            for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
                String [] Td = new String[7];
                //String [][] d = new String[7][];
                String [] t = new String[7];
                for (int i = 0; i < 7; i++) {
                    String[] Cache = new String[1];
                    for (int j = 0; j < listData.get(i).size(); j++) {
                        Cache[j] = listData.get(i).get(j);
                    }
                  //  d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
            }else {
                //截取前7条数据
                String [] Td = new String [listData.size()];
                //String [][] d = new String[listData.size()][];
                String [] t = new String[listTime.size()];
                for (int i = 0 ; i < listData.size() ; i++){
                    String [] Cache = new String[1];
                    for (int j = 0 ; j < listData.get(i).size() ; j++){
                        Cache[j] = listData.get(i).get(j);
                    }
                  //  d[i] = Cache;
                    Td[i] = Cache[0];
                    t[i] = listTime.get(i).toString();
                }
//                list.add(t);
//                list.add(d);
                list.add(DealWithArray.DoChange(t));
                list.add(DealWithArray.DoChange(Td));
                //用于渲染报告时返回的最后一次插入值
                list.add(Td[0]);
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
                //遍历获取数据 依次拿出lunch的数据
                for (int i = 0 ; i < originData.size() ; i++){
                    Life life = originData.get(i);
                    String [] a = new String[1];
                    if (life.getFood_Lunch() != null){
                        a[0] = life.getFood_Lunch().toString();
                    }else {
                        //用于排除空的数据
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

                for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
                    //String [][] d = new String[7][];
                    String [] t = new String[7];
                    String [] Td = new String [7];
                    for (int i = 0; i < 7; i++) {
                        String[] Cache = new String[1];
                        for (int j = 0; j < listData.get(i).size(); j++) {
                            Cache[j] = listData.get(i).get(j);
                        }
                        //d[i] = Cache;
                        t[i] = listTime.get(i).toString();
                        Td[i] = Cache[0];
                    }

                    //因业务需要 数据存放在一个数组中
                    list.add(DealWithArray.DoChange(t));
                    list.add(DealWithArray.DoChange(Td));
                    list.add(Td[0]);
                }else {
                    //截取前7条数据
                    //String [][] d = new String[listData.size()][];
                    String [] Td = new String[listTime.size()];
                    String [] t = new String[listTime.size()];
                    for (int i = 0 ; i < listData.size() ; i++){
                        String [] Cache = new String[1];
                        for (int j = 0 ; j < listData.get(i).size() ; j++){
                            Cache[j] = listData.get(i).get(j);
                        }
                        //d[i] = Cache;
                        Td[i] = Cache[0];
                        t[i] = listTime.get(i).toString();
                    }

                    list.add(DealWithArray.DoChange(t));
                    list.add(DealWithArray.DoChange(Td));
                    //用于渲染报告时返回的最后一次插入值
                    list.add(Td[0]);
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

                for (int j = (num.size() - 1) ; j >= 0  ; j--){
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
