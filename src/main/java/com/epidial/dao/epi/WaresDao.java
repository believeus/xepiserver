package com.epidial.dao.epi;

import com.epidial.bean.Wares;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface WaresDao {

    @Select("select * from wares where ${column}=#{v}")
    public List<Wares> find(@Param("column") String column, @Param("v") Object v);

    @Select("select * from wares")
    public List<Wares> findAll();
}
