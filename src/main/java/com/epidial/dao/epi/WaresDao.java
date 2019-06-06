package com.epidial.dao.epi;

import com.epidial.bean.Wares;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface WaresDao {

    @Select("select * from wares where ${column}=#{v}")
    public List<Wares> find(@Param("column")String column,@Param("v") String v);

    //用于返回商品详细信息
    public Wares selectWares(Integer wares_id);

    //用于反馈用户购物车中的信息
    public List<Wares> selectCartWares(String uuid);

    //用于查询商品信息
    public List<Wares> GetWaresInfo(List list);
}
