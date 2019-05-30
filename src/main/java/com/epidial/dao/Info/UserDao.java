package com.epidial.dao.Info;

import com.epidial.bean.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserDao {

    @Select("select * from user limit #{idx},#{size}")
    public List<User> findUser(@Param("idx") int idx,@Param("size")int size);

    @Select("select * from user where naturally>biological limit 0,50")
    public List<User> findNtrGtBio();

    @Select("select * from user where naturally<biological limit 0,50")
    public List<User> findNtrLtBio();
    /**功能描述: 用户注册*/
    @Insert("insert into user" +
                "(uuid,nickname,password,mail,status,country,province,register) " +
            "values" +
                "(#{uuid},#{nickname},#{password},#{mail},#{status},#{country},#{province},#{register})")
    public void save(User user);

    @Update("update user set " +
                    "nickname=#{nickname}," +
                    "password=#{password}," +
                    "mail=#{mail}," +
                    "status=#{status}," +
                    "country=#{country}," +
                    "province=#{province}," +
                    "naturally=#{naturally}," +
                    "biological=#{biological},register=#{register},lastLogin=#{lastLogin},pay=#{pay},state=#{state} where mail=#{mail}")
    public void  update(User user);

    //根据邮箱查找用户信息
    @Select("select * from user where mail=#{mail}")
    public User findUserByMail(@Param("mail") String mail);

    //更改用户邮箱授权状况
    @Insert("update user set status = '1' where mail = #{mail} and uuid = #{uuid}")
    public boolean authMail(@Param("uuid")String uuid , @Param("mail")String mail);

    @Select("select * from user where mail = #{mail} and mail_status = '1';")
    public  User checkMail(@Param("mail") String mail);






}
