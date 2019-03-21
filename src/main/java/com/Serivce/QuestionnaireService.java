package com.Serivce;

import com.Bean.Question;
import com.Bean.Questionnaire;
import com.alibaba.fastjson.JSONArray;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Transactional
public interface QuestionnaireService {

    //根据类型修改用户指定问卷的值
    public Map setData(Questionnaire questionnaire, Question question);

    //查询用户指定问卷近7天的情况
    public Map getData(Questionnaire questionnaire);


    //public Map getReport(String uuid);
}
