package com.Dao;

import com.Bean.Bio;
import com.Bean.Life;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReportDao {

    public List<Life> GetLifeData(@Param("uuid") String uuid);

    public List<Bio> GetBioData();

    public Bio GetBioDataForPerson(@Param("id") String id);
}
