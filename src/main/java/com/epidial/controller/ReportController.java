package com.epidial.controller;

import com.epidial.bean.User;
import com.epidial.dao.Info.UserDao;
import com.epidial.serivce.OrderService;
import com.epidial.serivce.ReportService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@CrossOrigin
@RequestMapping
public class ReportController {

    @Resource
    private ReportService reportService;

    @Resource
    private OrderService orderService;

    @Resource
    private UserDao userDao;

    @RequestMapping(value = "/user/report/getData")
    @ResponseBody
    public String getData(HttpSession session){
        User user = (User)session.getAttribute("sessionuser");
        List<User> ntrGtBioUsers = userDao.findNtrGtBio();//查找自然年龄大于生物学年龄的用户
        List<User> ntrLtBioUsers = userDao.findNtrLtBio();//查找自然年龄小于生物学年龄的用户
        //自然年龄>生物学年龄分为一组
        String ntrGtBioData = redata(ntrGtBioUsers, new String[2][ntrGtBioUsers.size()]);
        //自然年龄<生物学年龄分为一组
        String ntrLtBioData = redata(ntrLtBioUsers, new String[2][ntrLtBioUsers.size()]);
        //return reportService.GetDataForReport(user.getUuid());
        String data=ntrGtBioData+"@"+ntrLtBioData+"@"+user.getNaturally()+"-"+user.getBiological();
        System.out.println(data);
        return  data;

//        String uuid = jsonObject.getString("uuid");
//        return reportService.GetDataForReport(uuid);
    }

    private  String redata(List<User> list, String[][] box) {

        String data="";
        if(list!=null&&!list.isEmpty()){
            for (int i=0;i<list.size();i++){
                data+=list.get(i).getNaturally()+"-"+list.get(i).getBiological()+"#";
            }
            data = data.substring(0,data.lastIndexOf("#"));
        }
        return data;
    }

    @RequestMapping(value = "/user/report/view")
    public ModelAndView index(HttpSession session){
        User user = (User)session.getAttribute("sessionuser");
        ModelAndView modelView=new ModelAndView();
        if (!orderService.CheckOrderExist(user.getUuid())){
            modelView.setViewName("/WEB-INF/front/aging.jsp");
            modelView.addObject("title","Aging");
            modelView.addObject("canback",true);
            return modelView;
        }
        modelView.setViewName("/WEB-INF/front/bioreport.jsp");
        modelView.addObject("title","Your Biological Age Report");
        modelView.addObject("canback",true);
        return modelView;
    }

    @RequestMapping(value = "/user/report/iage")
    @ResponseBody
    public User getDataForOne(HttpSession session){
    //public List getDataForOne(){
      String mail = ((User)session.getAttribute("sessionuser")).getMail();
        return  userDao.findUserByMail(mail);
        //return reportService.GetDataForPersonById(user.getUuid());
    }

    @RequestMapping(value = "/user/report/state")
    @ResponseBody
    public String state(HttpSession session){
        User user = (User)session.getAttribute("sessionuser");
        return userDao.findUserByMail(user.getMail()).getState();
    }
}
