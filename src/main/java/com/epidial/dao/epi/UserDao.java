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

    /**功能描述: 用户注册*/
    @Insert("insert into user" +
                "(uuid,nickname,password,mail,valid,country,province,register,token,discount) " +
            "values" +
                "(#{uuid},#{nickname},#{password},#{mail},#{valid},#{country},#{province},#{register},#{token},#{discount})")
    public void save(User user);

    @Update("update user set " +
                    "nickname=#{nickname}," +
                    "password=#{password}," +
                    "discount=#{discount},"+
                    "invite=#{invite},"+
                    "mail=#{mail}," +
                    "valid=#{valid}," +
                    "country=#{country}," +
                    "province=#{province}," +
                    "register=#{register},lastLogin=#{lastLogin},token=#{token},times=#{times} where mail=#{mail}")
    public boolean  update(User user);

    //根据邮箱查找用户信息
    @Select("select * from user where ${column}=#{value}")
    public User findUser(@Param("column") String column, @Param("value") Object value);









}
