package com.epidial.controller;

import com.epidial.bean.Udata;
import com.epidial.bean.User;
import com.epidial.dao.epi.TaskDao;
import com.epidial.dao.epi.UdataDao;
import com.epidial.dao.epi.UserDao;
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
    private TaskDao taskDao;

    @Resource
    private UserDao userDao;
    @Resource
    private UdataDao udataDao;

    @RequestMapping(value = "/user/report/getData")
    @ResponseBody
    public String getData(HttpSession session, String id) {
        User user = (User) session.getAttribute("sessionuser");
        Udata udata = udataDao.findBy("id", id).get(0);
        List<Udata> ntrGtBioUsers = udataDao.findNtrGtBio();//查找自然年龄大于生物学年龄的用户
        List<Udata> ntrLtBioUsers = udataDao.findNtrLtBio();//查找自然年龄小于生物学年龄的用户
        //自然年龄>生物学年龄分为一组
        String ntrGtBioData = redata(ntrGtBioUsers);
        //自然年龄<生物学年龄分为一组
        String ntrLtBioData = redata(ntrLtBioUsers);
        //return reportService.GetDataForReport(user.getUuid());
        String data = ntrGtBioData + "@" + ntrLtBioData + "@" + udata.getNaturally() + "-" + udata.getBiological();
        System.out.println(data);
        return data;
    }

    private String redata(List<Udata> list) {
        String data = "";
        if (list != null && !list.isEmpty()) {
            for (int i = 0; i < list.size(); i++) {
                data += list.get(i).getNaturally() + "-" + list.get(i).getBiological() + "#";
            }
            data = data.substring(0, data.lastIndexOf("#"));
        }
        return data;
    }

    @RequestMapping(value = "/user/bioreport/index")
    public ModelAndView index(HttpSession session) {
        User user = (User) session.getAttribute("sessionuser");
        ModelAndView modelView = new ModelAndView();
        modelView.addObject("canback", true);
        //已经在购物车没有购买
        if (!taskDao.findUnPayDNAKit(user.getId()).isEmpty()) {
            return new ModelAndView("redirect:/user/cart/check.jhtml");
        //如果产品已经购买了
        } else if (!taskDao.findPayDNAKit(user.getId()).isEmpty()) {
            modelView.setViewName("/WEB-INF/front/bioreport.jsp");
            modelView.addObject("title", "Your Biological Age Report");
         //购物车中没有产品也没有购买任何产品，跳转到产品介绍页面
        } else {
            modelView.setViewName("/WEB-INF/front/aging.jsp");
            modelView.addObject("title", "Aging");
        }
        return modelView;
    }

    @RequestMapping(value = "/user/report/state")
    @ResponseBody
    public String state(HttpSession session) {
        User user = (User) session.getAttribute("sessionuser");
        //如果已经购买了生物学产品
        if (!udataDao.find("uid", user.getId(), "status", "pending").isEmpty()) {
            return "pending";
        } else if (!udataDao.find("uid", user.getId(), "status", "processing").isEmpty()) {
            return "processing";
        } else {
            return "finished";
        }
    }

    @ResponseBody
    @RequestMapping("/user/report/bind")
    public String bind(String barcode, String id) {
        Udata data = udataDao.findBy("id", id).get(0);
        data.setBarcode(barcode);
        udataDao.update(data);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/user/report/status")
    public String xx(String id) {
        Udata data = udataDao.findBy("id", id).get(0);
        return data.getStatus();
    }
}
