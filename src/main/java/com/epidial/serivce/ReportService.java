package com.epidial.serivce;

import com.epidial.bean.Udata;
import com.epidial.dao.epi.ReportDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

/**
 * @ CreateDate : Create in 19:20 2019/3/21
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Service("reportService")
public class ReportService {
    @Resource
    private ReportDao reportDao;

    public List GetDataForReport(String uuid, HttpSession session) {
        List<Udata> list = new LinkedList<Udata>();

        //当用户已经进行一次查询之后，直接从session中获取数据在没有数据更新的情况下不在需要查询数据库
        if (session.getAttribute("BioReport") != null){
            list = (List<Udata>)session.getAttribute("BioReport");

        }
        else {
          list = reportDao.GetBioData();
        }

        String [][] data = new String[list.size()][2];

        //把数据先从list中取出，存放入一个二维数组
        for (int i = 0 ; i < list.size() ; i++) {
            data[i][0] = list.get(i).getNaturally()+"";
            data[i][1] = list.get(i).getBiological()+"";
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

//        Udata bio = reportDao.GetBioDataForPerson(id);
//
//        List Person = new LinkedList();
//        Person.add(bio.getId());
//        Person.add(bio.getName());
//        Person.add(bio.getNatural_age());
//        Person.add(bio.getBiological_age());

        //list1.add(GetDataForPersonById(id));

        //获得该用户的数据
        Udata bio = reportDao.GetBioDataForPersonByUuid(uuid);

        List Person = new LinkedList();
        Person.add(bio.getId());
        Person.add(bio.getUsername());
        Person.add(bio.getNaturally());
        Person.add(bio.getBiological());

        list1.add(Person);


        return list1;
    }

    public List GetDataReport( HttpSession session ){

        session.setAttribute("BioReport" , reportDao.GetBioData());

        return reportDao.GetBioData();
    }

    //根据条码id查询个人信息
    public List GetDataForPerson( HttpSession session ,String id) {
        List<Udata> list = new LinkedList<Udata>();

        Udata bio = reportDao.GetBioDataForPerson(id);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");

        List Person = new LinkedList();
        Person.add(bio.getId());
        Person.add(bio.getUsername());
        Person.add(bio.getNaturally());
        Person.add(bio.getBiological());
        Person.add(simpleDateFormat.format(System.currentTimeMillis()));

        return Person;
    }

    //根据用户id查询生物学年龄信息
    public List GetDataForPersonById(String uuid) {

        Udata bio = reportDao.GetBioDataForPersonByUuid(uuid);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");

        List personLink = new LinkedList();
        personLink.add(bio.getId());
        personLink.add(bio.getUsername());
        personLink.add(bio.getNaturally());
        personLink.add(bio.getBiological());
        personLink.add(simpleDateFormat.format(System.currentTimeMillis()));

        return personLink;
    }

}
