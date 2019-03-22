package com.Serivce.impl;

import com.Bean.Bio;
import com.Dao.ReportDao;
import com.Serivce.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * @ CreateDate : Create in 19:20 2019/3/21
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Service("reportService")
public class ReportServiceImpl implements ReportService {
    @Resource
    private ReportDao reportDao;

    @Autowired
    private HttpServletRequest request;

    @Override
    public List GetDataForReport(String id) {
        HttpSession session = request.getSession();
        List<Bio> list = new LinkedList<>();

        //当用户已经进行一次查询之后，直接从session中获取数据在没有数据更新的情况下不在需要查询数据库
        if (session.getAttribute("BioReport") != null){
            list = (List<Bio>)session.getAttribute("BioReport");

        }
        else {
          list = reportDao.GetBioData();
        }

        String [][] data = new String[list.size()][2];

        //把数据先从list中取出，存放入一个二维数组
        for (int i = 0 ; i < list.size() ; i++) {
            data[i][0] = list.get(i).getNatural_age().toString();
            data[i][1] = list.get(i).getBiological_age().toString();
        }

        //把二维数组转换成list
        List dataListLt = new LinkedList();
        List dataListGt = new LinkedList();
        for (int i = 0 ; i < data.length ; i++){
            if (Double.parseDouble(data[i][0]) < Double.parseDouble(data[i][1])){
                    dataListLt.add(data[i]);
            }
            else
                dataListGt.add(data[i]);
        }

        List list1 = new LinkedList();
        list1.add(dataListLt);
        list1.add(dataListGt);

        Bio bio = reportDao.GetBioDataForPerson(id);

        List Person = new LinkedList();
        Person.add(bio.getId());
        Person.add(bio.getName());
        Person.add(bio.getNatural_age());
        Person.add(bio.getBiological_age());

        list1.add(Person);



        return list1;
    }

    public List GetDataReport(){

        HttpSession session = request.getSession();
        session.setAttribute("BioReport" , reportDao.GetBioData());

        return reportDao.GetBioData();
    }
}
