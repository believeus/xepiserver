package com.epidial.dao.epi;

import com.epidial.bean.Admin;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AdminDao {
    @Select("select * from admin where username=#{username}")
    public  Admin findByName(@Param("username") String username);

    @Select("select * from admin where username=#{username} and password=#{password} ")
    public Admin findByNameAndPasswd(@Param("username")String username,@Param("password")String password);

    @Insert("insert into admin(username,password,domain,createTime)values(#{username},#{password},#{domain},#{createTime})")
    public  void save(Admin admin);

    @Update("update admin set username=#{username},password=#{password},domain=#{domain},createTime=#{createTime} where id=#{id} ")
    public void update(Admin admin);

    @Select("select * from admin")
    public List<Admin> findAll();
}
