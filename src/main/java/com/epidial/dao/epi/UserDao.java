package com.epidial.dao.epi;

import com.epidial.bean.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserDao {

    @Select("select * from user limit #{idx},#{size}")
    public List<User> pagingUser(@Param("idx") int idx,@Param("size")int size);

    @Select("select * from user where naturally > biological limit 0,50")
    public List<User> findNtrGtBio();

    @Select("select * from user where naturally < biological limit 0,50")
    public List<User> findNtrLtBio();
    /**功能描述: 用户注册*/
    @Insert("insert into user" +
                "(uuid,nickname,password,mail,valid,country,province,register) " +
            "values" +
                "(#{uuid},#{nickname},#{password},#{mail},#{valid},#{country},#{province},#{register})")
    public void save(User user);

    @Update("update user set " +
                    "nickname=#{nickname}," +
                    "password=#{password}," +
                    "mail=#{mail}," +
                    "valid=#{valid}," +
                    "country=#{country}," +
                    "province=#{province}," +
                    "naturally=#{naturally}," +
                    "biological=#{biological},register=#{register},lastLogin=#{lastLogin},state=#{state} where mail=#{mail}")
    public boolean  update(User user);

    //根据邮箱查找用户信息
    @Select("select * from user where ${column}=#{value}")
    public User findUser(@Param("column") String column, @Param("value") String value);









}
