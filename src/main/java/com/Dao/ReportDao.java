package com.Dao;

import com.Bean.Life;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReportDao {

    public List<Life> GetLifeData(@Param("uuid") String uuid);
}
