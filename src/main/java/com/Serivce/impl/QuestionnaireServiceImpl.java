package com.Serivce.impl;

import com.Bean.*;
import com.Dao.Info.CancerDao;
import com.Dao.Qtion.QuestionnaireDao;
import com.Dao.Info.ReportDao;
import com.Serivce.QuestionnaireService;
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

        Map<String , Object> map = new HashMap<String , Object>();

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
            Questionnaire data =  questionnaireDao.SelectPain(map);

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

                try {
                    questionnaireDao.InsertPain(map);
                } catch (Exception e) {
                    e.printStackTrace();
                }

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
                    try {
                        questionnaireDao.InsertMood(map);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

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
                try {
                    questionnaireDao.InsertSleep(map);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                return map;
            }
        }
        return map;
    }

    @Override
    public Map getData(Questionnaire questionnaire) {
        String type = questionnaire.getType();
        Map<String , Object> map = new HashMap<String , Object>();
        //flag 为每个问卷中题目的总数量
        Integer flag = 0;

        //获取仅7天的数据
        List<Questionnaire> list = new LinkedList<Questionnaire>();

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
        //flag代表题号实际数量，list.size()为数据的条数
        String [][] data = new String[flag][list.size()];
        int c = 0;

        //数据库查找得到的是每天插入的整个表的值，因此需要遍历解析出每一题的值
        for(int i = list.size() ; i > 0 ; i--){

            //获得list中的Questionnaire对象
            Questionnaire naireObj = list.get(i - 1);

            //前端需要的数据格式为 yyyy/MM/dd
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");

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
        List<Life> life = new LinkedList<Life>();

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

    @Autowired
    private CancerDao cancerDao;

    @Override
    public Integer InsertColorectal(Map<String,String[]> map) {
        //用于存放用户个人信息
        //姓名|性别|出生日期|身份证号码
        String UserInfo = "";

        //个人信息栏目
        //System.out.println("_______________________________");
        //System.out.println("个人信息栏目:");
        //System.out.println("姓名(name)：" + Arrays.toString(map.get("name")));
        UserInfo += map.get("name")[0]  + "|";
        //System.out.println("性别(sex)：" + Arrays.toString(map.get("sex")));
        UserInfo += map.get("sex")[0]  + "|";
        //System.out.println("出生日期(birthday)：" + Arrays.toString(map.get("birthday")));
        UserInfo += map.get("birthday")[0] + "|";
        //System.out.println("身份证号码(id)：" + Arrays.toString(map.get("id")));
        UserInfo += map.get("id")[0];

        //用于存放一般情况的信息
        //婚姻情况|文化程度|家中人口数量|平均年收入|饮用水来源
        String General = "";
        //一般情况栏目
        //System.out.println("一般情况栏目:");
        //System.out.println("结婚情况(marry)：" + Arrays.toString(map.get("marry")));
        General += map.get("marry")[0]  + "|";
        //System.out.println("文化程度(education)：" + Arrays.toString(map.get("education")));
        General += map.get("education")[0]  + "|";
        //System.out.println("家庭人口(famil-menber)：" + Arrays.toString(map.get("famil-menber")));
        General += map.get("famil-menber")[0] + "|";
        //System.out.println("平均收入(income-per-year)：" + Arrays.toString(map.get("income-per-year")));
        General += map.get("income-per-year")[0] + "|";
        //System.out.println("饮用水(water-source)：" + Arrays.toString(map.get("water-source")));
        General += map.get("water-source")[0];
        //System.out.println("_______________________________");


        //用于存放一般情况的信息
        //婚姻情况|文化程度|家中人口数量|平均年收入|饮用水来源
        String Smoking = "";
        //一般情况栏目
        //System.out.println("吸烟情况栏目:");

        //System.out.println("吸烟(smoke-or-not)：" + Arrays.toString(map.get("smoke-or-not")));
        Smoking += map.get("smoke-or-not")[0];
        if ((map.get("smoke-or-not")[0]).equals("没有吸烟")){
            Smoking += "|";
        }else {
            Smoking += ",";
            Smoking += (map.get("smoke-year")[0]) + "|";
        }

        //System.out.println("戒烟(quit-smoke)：" + Arrays.toString(map.get("quit-smoke")));
        Smoking += map.get("quit-smoke")[0];
        if ((map.get("quit-smoke")[0]).equals("没有吸烟")){

        }else {
            Smoking += ",";
            Smoking += (map.get("quit-smoke-year")[0]);
        }
        //System.out.println("_______________________________");

        //用于存放饮酒情况的信息
        // 饮酒情况 [饮酒量,饮用年数]
        String Drink = "";
        //饮酒情况栏目
        //System.out.println("饮酒情况栏目:");

        //System.out.println("饮酒(drink)：" + Arrays.toString(map.get("drink")));
        Drink += map.get("drink")[0];
        if ((map.get("drink")[0]).equals("否，没有饮酒")){

        }else {
            Drink += "#";
            switch (map.get("drink")[0]){
                case "啤酒":
                    Drink += (map.get("litre/day")[0]) + ",";
                    Drink += (map.get("beer-drink-year")[0]);
                    break;
                case "白酒":
                    Drink += (map.get("litre/day")[1]) + ",";
                    Drink += (map.get("white-drink-year")[0]) ;
                    break;
                case "黄酒":
                    Drink += (map.get("litre/day")[2]) + ",";
                    Drink += (map.get("yellow-drink-year")[0]) ;
                    break;
                case "米酒":
                    Drink += (map.get("litre/day")[3]) + ",";
                    Drink += (map.get("rice-drink-year")[0]) ;
                    break;
            }

        }

        //System.out.println("_______________________________");

        //用于存放饮茶情况的信息
        // 饮茶情况 [饮茶量,饮用年数]
        String Tea = "";
        //饮酒情况栏目
        //System.out.println("饮茶情况栏目:");

        //System.out.println("饮茶(tea)：" + Arrays.toString(map.get("tea")));
        Tea += map.get("tea")[0];
        if ((map.get("tea")[0]).equals("否，没有饮茶")){

        }else {
            Tea += "#";
            switch (map.get("tea")[0]){
                case "花茶":
                    Tea += (map.get("ml/day")[0]) + ",";
                    Tea += (map.get("flower-tea-year")[0]);
                    break;
                case "红茶":
                    Tea += (map.get("ml/day")[1]) + ",";
                    Tea += (map.get("black-tea-year")[0]) ;
                    break;
                case "绿茶":
                    Tea += (map.get("ml/day")[2]) + ",";
                    Tea += (map.get("green-tea-year")[0]) ;
                    break;
            }
        }

        //System.out.println("_______________________________");


        //用于存放饮食习惯的信息
        // 每周食用蔬菜次数 | 每周食用水果次数 | 食用肉蛋奶类次数 | 食用腌制食品的次数 | 食用油炸烟熏食品次数
        String Food = "";
        //饮酒情况栏目
        //System.out.println("饮食习惯栏目:");

        //每周食用新鲜蔬菜的次数
        Food += map.get("vegitable")[0] + "|";
        //System.out.println("每周食用新鲜蔬菜的次数" + map.get("vegitable")[0]);

        //每周食用新鲜水果的次数
        Food += map.get("fruit")[0] + "|";
        //System.out.println("每周食用新鲜水果的次数" + map.get("fruit")[0]);

        //每周食用肉蛋奶类的次数
        Food += map.get("eggmilk")[0] + "|";
        //System.out.println("每周食用肉蛋奶类的次数" + map.get("eggmilk")[0]);

        //每周食用腌制食品的次数
        Food += map.get("pickledfood")[0] + "|";
        //System.out.println("每周食用腌制食品的次数" + map.get("pickledfood")[0]);

        //每周食用油炸熏制食品的次数
        Food += map.get("smokefood")[0];
        //System.out.println("每周食用油炸熏制食品的次数" + map.get("smokefood")[0]);

        //System.out.println("_______________________________");


        //用于存放肠道疾病史的信息
        // 慢性结肠炎情况 | 慢性溃疡性结肠炎情况 | 肠息肉情况 | 慢性阑尾炎情况 | 其他情况
        //ID(Intestinal diseases)
        String ID = "";
        //饮酒情况栏目
        //System.out.println("肠道疾病史栏目:");

        //是否患过慢性结肠炎？
        ID += map.get("colitis")[0];
        //System.out.println("是否患过慢性结肠炎：" + map.get("colitis")[0]);
        if (map.get("colitis")[0].equals("是")){
            System.out.println("诊断时已经：" + map.get("age-get-colitis")[0]);
            ID += "#" + map.get("age-get-colitis")[0] + "|";
        }
        else {
            ID += "|";
        }

        //是否患过慢性溃疡性结肠炎？
        ID += map.get("colitis")[0];
        //System.out.println("是否患过慢性溃疡性结肠炎：" + map.get("ulcerative-colitis")[0]);
        if (map.get("ulcerative-colitis")[0].equals("是")){
            System.out.println("诊断时已经：" + map.get("age-get-ul-colitis")[0]);
            ID += "#" + map.get("age-get-ul-colitis")[0] + "|";
        }
        else {
            ID += "|";
        }

        //是否是否患过肠息肉？
        ID += map.get("Intestinal-polyps")[0];
        //System.out.println("是否患过肠息肉：" + map.get("Intestinal-polyps")[0]);
        if (map.get("Intestinal-polyps")[0].equals("是")){
            System.out.println("诊断时已经：" + map.get("age-get-int-polyps")[0]);
            ID += "#" + map.get("age-get-int-polyps")[0] + "|";
        }
        else {
            ID += "|";
        }

        //是否患过慢性阑尾炎？
        ID += map.get("appendicitis")[0];
        //System.out.println("是否患过慢性阑尾炎：" + map.get("appendicitis")[0]);
        if (map.get("appendicitis")[0].equals("是")){
            System.out.println("诊断时已经：" + map.get("age-get-appendicitis")[0]);
            ID += "#" + map.get("age-get-appendicitis")[0];
        }
        else {
        }

        //存在问卷以外的肠道疾病
        String other = map.get("app-other-disease")[0].replace(" " , "");
        if (other != ""){
            //System.out.println("|" + map.get("app-other-disease")[0] + "|");
            ID += "|" + map.get("app-other-disease")[0];
        }
        //System.out.println("_______________________________");

        //家族肿瘤患病史
        String Tumor = "";
        //System.out.println("是否有家族肿瘤患病史：" + map.get("tumor")[0]);
        if (map.get("tumor")[0].equals("是")){
            Tumor += map.get("tumor")[0] + "#" + map.get("tumor-other-disease")[0];
        }
        else {
            Tumor += map.get("tumor")[0];
        }

        //System.out.println("_______________________________");

        //填写的问卷编号
        String Code = map.get("Code")[0];

        //个人身体数值情况
        String Body = "";
        //System.out.println("身高：" + map.get("height")[0]);
        Body += map.get("height")[0] + "|";
        //System.out.println("体重：" + map.get("weight")[0]);
        Body += map.get("weight")[0] + "|";
        //System.out.println("脉搏：" + map.get("pulse")[0]);
        Body += map.get("pulse")[0] + "|";
        //System.out.println("血压：" + map.get("blood-pressure")[0]);
        Body += map.get("blood-pressure")[0];




        //输出查看整合提交的信息
//        System.out.println("用户信息------>" + UserInfo);
//        System.out.println("一般情况------>" + General);
//        System.out.println("吸烟情况------>" + Smoking);
//        System.out.println("饮酒情况------>" + Drink);
//        System.out.println("饮茶情况------>" + Tea);
//        System.out.println("饮食习惯------>" + Food);
//        System.out.println("肠道疾病史------>" + ID);
//        System.out.println("家族肿瘤患病史------>" + Tumor);
//        System.out.println("问卷编号------>" + Code);
//        System.out.println("身体数值------>" + Body);

        //获取目前时间 单位为s
        Long time = System.currentTimeMillis() / 1000;

        Colorectal_cancer cancer = new Colorectal_cancer();
        cancer.setUserInfo(UserInfo);
        cancer.setGeneral(General);
        cancer.setSmoking(Smoking);
        cancer.setDrink(Drink);
        cancer.setTea(Tea);
        cancer.setFood(Food);
        cancer.setID(ID);
        cancer.setTumor(Tumor);
        cancer.setCode(Code);
        cancer.setBody(Body);
        cancer.setTime(time);

        return cancerDao.InsertCancer(cancer);
        //return 1;
    }

    @Override
    public Integer Insertprevent(Map<String, String[]> map) {
        //用于存放用户个人信息
        //姓名|性别|出生日期|身份证号码
        String UserInfo = "";

        //个人信息栏目
        //System.out.println("_______________________________");
        //System.out.println("个人信息栏目:");
        //System.out.println("姓名(name)：" + Arrays.toString(map.get("name")));
        UserInfo += map.get("name")[0]  + "|";
        //System.out.println("性别(sex)：" + Arrays.toString(map.get("sex")));
        UserInfo += map.get("sex")[0]  + "|";
        //System.out.println("出生日期(birthday)：" + Arrays.toString(map.get("birthday")));
        UserInfo += map.get("birthday")[0] + "|";
        //System.out.println("身份证号码(id)：" + Arrays.toString(map.get("id")));
        UserInfo += map.get("id")[0];

        //用于存放第一部分选项
        String First = "";

        //常见癌症选项
//        System.out.println("_______________________________");
//        System.out.println("癌症普查:");
//        System.out.println("癌症选项(cancertype)" + Arrays.toString(map.get("cancertype")));
        for (int i = 0 ; i < map.get("cancertype").length ; i++){
            First += map.get("cancertype")[i];
            //System.out.println("选项:" + map.get("cancertype")[i]);
            if ( i + 1 == map.get("cancertype").length){
                First += "|";
            }
            else
                First += "#";
        }

        //System.out.println("70年代以来我国患癌症的人数" + map.get("cancer-population")[0]);
        First += map.get("cancer-population")[0] + "|";

        //主要危险因素
//        System.out.println("_______________________________");
//        System.out.println("主要危险因素:");
//        System.out.println("危险因素(danger)" + Arrays.toString(map.get("danger")));
        for (int i = 0 ; i < map.get("danger").length ; i++){
            First += map.get("danger")[i];
            //System.out.println("选项:" + map.get("danger")[i]);
            if ( i + 1 == map.get("danger").length){
                First += "|";
            }
            else
                First += "#";
        }

        //减少癌症的发生
//        System.out.println("_______________________________");
//        System.out.println("减少癌症的发生方法：");
//        System.out.println("方法(reduce-cancer)" + Arrays.toString(map.get("reduce-cancer")));
        for (int i = 0 ; i < map.get("reduce-cancer").length ; i++){
            First += map.get("reduce-cancer")[i];
            //System.out.println("选项:" + map.get("reduce-cancer")[i]);
            if ( i + 1 == map.get("reduce-cancer").length){
                First += "|";
            }
            else
                First += "#";
        }

        //警示症状
//        System.out.println("_______________________________");
//        System.out.println("警示症状：");
//        System.out.println("症状(sign)" + Arrays.toString(map.get("sign")));
        for (int i = 0 ; i < map.get("sign").length ; i++){
            First += map.get("sign")[i];
            //System.out.println("选项:" + map.get("sign")[i]);
            if ( i + 1 == map.get("sign").length){
                if (map.get("sign")[i].equals("其他")){
                    First += "," + map.get("remark")[0];
                }
                First += "|";
            }
            else
                First += "#";
        }

        //有效的预防措施至少可以较少1/3的癌症
//        System.out.println("_______________________________");
//        System.out.println("有效的预防措施至少可以较少1/3的癌症：");
//        System.out.println("预防措施(know)" + Arrays.toString(map.get("know")));
        First += map.get("know")[0];



        System.out.println("_______________________________");
        //第二部分
        String Second = "";
        //System.out.println("您认为大肠癌能治好吗？" + map.get("cancer-cureable")[0]);
        Second += map.get("cancer-cureable")[0];
        //System.out.println("您知道大肠癌的早期阶段吗？" + map.get("early-stage")[0]);
        Second += map.get("early-stage")[0];
        //System.out.println("您知道早期大肠癌治疗后应能活多少年？" + map.get("canlive")[0]);
        Second += map.get("canlive")[0];
        //System.out.println("下列哪些方法可以早期发现大肠癌？" + Arrays.toString(map.get("check-method")));
        for (int j = 0 ; j < map.get("check-method").length ; j++){
            Second += map.get("check-method")[j];
            //System.out.println("选项:" + map.get("check-method")[j]);
            if ( j + 1 == map.get("check-method").length){
                Second += "|";
            }
            else
                Second += "#";
        }

        //System.out.println("您认为不参加普查主要是因为？" + Arrays.toString(map.get("reason")));
        for (int j = 0 ; j < map.get("reason").length ; j++){
            Second += map.get("reason")[j];
            //System.out.println("选项:" + map.get("reason")[j]);
            if ( j + 1 == map.get("reason").length){
                Second += "|";
            }
            else
                Second += "#";
        }

        //System.out.println("下列那些方法可以治疗早期大肠癌？" + Arrays.toString(map.get("cure-method")));
        for (int j = 0 ; j < map.get("cure-method").length ; j++){
            Second += map.get("cure-method")[j];
            //System.out.println("选项:" + map.get("cure-method")[j]);
            if ( j + 1 == map.get("cure-method").length){
                Second += "|";
            }
            else
                Second += "#";
        }

        //System.out.println("合理饮食，粗细粮搭配等能预防大肠癌吗？" + map.get("can-prevent")[0]);
        Second += map.get("can-prevent")[0];
        //System.out.println("经常吃新鲜水果，蔬菜，含粗纤维事物能预防大肠癌吗？" + map.get("can-cure")[0]);
        Second += map.get("can-cure")[0];
        //System.out.println("养成良好的大便习惯，能预防大肠癌吗？" + map.get("habit")[0]);
        Second += map.get("habit")[0];
        //System.out.println("经常饮用不洁水容易得大肠癌吗？" + map.get("waste-water")[0]);
        Second += map.get("waste-water")[0];
        //System.out.println("您认为大便带血或腹泻，便秘交替您会到医院就诊吗？" + map.get("see-doctor")[0]);
        Second += map.get("see-doctor")[0];
        //System.out.println("您知道家属中有大肠腺瘤病(息肉)或大肠癌的人应积极参加普查吗？" + map.get("fam-member-atten")[0]);
        Second += map.get("fam-member-atten")[0];

        //问卷编号
        String Code = "";
        Code += map.get("Code")[0];

        //提示信息
//        System.out.println("用户常规信息--->" + UserInfo);
//        System.out.println("第一部分------>" + First);
//        System.out.println("First字符串长度：" + First.length());
//        System.out.println("第二部分------>" + Second);
//        System.out.println("Second字符串长度：" + Second.length());
//        System.out.println("Code--------->" + Code);

        Prevent_cancer preventCancer = new Prevent_cancer();
        preventCancer.setUserInfo(UserInfo);
        preventCancer.setFirst(First);
        preventCancer.setSecond(Second);
        preventCancer.setCode(Code);
        preventCancer.setTime(System.currentTimeMillis() / 1000);

        Integer i = cancerDao.InsertPrevent(preventCancer);

        return i;
    }

    @Override
    public Integer Insertquantity(Map<String, String[]> map) {
        System.out.println("_____________________________");
        //个人信息栏目
        //姓名|性别|出生日期|身份证号
        String UserInfo = "";
        //System.out.println("姓名(name)：" + map.get("name")[0]);
        UserInfo += map.get("name")[0] + "|";
        //System.out.println("性别(sex)：" + map.get("sex")[0]);
        UserInfo += map.get("sex")[0] + "|";
        //System.out.println("出生日期(birthday):" + map.get("birthday")[0]);
        UserInfo += map.get("birthday")[0] + "|";
        //System.out.println("身份证号(id):" + map.get("id")[0]);
        UserInfo += map.get("id")[0];
        //System.out.println("_____________________________");

        //额外的用户信息
        String ExtraInfo = "";
        //System.out.println("联系方式：" + map.get("telephone")[0]);
        ExtraInfo += map.get("telephone")[0] + "|";
        //System.out.println("现居地址：" + map.get("address")[0]);
        ExtraInfo += map.get("address")[0];


        //System.out.println("_____________________________");

        //基础信息
        String General = "";
        //System.out.println("婚姻状况：" + map.get("marry")[0]);
        General += map.get("marry")[0] + "|";
        //System.out.println("文化程度:" + map.get("education")[0]);
        General += map.get("education")[0] + "|";
        //System.out.println("职业:" + map.get("work")[0]);
        General += map.get("work")[0];


        //System.out.println("_____________________________");
        //病症信息
        String Investigation = "";
        //System.out.println("本人有无慢性腹泻史：" + map.get("diarrhea")[0]);
        Investigation += map.get("diarrhea")[0] + "|";

        //System.out.println("本人有无慢性便秘史：" + map.get("constipation")[0]);
        Investigation += map.get("constipation")[0] + "|";

        //System.out.println("本人有无粘液或血便史：" + map.get("bloody-stool")[0]);
        Investigation += map.get("bloody-stool")[0] + "|";

        //System.out.println("本人有无慢性阑尾炎或阑尾切除史：" + map.get("appendix")[0]);
        Investigation += map.get("appendix")[0] + "|";

        //System.out.println("本人有无慢性胆囊炎或胆囊切除史：" + map.get("cholecystitis")[0]);
        Investigation += map.get("cholecystitis")[0] + "|";

        //System.out.println("近二十年来本人有无不良生活事件史：" + map.get("unhealth-life")[0]);
        Investigation += map.get("unhealth-life")[0] + "|";

        //System.out.println("本人有无癌症史：" + map.get("cancer-own")[0]);
        Investigation += map.get("cancer-own")[0];
        if (map.get("cancer-own")[0].equals("有")){
            //System.out.println("发病年龄：" + map.get("cancer-age")[0]);
            //System.out.println("诊断的医院：" + map.get("hospital")[0]);
            Investigation += "," + map.get("cancer-age")[0];
            Investigation += "#" + map.get("hospital")[0] + "|";
        }else {
            Investigation += "|";
        }

        //System.out.println("本人有无肠息肉史：" + map.get("cancer")[0]);
        Investigation += map.get("cancer")[0] + "|";

        //System.out.println("一级亲属是否有肠癌史：" + map.get("Family-disease")[0]);
        Investigation += map.get("Family-disease")[0];
        if (map.get("Family-disease")[0].equals("有")){
            Investigation += "," + map.get("relative-name")[0];
            Investigation += "#" + map.get("cancer-age")[1];
            Investigation += "#" + map.get("alive")[0];
        }

        //问卷类型
        String Code = "";
        Code += map.get("Code")[0];

        //信息输出
//        System.out.println("基础个人信息-------->" + UserInfo);
//        System.out.println("额外的用户信息------->" + ExtraInfo);
//        System.out.println("基础信息------------>" + General);
//        System.out.println("病症信息------------>" + Investigation);
//        System.out.println("问卷编号------------>" + Code);

        Quantity_cancer quantityCancer = new Quantity_cancer();
        quantityCancer.setUserInfo(UserInfo);
        quantityCancer.setExtraInfo(ExtraInfo);
        quantityCancer.setGeneral(General);
        quantityCancer.setInvestigation(Investigation);
        quantityCancer.setTime(System.currentTimeMillis() / 1000);
        quantityCancer.setCode(Code);

        int i = cancerDao.InsertQuantity(quantityCancer);

        return i;
    }
}
