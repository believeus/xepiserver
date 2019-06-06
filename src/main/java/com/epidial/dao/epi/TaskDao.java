package com.epidial.dao.epi;

import com.epidial.bean.Task;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TaskDao {

    //添加产品进入购物车
    @Insert("insert into task" +
                "(uid ,gid,name,price,imgpath,pay,count,orderno,type,invite,valid,total) " +
            "values " +
                "(#{uid},#{gid},#{name},#{price},#{imgpath},#{pay},#{count},#{orderno},#{type},#{invite},#{valid},#{total})")
    public int save(Task task);

    //查询已经放入购物车还未购买订单
    @Select("select * from task where uid=#{uid} and pay=0 and valid=0")
    public List<Task> findUnPayDNAKit(@Param("uid") Object uid);

    //查询总价钱
    @Select("select sum(sumprice) from task where uid=#{uid} and pay=0 and valid=0")
    public float getPrice(@Param("uid") Object uid);

    @Delete("delete from task where  ${c}=#{v}")
    public boolean delete(@Param("c") String column,@Param("v") String v);

    //查询是否购买了生物学试剂，该试剂还在检测中
    @Select("select * from task where uid=#{uid} and pay=1 and valid=0 and type=0")
    public List<Task> findPayDNAKit(@Param("uid") Object uid);


    @Select("select sum(total) from task where pay=0 and valid=0 and uid=#{uid}")
    public String sumprice(@Param("uid") Object uid);

    @Update("update task set pay=1 where ${c}=#{v} and valid=0")
    public void  buySuccess(@Param("c") String  c,@Param("v") Object v);



}
