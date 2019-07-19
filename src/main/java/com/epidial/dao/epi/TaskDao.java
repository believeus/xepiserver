package com.epidial.dao.epi;

import com.epidial.bean.Task;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TaskDao {

    //添加产品进入购物车
    @Insert("insert into task" +
                "(uid ,gid,name,imgpath,pay,orderno,type,valid,total,createTime,addrid,delivery,payTime,email) " +
            "values " +
                "(#{uid},#{gid},#{name},#{imgpath},#{pay},#{orderno},#{type},#{valid},#{total},#{createTime},#{addrid},#{delivery},#{payTime},#{email})")
    public int save(Task task);

    //查询已经放入购物车还未购买订单
    @Select("select * from task where uid=#{uid} and pay=0 and valid=0 and type=0")
    public List<Task> findUnPayDNAKit(@Param("uid") Object uid);

    @Select("select count(*) from task where uid=#{uid} and pay=0 and valid=0 and type=0")
    public int findUnPayDNAKitCount(@Param("uid") Object uid);

    @Select("select * from task where uid=#{uid} and pay=0 and valid=0")
    public List<Task> findUnPayGoods(@Param("uid") Object uid);

    @Select("select * from task where uid=#{uid} and pay=0 and valid=0 and type=0")
    public List<Task> findUnPayDnkKit(@Param("uid") Object uid);

    @Select("select * from task where uid=#{uid} and pay=0 and valid=0 and type=1")
    public List<Task> findUnPayNoDnkKit(@Param("uid") Object uid);

    @Select("select * from task where uid=#{uid} and pay=1")
    public List<Task> findPayGoods(@Param("uid")Object uid);

    //查询总价钱
    @Select("select sum(unpaidAmount) from task where uid=#{uid} and pay=0 and valid=0")
    public float getPrice(@Param("uid") Object uid);

    @Delete("delete from task where  ${c}=#{v}")
    public boolean delete(@Param("c") String c,@Param("v") Object v);

    @Select("select * from task where ${c1}=#{v1} and ${c2}=#{v2} and pay=1 and type=0")
    public Task findPayDnaKitTask(@Param("c1") String c1,@Param("v1") Object v1,@Param("c2") String c2,@Param("v2") Object v2);
    //查询是否购买了生物学试剂，该试剂还在检测中
    @Select("select * from task where uid=#{uid} and pay=1 and type=0")
    public List<Task> findPayDNAKit(@Param("uid") Object uid);

    @Select("select sum(total) from task where pay=0 and valid=0 and uid=#{uid}")
    public String unpaidAmount(@Param("uid") Object uid);


    @Select("select * from task limit #{idx},#{sz}")
    public List<Task> findAll(@Param("idx") int idx,@Param("sz") int sz);

   @Update("update task set " +
                "uid=#{uid},gid=#{gid},name=#{name},imgpath=#{imgpath},pay=#{pay}," +
                "type=#{type},valid=#{valid}," +
                "total=#{total},createTime=#{createTime}," +
                "payTime=#{payTime},orderno=#{orderno}," +
                "addrid=#{addrid},delivery=#{delivery}," +
                "email=#{email},barcode=#{barcode} where id=${id} ")
   public void  update(Task task);

   @Select("select * from task where id=#{id}")
   public Task findById(@Param("id") Object id);

}
