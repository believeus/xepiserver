package com.epidial.dao.epi;

import com.epidial.bean.Udata;
import org.apache.ibatis.annotations.*;

import java.util.List;

//
@Mapper
public interface UdataDao {
    @Insert("insert into udata" +
                "(uid,username,naturally,biological,barcode,status,createTime)" +
            "values" +
                "(#{uid},#{username},#{naturally},#{biological},#{barcode},#{status},#{createTime})")
    public void  save(Udata udata);

    //pending processing finished
    @Select("select * from udata where ${c1}=#{v1} and ${c2}=#{v2}")
    public List<Udata> find(@Param("c1") String c1,@Param("v1") Object v1,@Param("c2") String c2,@Param("v2") Object v2);

    @Select("select * from udata where ${c}=#{v}")
    public List<Udata> findBy(@Param("c") String c ,@Param("v") Object v);


    @Update("update udata set uid=#{uid},username=#{username},naturally=#{naturally},biological=#{biological},barcode=#{barcode},status=#{status},uploadTime=#{uploadTime} where id=#{id}")
    public void update(Udata data);

    @Select("select * from udata where naturally > biological and naturally>0 and biological>0 limit 0,50")
    public List<Udata> findNtrGtBio();

    @Select("select * from udata where naturally < biological and naturally>0 and biological>0  limit 0,50")
    public List<Udata> findNtrLtBio();

    @Select("select * from udata limit #{idx},#{sz}")
    public List<Udata> findAll(@Param("idx") int idx, @Param("sz") int sz);
}
