package com.Dao;

import com.Bean.Life;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @ CreateDate : Create in 14:07 2019/2/27
 * @ Explain :
 * @ UpdateDate : Update in
 */
@Mapper
public interface ILifeDao {

    //获取数据最后更新时间
    public Long getDateLast(String uuid);

    //Body栏目
        //更新身体数值
        public int upDateBody(Life life);

        //新增身体数值
        public int insertBody(Life life);

        //查询身体数值
        public List selectBody(String uuid);

    //Sport栏目
        //更新今日运动数值
        public int upDateSport(Life life);

        //新增今日运动数值
        public int insertSport(Life life);

        //查询今日运动数值
        public List selectSport(String uuid);

    //Food_breakfast栏目
        //更新早餐摄入卡路里数值
        public int upDateFood_1(Life life);

        //新增早餐摄入卡路里数值
        public int insertFood_1(Life life);

        //查询早餐摄入卡路里数值
        public List selectFood_1(String uuid);

    //Food_lunch栏目
        //更新午餐摄入卡路里数值
        public int upDateFood_2(Life life);

        //新增午餐摄入卡路里数值
        public int insertFood_2(Life life);

        //查询午餐摄入卡路里数值
        public List selectFood_2(String uuid);

    //Food_dinner栏目
        //更新晚餐摄入卡路里数值
        public int upDateFood_3(Life life);

        //新增晚餐摄入卡路里数值
        public int insertFood_3(Life life);

        //查询晚餐摄入卡路里数值
        public List selectFood_3(String uuid);

    //HeartRate栏目
        //更新心率数值
        public int upDateHeart(Life life);

        //新增心率数值
        public int insertHeart(Life life);

        //查询心率数值
        public List selectHeart(String uuid);

    //BP栏目
        //更新血压数值
        public int upDateBP(Life life);

        //新增血压数值
        public int insertBP(Life life);

        //查询血压数值
        public List selectBP(String uuid);

    //Cholesterol栏目
        //更新胆固醇数值
        public int upDateCholesterol(Life life);

        //新增胆固醇数值
        public int insertCholesterol(Life life);

        //查询胆固醇数值
        public List selectCholesterol(String uuid);

    //Sleep栏目
        //更新睡眠情况数值
        public int upDateSleep(Life life);

        //新增睡眠情况数值
        public int insertSleep(Life life);

        //查询睡眠情况数值
        public List selectSleep(String uuid);

    //Mediatation栏目
        //更新冥想情况数值
        public int upDateMediatation(Life life);

        //新增冥想情况数值
        public int insertMediatation(Life life);

        //查询冥想情况数值
        public List selectMediatation(String uuid);

    //SexLife栏目
        //更新性生活情况数值
        public int upDateSexLife(Life life);

        //新增性生活情况数值
        public int insertSexLife(Life life);

        //查询性生活情况数值
        public List selectSexLife(String uuid);

    //Smoking栏目
        //更新吸烟情况数值
        public int upDateSmoking(Life life);

        //新增吸烟情况数值
        public int insertSmoking(Life life);

        //查询吸烟情况数值
        public List selectSmoking(String uuid);

    //Alcohol栏目
        //更新喝酒情况数值
        public int upDateAlcohol(Life life);

        //新增喝酒情况数值
        public int insertAlcohol(Life life);

        //查询喝酒情况数值
        public List selectAlcohol(String uuid);

    //Vitamin栏目
    //Vitamin_A栏目
        //更新维他命A情况数值
        public int upDateVitamin_A(Life life);

        //新增维他命A情况数值
        public int insertVitamin_A(Life life);

        //查询维他命A情况数值
        public List selectVitamin_A(String uuid);

    //Vitamin_C栏目
        //更新维他命C情况数值
        public int upDateVitamin_C(Life life);

        //新增维他命C情况数值
        public int insertVitamin_C(Life life);

        //查询维他命C情况数值
        public List selectVitamin_C(String uuid);

    //Vitamin_D栏目
        //更新维他命D情况数值
        public int upDateVitamin_D(Life life);

        //新增维他命D情况数值
        public int insertVitamin_D(Life life);

        //查询维他命D情况数值
        public List selectVitamin_D(String uuid);

    //获取uuid下所有的数据
    public List<Life> getDateOfLife(String uuid);
}
