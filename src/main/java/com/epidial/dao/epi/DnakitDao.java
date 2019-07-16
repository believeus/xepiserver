package com.epidial.dao.epi;

import com.epidial.bean.Dnakit;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DnakitDao {

    @Select("select * from dnakit limit #{idx},#{size}")
    public List<Dnakit> paging(@Param("idx") int idx, @Param("size") int size);

    /**功能描述: 用户注册*/
    @Insert("insert into dnakit" +
                "(name,barcode,createtime) " +
            "values" +
                "(#{name},#{barcode},#{createtime})")
    public void save(Dnakit dnakit);

    @Update("update dnakit set " +
                    "name=#{name}," +
                    "barcode=#{barcode}," +
                    "createtime=#{createtime} "+
                    "where id=#{id}")
    public boolean  update(Dnakit dnakit);

    //根据邮箱查找用户信息
    @Select("select * from dnakit where ${column}=#{value}")
    public Dnakit find(@Param("column") String column, @Param("value") Object value);

    @Delete("delete from dnakit where id=#{id}")
    public void delete(@Param("id") int id);









}
