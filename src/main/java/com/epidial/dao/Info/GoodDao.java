package com.epidial.dao.Info;

import com.epidial.bean.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface GoodDao {
    @Select("select * from  limit #{idx},#{size}")
    public List<User> pagingGood(@Param("idx") int idx, @Param("size")int size);
}
