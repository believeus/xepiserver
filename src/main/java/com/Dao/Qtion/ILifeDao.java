package com.Dao.Qtion;

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


    //Sport栏目
        //更新今日运动数值
        public int upDateSport(Life life);

        //新增今日运动数值
        public int insertSport(Life life);


    //Food_breakfast栏目
        //更新早餐摄入卡路里数值
        public int upDateFood_1(Life life);

        //新增早餐摄入卡路里数值
        public int insertFood_1(Life life);


    //Food_lunch栏目
        //更新午餐摄入卡路里数值
        public int upDateFood_2(Life life);

        //新增午餐摄入卡路里数值
        public int insertFood_2(Life life);

    //Food_dinner栏目
        //更新晚餐摄入卡路里数值
        public int upDateFood_3(Life life);

        //新增晚餐摄入卡路里数值
        public int insertFood_3(Life life);


    //HeartRate栏目
        //更新心率数值
        public int upDateHeart(Life life);

        //新增心率数值
        public int insertHeart(Life life);


    //BP栏目
        //更新血压数值
        public int upDateBP(Life life);

        //新增血压数值
        public int insertBP(Life life);


    //Cholesterol栏目
        //更新胆固醇数值
        public int upDateCholesterol(Life life);

        //新增胆固醇数值
        public int insertCholesterol(Life life);


    //Sleep栏目
        //更新睡眠情况数值
        public int upDateSleep(Life life);

        //新增睡眠情况数值
        public int insertSleep(Life life);


    //Meditation栏目
        //更新冥想情况数值
        public int upDateMeditation(Life life);

        //新增冥想情况数值
        public int insertMeditation(Life life);

    //SexLife栏目
        //更新性生活情况数值
        public int upDateSexLife(Life life);

        //新增性生活情况数值
        public int insertSexLife(Life life);

    //Smoking栏目
        //更新吸烟情况数值
        public int upDateSmoking(Life life);

        //新增吸烟情况数值
        public int insertSmoking(Life life);

    //Alcohol栏目
        //更新喝酒情况数值
        public int upDateAlcohol(Life life);

        //新增喝酒情况数值
        public int insertAlcohol(Life life);

    //Vitamin栏目
    //Vitamin_A栏目
        //更新维他命A情况数值
        public int upDateVitamin_A(Life life);

        //新增维他命A情况数值
        public int insertVitamin_A(Life life);

    //Vitamin_C栏目
        //更新维他命C情况数值
        public int upDateVitamin_C(Life life);

        //新增维他命C情况数值
        public int insertVitamin_C(Life life);

    //Vitamin_D栏目
        //更新维他命D情况数值
        public int upDateVitamin_D(Life life);

        //新增维他命D情况数值
        public int insertVitamin_D(Life life);

    //获取uuid下所有的数据
    public List<Life> getDateOfLife(String uuid);
}
