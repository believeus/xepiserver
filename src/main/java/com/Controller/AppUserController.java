package com.Controller;

import com.Bean.User;
import com.Bean.UserInfo;
import com.Serivce.IUserSerivce;
import com.Serivce.MailService;
import com.Utils.GeneratorCode;
import com.Utils.SendMessage;
import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @ CreateDate : Create in 13:39 2019/3/7
 * @ Explain :  用于APP用户登陆、注册、找回密码
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Controller
@CrossOrigin
@RequestMapping(value = "/App")
public class AppUserController {
    public static final String key = "k@hkgepitherapeutics.com";
    /*
     * {"type" : //输入的账户方式 -> Phone|Mail
     *  "verification" : //前端传递的登陆方式 -> 1(账户 + 密码)|2(账户 + 验证码)
     *  "purpose" : login | register | lose
     *  "username" : //前端传递的登陆用户名 -> 手机号码|电子邮箱
     *  "pwd" : //前端传递的密码 -> 密码
     *  "newPwd" : //前端传递的新密码 -> 密码
     *  "code" : //前端传递的验证码 ->验证码}
     * */

    @Resource
    private IUserSerivce iUserSerivce;

    @Autowired
    private HttpServletRequest request;

    @Resource
    private MailService mailService;

    /**
     * @param jsonObject
     * @return java.util.Map
     * @description 用于用户进行登陆操作
     * @author Eestill
     * @date 2019/3/7 13:42
     */
    @RequestMapping(value = "/Userlogin")
    @ResponseBody
    public String UserLogin(@RequestBody JSONObject jsonObject) {
        /*
         * {"type" : //输入的账户方式 -> Phone|Mail
         *  "verification" : //前端传递的登陆方式 -> 1(账户 + 密码)|2(账户 + 验证码)
         *  "username" : //前端传递的登陆用户名 -> 手机号码|电子邮箱
         *  "pwd" : //前端传递的密码 -> 密码
         *  "code" : //前端传递的验证码 ->验证码}
         * */

        String type = jsonObject.getString("type");
        String verification = jsonObject.getString("verification");
        String username = jsonObject.getString("username");
        String pwd = jsonObject.getString("pwd");
        String code = jsonObject.getString("code");
        //获取用户选择的国家地区
        String country = jsonObject.getString("country");

        Map<String, Object> map = new HashMap();
        System.out.println(jsonObject);

        UserInfo userInfo = new UserInfo();

        //存放密码进入对象中
        userInfo.setPwd(pwd);

        //根据传入的type来判断用户根据什么来进行登陆
        //userInfo.setType(type);

        if (username.indexOf("@") != -1) {
            userInfo.setMail(username);
        } else
            userInfo.setPhone(username);

        //根据传入type来分别赋予值
        //判断选择用户登陆类型
//        if (type.equals("Phone")){
//            userInfo.setPhone(username);
//        }
//        else if (type.equals("Mail")){
//            userInfo.setMail(username);
//        }else if (type.equals("uuid")){
//            userInfo.setUuid(username);
//        }else
//            map.put("msg" , "登陆类型错误，请核实传入的登陆类型是否有误！");

        //根据verification判断用户进行登陆验证的方式
        //1.账号 + 密码
        //2.账号 + 验证码
        if (verification.equals("1")) {
            HttpSession session = request.getSession();
            if (iUserSerivce.LoginUser(userInfo) == null) {
                return "error";
            }
            User data = iUserSerivce.LoginUser(userInfo);
            session.setAttribute("userInfo", data);
            map.put("data", data);

            //存放数据进UserInfo对象中，便于后期数据处理
            UserInfo user = new UserInfo();
            user.setPwd(pwd);
            user.setUuid(data.getUuid());
            session.setAttribute("user", user);

            //获取上一次请求的链接
            String uri = request.getRequestURI();
            //跳转返回上一次访问的页面
            return "index.jhtml";
        } else if (verification.equals("2")) {
            HttpSession session = request.getSession();
            UserInfo userLink = (UserInfo) session.getAttribute("userLink");
            System.out.println(userLink);

            if (userLink.getPhone().equals(username)) {
                if (code.equals(userLink.getCode())) {
                    //如果该用户不存在
                    if (iUserSerivce.CheckTel(username) == null) {
                        userLink.setCountry(country);
                        userLink.setPwd("12345678");
                        userLink.setType("Phone");
                        User user = (User) (iUserSerivce.app_CreateUser(userLink)).get("data");
                        session.setAttribute("user", user);
                        session.setAttribute("userInfo", user);
                        return "index.jhtml";
                    }
                    User u = iUserSerivce.LoginUser(userLink);
                    session.setAttribute("userInfo", u);

                    //存放数据进UserInfo对象中，便于后期数据处理
                    UserInfo user = new UserInfo();
                    user.setPwd(iUserSerivce.getPwd(u.getUuid()));
                    user.setUuid(u.getUuid());
                    session.setAttribute("user", user);

                    map.put("data", u);

                    //获取上一次请求的链接
                    String uri = request.getRequestURI();
                    return "index.jhtml";
                } else
                    map.put("msg", "Verification code error!");
            } else
                map.put("msg", "Inconsistent application for sending mobile phone and input mobile phone!");
        } else
            map.put("msg", "请检查账户验证方式是否输入有误！");

        return "error";
    }

