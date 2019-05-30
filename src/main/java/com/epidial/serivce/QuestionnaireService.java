package com.epidial.serivce;

import com.epidial.bean.Question;
import com.epidial.bean.Questionnaire;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Transactional
public interface QuestionnaireService {

    //根据类型修改用户指定问卷的值
    public Map setData(Questionnaire questionnaire, Question question);

    //查询用户指定问卷近7天的情况
    public Map getData(Questionnaire questionnaire);


    //public Map getReport(String uuid);


    //插入大肠癌问卷
    public Integer InsertColorectal(Map<String,String[]> map);

    //插入癌症预防知识调查表
    public Integer Insertprevent(Map<String , String []> map);

    //插入肠癌筛查数量化风险评估问卷
    public Integer Insertquantity(Map<String , String []> map);
}
