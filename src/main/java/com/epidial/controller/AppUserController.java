package com.epidial.controller;

import com.epidial.bean.User;
import com.epidial.dao.epi.UserDao;
import com.epidial.serivce.MailService;
import com.epidial.utils.UserCreate;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
@CrossOrigin
@RequestMapping
public class AppUserController {

    @Resource
    private UserDao userDao;
    @Resource
    private MailService mailService;

    @RequestMapping(value = "/user/loginview")
    public ModelAndView Tologin() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/login.jsp");
        modelView.addObject("title", "Login");
        modelView.addObject("canback", true);
        return modelView;
    }

    @RequestMapping(value = "/user/login")
    public @ResponseBody
    String login(String email, String password, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = userDao.findUser("mail", email);
        if (user == null) {
            return "ERROR:Mailbox not registered";
        } else {
            if (user.getValid() == 0) {
                return "ERROR:Mailbox inactivated";
            } else if (!user.getPassword().equals(password)) {
                return "ERROR:Password error";
            } else {
                user.setLastLogin(System.currentTimeMillis());
                userDao.update(user);
                session.setAttribute("sessionuser", user);
                System.out.println(request.getRequestURI());
                return "index.jhtml";
            }
        }
    }

    @RequestMapping(value = "/user/register")
    public @ResponseBody
    String register(User u, HttpSession session) {
        User user = userDao.findUser("mail", u.getMail());
        if (user != null) {
            return u.getMail() + " \nhas been registered!";
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
                    "<span style='font-size: 24px;text-decoration: underline' >https://app.beijingepidial.com/user/authMail.jhtml?mail=" + u.getMail() + "</span>" +
                    "<p style='color:red;font-size: 18px;'>Note: If clicking the activation link fails to activate the user, copy the activation link to the browser address bar to activate the user's mailbox.</p><p>HKG epitherapeutics Limited<br />https://www.hkgepitherapeutics.com</p>" +
                    "<p>(+852) 2354 8297<br/>info@hkgepitherapeutics.com</p><p>2019 All rights reserved</p>" +
                    "</div>" +
                    "</body>" +
                    "</html>";
            String data = mailService.sendMail(title, message, u.getMail());
            if (data.equals("success")) {
                u.setRegister(System.currentTimeMillis());
                u.setUuid(uuid);
                u.setToken(UUID.randomUUID().toString());
                u.setDiscount(1);
                userDao.save(u);
                return "success";
            } else {
                return "network-error";
            }
        }
    }

    @RequestMapping(value = "/user/regsuccess")
    public ModelAndView toLastRegister() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/regsuccess.jsp");
        modelView.addObject("title", "register success");
        modelView.addObject("canback", false);
        return modelView;
    }

    @RequestMapping(value = "/user/authMail")
    public ModelAndView authMail(@Param("mail") String mail) {
        ModelAndView modelView = new ModelAndView();
        User user = userDao.findUser("mail", mail);
        user.setValid(1);//验证通过
        String view = userDao.update(user) ? "/WEB-INF/front/verify_success.jsp" : "/WEB-INF/front/verify_error.jsp";
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
    public String fpasswd() {
        return "/WEB-INF/front/fpaswd.jsp";
    }

    @RequestMapping("/user/sendpaswd")
    public @ResponseBody
    String sendpaswd(String email) {
        User user = userDao.findUser("mail", email);
        if (user != null) {
            String title = "[DO NOT REPLY] Please reset your password";
            String message = "<!DOCTYPE html>" +
                    "<html>" +
                    "<head>" +
                    "<meta charset=\"UTF-8\">" +
                    "<title></title>" +
                    "</head>" +
                    "<body>" +
                    "<div style='width: 100%;height: auto;'>" +
                    "<div style='width: 100%;height: 60px;'></div>" + //
                    "<p>Dear user</p><p>Thank you for your registration on Epi-Aging. <br />Please click on the following link to reset your password:</p>" +
                    "<a href='https://app.beijingepidial.com/user/repasswdview.jhtml?mail=" + user.getMail() + "&token=" + user.getToken() + "'>https://app.beijingepidial.com/user/repasswdview.jhtml?mail=" + user.getMail() + "&token=" + user.getToken() + "</a>" +
                    "<p style='color:red'>If you're unable to click on any of the links above, copy and paste the URL into a new browser window instead</p><p>HKG epitherapeutics Limited<br />https://www.hkgepitherapeutics.com</p>" +
                    "<p>(+852) 2354 8297<br/>info@hkgepitherapeutics.com</p><p>2019 All rights reserved</p>" +
                    "</div>" +
                    "</body>" +
                    "</html>";
            mailService.sendMail(title, message, email);
            System.out.println(message);
            return "success";
        } else {
            return "null";
        }
    }

    @RequestMapping("/user/mycenter/index")
    public ModelAndView mycenter() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/usercenter.jsp");
        modelView.addObject("title", "User Center");
        modelView.addObject("canback", true);
        return modelView;
    }

    @RequestMapping("/user/repasswdview")
    public ModelAndView repasswdview(String mail, String token) {
        ModelAndView modelView = new ModelAndView();
        User user = userDao.findUser("mail", mail);
        if (user != null) {
            if (user.getToken().equals(token)) {
                modelView.setViewName("/WEB-INF/front/resetview.jsp");
                modelView.addObject("user", user);
            } else {
                String message = "Token is invalid, please click <strong>[forget password]</strong> again on App ,We will send a link to reset the password to your mailbox again. Please reset your password again via this link.";
                modelView.addObject("message", message);
                modelView.setViewName("/WEB-INF/front/mailInvalid.jsp");
            }
        } else {
            String message = "Mailbox not registered!";
            modelView.addObject("message", message);
            modelView.setViewName("/WEB-INF/front/mailInvalid.jsp");
        }
        return modelView;
    }

    @ResponseBody
    @RequestMapping("/user/repasswd")
    public String repasswd(User json) {
        User user = userDao.findUser("mail", json.getMail());
        if (user != null) {
            if (user.getToken().equals(json.getToken())) {
                user.setPassword(json.getPassword());
                user.setToken(UUID.randomUUID().toString());
                userDao.update(user);
                return "reset password success!";
            } else {
                return "Token is invalid, please click \n[forget password] again on App";
            }
        } else {
            return "Mailbox not registered!";
        }
    }

    @RequestMapping(value = "/register")
    public ModelAndView regview() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/register.jsp");
        modelView.addObject("title", "Register");
        modelView.addObject("canback", true);
        return modelView;
    }

    @RequestMapping("/user/logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        return new ModelAndView("redirect:/index.jhtml");
    }
}