    @RequestMapping(value = "/getCode")
    @ResponseBody
    public String getCode(@RequestBody JSONObject jsonObject, HttpServletRequest request) {
        /*
         *  {"type" : //输入的账户方式 Phone|Mail,
         *   "purpose" : login | register | lose
         *   "username" : //需要接收验证码的手机号码 | 需要接收验证码的邮箱
         *   "AreaCode" : //国家的区号}
         *
         * */
        UserInfo userInfo = new UserInfo();

        System.out.println(jsonObject);

        //获得传入账户需要登陆的方式
        String type = jsonObject.getString("type");

        //获取用户提交申请的用途
        String purpose = jsonObject.getString("purpose");

        //用于存放传入的手机号码 或者是 邮箱
        String username = jsonObject.getString("username");

        //把用户进行操作和提交申请的用途进行记录
        //模拟写入日志中
        System.out.println("purpose :" + purpose + "|username :" + username);

        if (type.equals("Phone")) {
            if (purpose.equals("register")) {
                if (iUserSerivce.CheckTel(username) != null) {
                    Integer flag = iUserSerivce.CheckTel(username);
                    if (flag > 1) {
                        return "error";
                    }
                }
            }
            if (purpose.equals("login")) {
//                if (iUserSerivce.CheckTel(username) == null) {
//                    return "error";
//                }
            }
            userInfo.setPhone(username);
            //获取随机验证码
            String code = GeneratorCode.getValidationCode_4();
            System.out.println(code);
            HttpSession session = request.getSession();
            userInfo.setCode(code);

            //验证码和通行证进行链接，一同存放进对象中
            //创建session对象，并将userInfo存入session中
            session.setAttribute("userLink", userInfo);

            System.out.println("发送的验证码为：" + code);

            //获取国外及港澳台地区的区号
            String AreaCode = jsonObject.getString("AreaCode");
            //去掉用户误输入的空格
            AreaCode = AreaCode.replace(" ", "");

            System.out.println(AreaCode);
            if (!AreaCode.equals("86")) {
                username = AreaCode + username;
            }

            //调用阿里云短信服务发送验证码到用户手机
            //国内ip:60.205.210.148
            String url = "http://60.205.210.148:8787/Send?telephone=" + username + "&code=" + code + "&AreaCode=" + AreaCode;
            //String url = "http://localhost:8787/Send?telephone=" + username + "&code=" + code + "&AreaCode=" + AreaCode;

//            try {
//                SendSmsResponse response = MoblieMessageUtil.sendSms(username,code,AreaCode);
//                //SendSmsResponse response = SendMessage.doGet(url);
//                System.out.println("短信接口返回的数据----------------");
//                System.out.println("Code=" + response.getCode());
//                System.out.println("Message=" + response.getMessage());
//                System.out.println("RequestId=" + response.getRequestId());
//                System.out.println("BizId=" + response.getBizId());
//            } catch (ClientException e) {
//                e.printStackTrace();
//            }
            String req = SendMessage.doGet(url);
            //调用发送短信接口
            //System.out.println(req);
            if (req.equals("error")) {
                return "error";
            } else {
                return code;
            }

        } else if (type.equals("Mail")) {
            System.out.println("进入了Mail方法");
            if (purpose.equals("register")) {
                if (iUserSerivce.CheckMail(username) != null) {
                    Integer flag = iUserSerivce.CheckMail(username);
                    if (flag > 1) {
                        return "error";
                    }
                }
            }
            if (purpose.equals("login")) {
                if (iUserSerivce.CheckMail(username) == null) {
                    return "error";
                }
            }
            userInfo.setMail(username);
            //获取随机验证码
            String code = GeneratorCode.getValidationCode_6();
            System.out.println(code);
            HttpSession session = request.getSession();
            userInfo.setCode(code);

            //验证码和通行证进行链接，一同存放进对象中
            //创建session对象，并将userInfo存入session中
            session.setAttribute("userLink", userInfo);

            System.out.println("发送的验证码为：" + code);
            //调用邮箱发送验证码功能发送验证码到用户指定邮箱
            //String message = "<html><body>" + "<a href='https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + username + "&code=" + code + "'>https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + username + "&code=" + code + "</a>" + "</body></html>";
            String message = "<!DOCTYPE html>" +
                    "<html>" +
                    "<head>" +
                    "<meta charset=\"UTF-8\">" +
                    "<title></title>" +
                    "</head>" +
                    "<body>" +
                    "<div style='width: 100%;height: auto;'>" +
                    "<div style='width: 100%;height: 60px;'></div>" +
                    "<p>Dear user</p><p>Thank you for your registration on Epi-Aging. <br />Please click on the following link to complete your registration:</p>" +
                    "<a href='https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + username + "&code=" + code + "'>https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + username + "&code=" + code + "</a>" +
                    "<p>HKG epitherapeutics Limited<br />https://www.hkgepitherapeutics.com</p>" +
                    "<p>(+852) 2354 8297<br />info@hkgepitherapeutics.com</p><p>2019 All rights reserved</p>" +
                    "</div>" +
                    "</body>" +
                    "</html>";
            if (mailService.sendMail(message, username)) {
                return code;
            } else {
                return "error";
            }
        }
        return "error";
    }

