package com.Dao;

import com.Bean.Colorectal_cancer;
import com.Bean.Prevent_cancer;
import com.Bean.Quantity_cancer;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository(value = "cancerDao")
@Mapper
public interface CancerDao {

    @Insert({"insert into colorectal_cancer(UserInfo , General , Smoking , Tea , Drink , Food , Intestinal_diseases , Tumor , Code , Time , Body)\n" +
            "  values (#{UserInfo , jdbcType=VARCHAR} ,\n" +
            "  #{General , jdbcType=VARCHAR} ,\n" +
            "  #{Smoking , jdbcType=VARCHAR} ,\n" +
            "  #{Tea , jdbcType=VARCHAR} ,\n" +
            "  #{Drink , jdbcType=VARCHAR} ,\n" +
            "  #{Food , jdbcType=VARCHAR} ,\n" +
            "  #{ID , jdbcType=VARCHAR} ,\n" +
            "  #{Tumor , jdbcType=VARCHAR} ,\n" +
            "  #{Code , jdbcType=VARCHAR} ,\n" +
            "  #{Time , jdbcType=VARCHAR} , " +
              "#{Body , jdbcType=VARCHAR})"})
    public int InsertCancer(Colorectal_cancer cancer);


    @Insert({"insert into prevent_cancer(UserInfo , First ,Second , Code ,Time)" +
            "values (#{UserInfo , jdbcType=VARCHAR} ," +
            "        #{First , jdbcType=VARCHAR} ," +
            "        #{Second , jdbcType=VARCHAR} ," +
            "        #{Code , jdbcType=VARCHAR} ," +
            "        #{Time , jdbcType=BIGINT})"})
    public int InsertPrevent(Prevent_cancer prevent_cancer);

    @Insert({"insert into quantity_cancer(UserInfo, ExtraInfo, General, Investigation , Time , Code) " +
            "VALUES (#{UserInfo , jdbcType=VARCHAR }," +
            "#{ExtraInfo , jdbcType=VARCHAR}," +
            "#{General , jdbcType=VARCHAR}," +
            "#{Investigation  , jdbcType=VARCHAR}," +
            "#{Time , jdbcType=BIGINT}," +
            "#{Code , jdbcType=VARCHAR})"})
    public int InsertQuantity(Quantity_cancer quantity_cancer);
}
