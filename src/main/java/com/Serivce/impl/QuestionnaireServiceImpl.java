package com.Serivce.impl;

import com.Bean.Life;
import com.Bean.Question;
import com.Bean.Questionnaire;
import com.Bean.Time;
import com.Dao.QuestionnaireDao;
import com.Dao.ReportDao;
import com.Serivce.QuestionnaireService;
import com.alibaba.fastjson.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.Utils.TimeUtils.getNowInitTime;

/**
 * @ CreateDate : Create in 20:29 2019/3/9
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Service(value = "/questionnaireService")
public class QuestionnaireServiceImpl  implements QuestionnaireService {

    @Resource
    private QuestionnaireDao questionnaireDao;

    @Resource
    private ReportDao reportDao;

    @Autowired
    private HttpServletRequest request;

    @Override
    public Map setData(Questionnaire questionnaire, Question question) {
        //清除cursor 允许report进行查询
        HttpSession session = request.getSession();
        session.removeAttribute("cursor");

        Map<String , Object> map = new HashMap<>();

        //获取现在的系统时间
        long nowTime = System.currentTimeMillis();

        Time time = getNowInitTime(nowTime);

        //获取今日初始化时间对应的毫秒
        long dayTime = time.getInitTime();

        //获取今日对应的周数
        Integer week = time.getWeek();


        //因为数据为每天更新一次，因此以周为周期
        map.put("week" , week);
        //map.put("data" , data);
        map.put("uuid" , questionnaire.getUuid());
        map.put("time" , dayTime / 1000);

        String type = questionnaire.getType();
        if (type.equals("Pain")){
            //获取今日的数据
            Questionnaire data = questionnaireDao.SelectPain(map);

            long dateBaseTime = 0;

            if(data != null) {
                String OrgData = data.getFraction();

                //数据解串
                String[] a = OrgData.split("\\|");
                //System.out.println("开始的a数组为：");
                //System.out.println(Arrays.toString(a));

                a[question.getId() - 1] = question.getValue();

                //数据合串
                String str = "";
                for (int i = 0 ; a.length > i ; i++){
                    if ((i + 1) == a.length){
                        str += a[i];
                    }
                    else
                        str = str + a[i] + "|";
                }

                map.put("data" , str);

                //update function
                questionnaireDao.UpdatePain(map);
                return map;
            }
            else
            {
                String [] b = new String[26];
                for (int i = 0 ; i < b.length ; i++){
                    b[i] = "0";
                }

                b[question.getId() - 1 ] = question.getValue();

                //数组 合成字符串
                String str = "";
                for (int i = 0 ; b.length > i ; i++){
                    if ((i + 1) == b.length){
                        str += b[i];
                    }
                    else
                        str = str + b[i] + "|";
                }
                map.put("data" ,str);
                questionnaireDao.InsertPain(map);

                return map;
            }

        }else if (type.equals("Mood")){
            //获取今日的数据
            Questionnaire data = questionnaireDao.SelectMood(map);

            long dateBaseTime = 0;

            if(data != null) {
                String OrgData = data.getFraction();

                //数据解串
                String[] a = OrgData.split("\\|");
                //System.out.println("开始的a数组为：");
                //System.out.println(Arrays.toString(a));

                a[question.getId() - 1] = question.getValue();

                //数据合串
                String str = "";
                for (int i = 0 ; a.length > i ; i++){
                    if ((i + 1) == a.length){
                        str += a[i];
                    }
                    else
                        str = str + a[i] + "|";
                }

                map.put("data" , str);

                //update function
                questionnaireDao.UpdateMood(map);
                return map;
            }
            else
                {
                    String [] b = new String[18];
                    for (int i = 0 ; i < b.length ; i++){
                        b[i] = "0";
                    }

                    b[question.getId() - 1 ] = question.getValue();

                    //数组 合成字符串
                    String str = "";
                    for (int i = 0 ; b.length > i ; i++){
                        if ((i + 1) == b.length){
                            str += b[i];
                        }
                        else
                            str = str + b[i] + "|";
                    }
                    map.put("data" ,str);
                    questionnaireDao.InsertMood(map);

                    return map;
                }

        }
        else if (type.equals("Sleep")){
            //获取今日的数据
            Questionnaire data = questionnaireDao.SelectSleep(map);

            long dateBaseTime = 0;

            if(data != null) {
                String OrgData = data.getFraction();

                //数据解串
                String[] a = OrgData.split("\\|");
                //System.out.println("开始的a数组为：");
                //System.out.println(Arrays.toString(a));

                a[question.getId() - 1] = question.getValue();

                //数据合串
                String str = "";
                for (int i = 0 ; a.length > i ; i++){
                    if ((i + 1) == a.length){
                        str += a[i];
                    }
                    else
                        str = str + a[i] + "|";
                }

                map.put("data" , str);

                //update function
                questionnaireDao.UpdateSleep(map);
                return map;
            }
            else
            {
                String [] b = new String[9];
                for (int i = 0 ; i < b.length ; i++){
                    b[i] = "0";
                }

                b[question.getId() - 1 ] = question.getValue();

                //数组 合成字符串
                String str = "";
                for (int i = 0 ; b.length > i ; i++){
                    if ((i + 1) == b.length){
                        str += b[i];
                    }
                    else
                        str = str + b[i] + "|";
                }
                map.put("data" ,str);
                questionnaireDao.InsertSleep(map);

                return map;
            }
        }
        return map;
    }

    @Override
    public Map getData(Questionnaire questionnaire) {
        String type = questionnaire.getType();
        Map<String , Object> map = new HashMap<>();
        //flag 为每个问卷中题目的总数量
        Integer flag = 0;

        //获取仅7天的数据
        List<Questionnaire> list = new LinkedList<>();

        //根据输入的问卷的类型进行选择
        if (type.equals("Mood")) {
            //获取仅7天的数据
            list = questionnaireDao.SelectMoodForChart(questionnaire.getUuid());
            flag = 18;
        }
        else if (type.equals("Pain")){
            //获取仅7天的数据
            list = questionnaireDao.SelectPainForChart(questionnaire.getUuid());
            flag = 26;
        }
        else if (type.equals("Sleep")){
            //获取仅7天的数据
            list = questionnaireDao.SelectSleepForChart(questionnaire.getUuid());
            flag = 9;
        }

        else {
            map.put("msg" , "error");

            return map;
        }

        String[] time = null;

        if (list.size() >= 7) {
            //存放时间
            time = new String[7];
        }
        else
            time = new String[list.size()];

        //存放解析后的数组
        String [][] data = new String[flag][list.size()];
        int c = 0;

        //数据库查找得到的是每天插入的整个表的值，因此需要遍历解析出每一题的值
        for(int i = list.size() ; i > 0 ; i--){

            //获得list中的Questionnaire对象
            Questionnaire naireObj = list.get(i - 1);

            //前端需要的数据格式为 yyyy/MM/dd
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");

            //数据库中存储的时间戳为秒，因此需要乘上1000
            time[c] = simpleDateFormat.format(naireObj.getUpdata_time() * 1000);

            //把获取的数据进行解字符串
            String [] cache = naireObj.getFraction().split("\\|");

            for (int j = 0 ; j < cache.length ; j++){
                //System.out.println(a[j]);
                data[j][c] = cache[j];
            }

            c++;
        }
        System.out.println("用户进行了更新操作");
        map.put("time" , time);
        map.put("data" , data);

        return map;
    }

    public Map getReport(String uuid) {
        List<Life> life = new LinkedList<>();

        //获取session 中的 cursor标识符
        HttpSession session = request.getSession();

        if (session.getAttribute("cursor") == null){
            life = getReportData(uuid);

        }else {
            life = (List<Life>)session.getAttribute("LifeData");

            return null;
        }

        return null;
    }

    public List<Life> getReportData(String uuid){
        List<Life> list = reportDao.GetLifeData(uuid);

        HttpSession session = request.getSession();
        session.setAttribute("LifeData" , list);
        return list;
    }
}