    @RequestMapping(value = "/Userregister")
    @ResponseBody
    public Map UserRegister(@RequestBody JSONObject jsonObject) {
        /*
         * "type" : //用户选择注册方式,[phone | mail]
         * "username" : //用户输入的账号,
         * "code" : //用户输入的验证码,
         * "pwd" : //用户输入的密码,
         * "country" : //用户选择的国家
         * */
        Map<String, Object> map = new HashMap<String, Object>();

        //获取session中存放的用户填写的账户信息
        HttpSession session = request.getSession();
        UserInfo userLink = new UserInfo();
        if (session.getAttribute("userLink") != null) {
            userLink = (UserInfo) session.getAttribute("userLink");
        }

        //获取用户提交设置的密码
        String pwd = jsonObject.getString("pwd");
        userLink.setPwd(pwd);

        //获得用户选择的注册方式
        String type = jsonObject.getString("type");
        userLink.setType(type);

        //获取用户选择的国家地区
        String country = jsonObject.getString("country");
        userLink.setCountry(country);

        //获取用户传递的username
        String username = jsonObject.getString("username");

        if (type.equals("Phone")) {
            userLink.setMail(null);
            //验证用户传入的验证码和系统生成的验证码是否一致
            String code = jsonObject.getString("code");

            if (code.equals(userLink.getCode())) {
                return iUserSerivce.app_CreateUser(userLink);
            }
        } else if (type.equals("Mail")) {
            Integer flag = null;
            if (iUserSerivce.CheckMail(username) == null) {
                flag = 0;
            } else
                flag = iUserSerivce.CheckMail(username);
            //Integer flag = iUserSerivce.CheckMail(username);
            if (flag > 1) {
                map.put("msg", 501);
                return map;
            }
            userLink.setNickname(jsonObject.getString("nickname"));
            userLink.setMail(username);
            userLink.setPhone(null);
            return iUserSerivce.app_CreateUser(userLink);
        }

        map.put("msg", "请确认注册方式是否有误。");
        return map;
    }

