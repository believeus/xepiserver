package com.Bean;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @ CreateDate : Create in 13:57 2019/2/27
 * @ Explain :  问卷---》life_style
 * @ UpdateDate : Update in
 */
@Component
@ConfigurationProperties(prefix = "life")
public class Life {
    private String uuid;
    private Double height;
    private Double weight;
    private Double bmi;
    private Integer Sport;
    private Double heart_rate;
    private Double systolic_BP;
    private Double diastolic_BP;
    private Double cholesterol;
    private Double sleep;
    private Double mediatation;
    private Double sex_life_frequency;
    private Double sex_life_score;
    private Double smoking;
    private Double smoking_time;
    private Double alcohol;
    private Double vitamin_A;
    private Double vitamin_B;
    private Double vitamin_C;
    private Double vitamin_D;
    private Double Calories;
    private Double Calories_plus;
    private Integer week;
    private long update_time;
    private Date date;
    private String advice;
    private Double food_Breakfast;
    private Double food_Breakfast_snacks;
    private Double food_Lunch;
    private Double food_Lunch_snacks;
    private Double food_Dinner;
    private Double food_Dinner_snacks;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public Double getBmi() {
        return bmi;
    }

    public void setBmi(Double bmi) {
        this.bmi = bmi;
    }

    public Integer getSport() {
        return Sport;
    }

    public void setSport(Integer sport) {
        Sport = sport;
    }

    public Double getHeart_rate() {
        return heart_rate;
    }

    public void setHeart_rate(Double heart_rate) {
        this.heart_rate = heart_rate;
    }

    public Double getSystolic_BP() {
        return systolic_BP;
    }

    public void setSystolic_BP(Double systolic_BP) {
        this.systolic_BP = systolic_BP;
    }

    public Double getDiastolic_BP() {
        return diastolic_BP;
    }

    public void setDiastolic_BP(Double diastolic_BP) {
        this.diastolic_BP = diastolic_BP;
    }

    public Double getCholesterol() {
        return cholesterol;
    }

    public void setCholesterol(Double cholesterol) {
        this.cholesterol = cholesterol;
    }

    public Double getSleep() {
        return sleep;
    }

    public void setSleep(Double sleep) {
        this.sleep = sleep;
    }

    public Double getMediatation() {
        return mediatation;
    }

    public void setMediatation(Double mediatation) {
        this.mediatation = mediatation;
    }

    public Double getSex_life_frequency() {
        return sex_life_frequency;
    }

    public void setSex_life_frequency(Double sex_life_frequency) {
        this.sex_life_frequency = sex_life_frequency;
    }

    public Double getSex_life_score() {
        return sex_life_score;
    }

    public void setSex_life_score(Double sex_life_score) {
        this.sex_life_score = sex_life_score;
    }

    public Double getSmoking() {
        return smoking;
    }

    public void setSmoking(Double smoking) {
        this.smoking = smoking;
    }

    public Double getSmoking_time() {
        return smoking_time;
    }

    public void setSmoking_time(Double smoking_time) {
        this.smoking_time = smoking_time;
    }

    public Double getAlcohol() {
        return alcohol;
    }

    public void setAlcohol(Double alcohol) {
        this.alcohol = alcohol;
    }

    public Double getVitamin_A() {
        return vitamin_A;
    }

    public void setVitamin_A(Double vitamin_A) {
        this.vitamin_A = vitamin_A;
    }

    public Double getVitamin_B() {
        return vitamin_B;
    }

    public void setVitamin_B(Double vitamin_B) {
        this.vitamin_B = vitamin_B;
    }

    public Double getVitamin_C() {
        return vitamin_C;
    }

    public void setVitamin_C(Double vitamin_C) {
        this.vitamin_C = vitamin_C;
    }

    public Double getVitamin_D() {
        return vitamin_D;
    }

    public void setVitamin_D(Double vitamin_D) {
        this.vitamin_D = vitamin_D;
    }

    public Double getCalories() {
        return Calories;
    }

    public void setCalories(Double calories) {
        Calories = calories;
    }

    public Double getCalories_plus() {
        return Calories_plus;
    }

    public void setCalories_plus(Double calories_plus) {
        Calories_plus = calories_plus;
    }

    public Integer getWeek() {
        return week;
    }

    public void setWeek(Integer week) {
        this.week = week;
    }

    public void setUpdate_time(long update_time) {
        this.update_time = update_time;
    }

    public long getUpdate_time() {
        return update_time;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    public Double getFood_Breakfast() {
        return food_Breakfast;
    }

    public void setFood_Breakfast(Double food_Breakfast) {
        this.food_Breakfast = food_Breakfast;
    }

    public Double getFood_Breakfast_snacks() {
        return food_Breakfast_snacks;
    }

    public void setFood_Breakfast_snacks(Double food_Breakfast_snacks) {
        this.food_Breakfast_snacks = food_Breakfast_snacks;
    }

    public Double getFood_Lunch() {
        return food_Lunch;
    }

    public void setFood_Lunch(Double food_Lunch) {
        this.food_Lunch = food_Lunch;
    }

    public Double getFood_Lunch_snacks() {
        return food_Lunch_snacks;
    }

    public void setFood_Lunch_snacks(Double food_Lunch_snacks) {
        this.food_Lunch_snacks = food_Lunch_snacks;
    }

    public Double getFood_Dinner() {
        return food_Dinner;
    }

    public void setFood_Dinner(Double food_Dinner) {
        this.food_Dinner = food_Dinner;
    }

    public Double getFood_Dinner_snacks() {
        return food_Dinner_snacks;
    }

    public void setFood_Dinner_snacks(Double food_Dinner_snacks) {
        this.food_Dinner_snacks = food_Dinner_snacks;
    }
}
