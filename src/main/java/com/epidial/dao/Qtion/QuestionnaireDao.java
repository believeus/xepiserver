package com.epidial.dao.Qtion;

import com.epidial.bean.Questionnaire;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface QuestionnaireDao {

    public int InsertPain(Map map);

    public int InsertMood(Map map);

    public int InsertSleep(Map map);

    public Questionnaire SelectPain(Map map);

    public List<Questionnaire> SelectPainForChart(String uuid);

    public int UpdatePain(Map map);

    public Questionnaire SelectMood(Map map);

    public List<Questionnaire> SelectMoodForChart(String uuid);

    public int UpdateMood(Map map);

    public List<Questionnaire> SelectSleepForChart(String uuid);

    public Questionnaire SelectSleep(Map map);

    public int UpdateSleep(Map map);
}
