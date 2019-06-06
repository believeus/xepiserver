package com.epidial.controller;

import com.epidial.bean.User;
import com.epidial.dao.epi.UserDao;
import com.epidial.filter.SysFirewall;
import com.epidial.serivce.MailService;
import com.epidial.utils.UserCreate;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@CrossOrigin
@RequestMapping
public class AppUserController {

    @Resource
    private UserDao userDao;
    @Resource
    private MailService mailService;

    @RequestMapping(value = "/user/login")
    public @ResponseBody
    String login(String email, String password,HttpSession session) {
        User user = userDao.findUser("mail",email);
        if (user == null) {
            return "ERROR:Mailbox not registered";
        } else {
            if (user.getValid() == 0) {
                return "ERROR:Mailbox inactivated";
            } else if (!user.getPassword().equals(password)) {
                return "ERROR:Password error";
            }else {
                session.setAttribute("sessionuser",user);
                user.setLastLogin(System.currentTimeMillis());
                return SysFirewall.urlstack.pop();
            }
        }
    }

    @RequestMapping(value = "/user/register")
    public @ResponseBody
    String register(User u, HttpSession session) {
        User user = userDao.findUser("mail",u.getMail());
        if (user != null) {
            return "the " + u.getMail() + " Mailbox has been registered!";
        } else {
            String uuid = UserCreate.getUuid();
            String title = "[DO NOT REPLY] Please verify your registration on Epi-Aging";
            String message = "<!DOCTYPE html>" +
                    "<html>" +
                    "<head>" +
                    "<meta charset=\"UTF-8\">" +
                    "<title></title>" +
                    "</head>" +
                    "<body>" +
                    "<div style='width: 100%;height: auto;'>" +
                    "<div style='width: 100%;height: 60px;'></div>" + //
                    "<p>Dear user</p><p>Thank you for your registration on Epi-Aging. <br />Please click on the following link to complete your registration:</p>" +
                    "<a href='https://app.beijingepidial.com/user/authMail.jhtml?mail=" + u.getMail()+ "'>https://app.beijingepidial.com/user/authMail.jhtml?mail=" + u.getMail()+ "</a>" +
                    "<p style='color:red'>If you're unable to click on any of the links above, copy and paste the URL into a new browser window instead</p><p>HKG epitherapeutics Limited<br />https://www.hkgepitherapeutics.com</p>" +
                    "<p>(+852) 2354 8297<br/>info@hkgepitherapeutics.com</p><p>2019 All rights reserved</p>" +
                    "</div>" +
                    "</body>" +
                    "</html>";
            String data = mailService.sendMail(title, message, u.getMail());
            if (data.equals("success")) {
                u.setRegister(System.currentTimeMillis());
                u.setUuid(uuid);
                userDao.save(u);
                user = userDao.findUser("mail",u.getMail());
                session.setAttribute("sessionuser", user);
                return "success";
            }else {
                return  data;
            }
        }
    }

    @RequestMapping(value = "/user/regsuccess")
    public ModelAndView toLastRegister() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/LastRegister.jsp");
        modelView.addObject("title", "Thank you for your registration.");
        modelView.addObject("canback", false);
        return modelView;
    }

    @RequestMapping(value = "/user/authMail")
    public ModelAndView authMail(@Param("mail") String mail) {
        ModelAndView modelView = new ModelAndView();
        User user = userDao.findUser("mail", mail);
        user.setValid(1);//验证通过
        String view=userDao.update(user)?"/WEB-INF/front/verify_success.jsp":"/WEB-INF/front/verify_error.jsp";
        modelView.setViewName(view);
        return modelView;
    }

    @RequestMapping(value = "/toSuccess")
    public ModelAndView toSuccess() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/verify_success.jsp");
        return modelView;
    }

    @RequestMapping(value = "/toError")
    public ModelAndView toError() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/verify_error.jsp");
        return modelView;
    }

    @RequestMapping("/user/forgotPaswd")
    public  String fpasswd(){
        return "/WEB-INF/front/fpaswd.jsp";
    }
    @RequestMapping("/user/sendpaswd")
    public @ResponseBody
    String sendpaswd(String email) {
        User user = userDao.findUser("mail",email);
        if (user != null) {
            String title = "[DO NOT REPLY] Please checkout your password";
            String message = "Dear User:your password is:" + user.getPassword();
            mailService.sendMail(title, message, email);
            return "success";
        } else {
            return "null";
        }
    }
}
