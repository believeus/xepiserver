package com.epidial.dao.Info;

import com.epidial.bean.Task;
import com.epidial.bean.Wares;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TaskDao {

    //添加产品进入购物车
    @Insert("insert into task(uid ,gid,name,price,imgpath,type,count,orderno,invite,total) values (#{uid},#{wares.id},#{wares.name},#{wares.price},#{wares.imgpath},#{wares.type},#{count},#{orderno},#{invite},#{total})")
    public int save(Wares wares,@Param("uid") int uid,@Param("count") String count,@Param("orderno") String orderno,@Param("invite")String invite,@Param("total") Object total);

    //查询已经放入购物车还未购买订单
    @Select("select * from task where uid=#{uid} and pay=0 and valid=0")
    public List<Task> find(@Param("uid") Object uid);

    //查询总价钱
    @Select("select sum(price) from task where uid=#{uid} and pay=0 and valid=0")
    public float getPrice(@Param("uid") Object uid);

    @Delete("delete from task where  ${column}=#{v}")
    public boolean delete(@Param("column") String column,@Param("v") String v);

    //查询是否购买了生物学试剂，该试剂还在检测中
    @Select("select * from task where uid=#{uid} and pay=1 and valid=0 and type=0")
    public List<Task> findDNA(@Param("uid") Object uid);


    @Select("select sum(price) from epi.cart where pay=0 and valid=0 and uid=#{uid}")
    public float price(@Param("uid") Object uid);



}