    @RequestMapping(value = "/logout")
    @ResponseBody
    public ModelAndView UserLogout() {
        HttpSession session = request.getSession();
        session.removeAttribute("userLink");
        session.removeAttribute("userInfo");

        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/index.jsp");
        modelView.addObject("title", "Home");
        modelView.addObject("canback", false);
        return modelView;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public Map UserPwdLose(@RequestBody JSONObject jsonObject) {
        /*
         * {"type" : //输入的账户方式 -> Phone|Mail
         *  "username" : //前端传递的登陆用户名 -> 手机号码|电子邮箱
         *  "purpose" : login | register | lose | updatePwd
         *  "pwd" : //用户输入的旧密码
         *  "newPwd" : //前端传递的新密码 -> 密码
         *  "code" : //前端传递的验证码 ->验证码}
         * */
        Map<String, Object> map = new HashMap<String, Object>();

        //获取用户输入的新密码
        String newPwd = jsonObject.getString("newPwd");

        //获取用户输入的旧密码
        String pwd = jsonObject.getString("pwd");

        //获得调用该方法的用途
        String purpose = jsonObject.getString("purpose");
        if (purpose.equals("updatePwd")) {
            //获取登陆时用户的uuid 和 旧密码
            HttpSession session = request.getSession();
            UserInfo user = (UserInfo) session.getAttribute("user");

            if (pwd.equals(user.getPwd())) {
                user.setPwd(newPwd);
                if (iUserSerivce.UpdateUserPwd(user, purpose) > 0) {
                    map.put("data", "success");
                    return map;
                } else
                    map.put("msg", "修改失败!");
                return map;
            } else {
                map.put("msg", "旧密码输入错误！");
                return map;
            }

        } else if (purpose.equals("lose")) {
            //获取用户申请修改密码的方式
            String type = jsonObject.getString("type");

            //从session中取得用户需要重置账户 Phone | Mail
            HttpSession session = request.getSession();

            //创建一个用户信息对象
            UserInfo userInfo = (UserInfo) session.getAttribute("userLink");

            //根据申请修改密码的方式，对应不同的set方法
            userInfo.setPwd(newPwd);

            if (iUserSerivce.UpdateUserPwd(userInfo, purpose) > 0) {
                map.put("data", "success");
                return map;
            }

            map.put("msg", "修改失败。");
            return map;

        }

        map.put("msg", "请查看调用方式是否有误。");
        return map;
    }


    @RequestMapping(value = "/LastRegister")
    public ModelAndView toLastRegister() {
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("/WEB-INF/front/LastRegister.jsp");
        modelView.addObject("title", "You will complete the registration.");
        modelView.addObject("canback", false);
        return modelView;
    }

    @RequestMapping(value = "/CheckMail")
    public ModelAndView CheckMail(@Param("mail") String mail, @Param("code") String code) {
        ModelAndView modelView = new ModelAndView();
        if (iUserSerivce.UpdateMail(code, mail)) {
            modelView.setViewName("/WEB-INF/front/verify_success.jsp");
            return modelView;
        } else {
            modelView.setViewName("/WEB-INF/front/verify_error.jsp");
            return modelView;
        }
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

    @RequestMapping("/sendpaswd")
    public @ResponseBody
    String sendpaswd(String email) {
        String message = "";
        UserInfo user = iUserSerivce.findUserByMail(email);
        if (user != null) {
            if (user.getPwd() == null) {
                message = "Dear User: When you registered by email, you did not fill in the password.";
            } else {
                message = "Dear User:your password is:" + user.getPwd();
            }
            mailService.sendMail(message, email);
            return "success";
        } else {
            return "null";
        }

    }
}
