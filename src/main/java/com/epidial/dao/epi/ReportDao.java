package com.epidial.dao.epi;

import com.epidial.bean.Udata;
import com.epidial.bean.Life;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReportDao {

    //根据uuid用于渲染生活习惯
    public List<Life> GetLifeData(@Param("uuid") String uuid);

    //获取所有的生物学年龄的数据---》用于渲染散点图
    public List<Udata> GetBioData();

    public Udata GetBioDataForPerson(@Param("id") String id);

    //根据用户id查询 返回生物学年龄数据
    public Udata GetBioDataForPersonByUuid(@Param("uuid")String uuid);

    //根据用户id查询，返回生活习惯数据
    public Life GetLifeDataForPersonByUuid(@Param("id")String id);
}
