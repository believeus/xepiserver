package com.epidial.dao.Info;

import com.epidial.bean.Admin;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AdminDao {
    @Select("select * from admin where username=#{username}")
    public  Admin findByName(@Param("username") String username);

    @Select("select * from admin where username=#{username} and password=#{password} ")
    public Admin findByNameAndPasswd(@Param("username")String username,@Param("password")String password);

    @Insert("insert into admin(username,password)values(#{username},#{password})")
    public  void save(Admin admin);
}
