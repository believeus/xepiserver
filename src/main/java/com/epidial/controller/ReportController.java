package com.epidial.controller;

import com.epidial.bean.*;
import com.epidial.dao.epi.*;
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
    @Resource
    private DnakitDao dnakitDao;
    @Resource
    private WaresDao waresDao;

    @RequestMapping(value = "/user/report/getData")
    @ResponseBody
    public String getData(HttpSession session, String id) {
        User user = (User) session.getAttribute("sessionuser");
        Udata udata = udataDao.findBy("id", id);
        List<Udata> ntrGtBioUsers = udataDao.findNtrGtBio();//查找自然年龄大于生物学年龄的用户
        List<Udata> ntrLtBioUsers = udataDao.findNtrLtBio();//查找自然年龄小于生物学年龄的用户
        //自然年龄>生物学年龄分为一组
        String ntrGtBioData = redata(ntrGtBioUsers);
        //自然年龄<生物学年龄分为一组
        String ntrLtBioData = redata(ntrLtBioUsers);
        String data = ntrGtBioData + "@" + ntrLtBioData + "@" + udata.getNaturally() + "-" + udata.getBiological();
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
        try {
            Udata data = udataDao.findBy("barcode", barcode);
            data.setBarcode(barcode);
            data.setUploadTime(System.currentTimeMillis());
            udataDao.update(data);
            return "success";
        } catch (Exception e) {
            return "error";
        }

    }

    @ResponseBody
    @RequestMapping("/user/report/status")
    public String status(String id) {
        Udata data = udataDao.findBy("id", id);
        return data.getStatus();
    }


    @ResponseBody
    @RequestMapping("/user/report/my")
    public ModelAndView myreport() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/mydnage.jsp");
        modelView.addObject("title", "Your Biological Age Report");
        return modelView;
    }

    @ResponseBody
    @RequestMapping("/user/report/upbarcode")
    public String upbarcode(String barcode, HttpSession session) {
        User user = (User) session.getAttribute("sessionuser");
        Dnakit dnakit = dnakitDao.find("barcode", barcode);
        if (dnakit != null) {
            Wares wares = waresDao.find("id", "1001").get(0);
            long time = System.currentTimeMillis();
            Task task = new Task();
            task.setGid(wares.getId());
            task.setImgpath(wares.getImgpath());
            task.setOrderno("HKG:" + time);
            task.setPay(1);//已付款
            task.setName(wares.getName());
            task.setTotal(wares.getPrice() * user.getDiscount());
            task.setUid(user.getId());
            task.setType(wares.getType());
            task.setValid(0);//0：订单有效
            task.setCreateTime(time);//订单创建时间
            task.setPayTime(time);
            task.setDelivery("deliveried");
            task.setEmail(user.getMail());
            task.setBarcode(barcode);
            taskDao.save(task);
            Udata data = new Udata(user.getId(), user.getNickname(), user.getMail());
            data.setBarcode(barcode);
            data.setUploadTime(time);
            udataDao.save(data);
            dnakitDao.delete(dnakit.getId());
            return "success";
        } else {
            try {
                //如果已经购买了试剂盒
                Task task = taskDao.findPayDnaKitTask("barcode", barcode, "uid", user.getId());
                if (task != null) {
                    //使用过之后订单失效
                    if (task.getValid()!=1){
                        task.setValid(1);
                        taskDao.update(task);
                    }
                    Udata data = udataDao.findBy("barcode", barcode);
                    if (data==null) {
                        data = new Udata(user.getId(), user.getNickname(), user.getMail());
                        data.setBarcode(barcode);
                        data.setUploadTime(System.currentTimeMillis());
                        udataDao.save(data);
                    }
                    Udata u=udataDao.findBy("barcode", barcode);
                    return u.getStatus() + "@" + u.getId();
                }else {
                    return "empty";
                }
            } catch (Exception e) {
                return "error";//没有库存
            }


        }

    }

}
