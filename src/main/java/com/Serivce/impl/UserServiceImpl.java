package com.Serivce.impl;

import com.Bean.Address;
import com.Bean.User;
import com.Bean.UserInfo;
import com.Dao.Info.IUserDao;
import com.Serivce.IUserSerivce;
import com.Serivce.MailService;
import com.Utils.UserCreate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @ CreateDate : Create in 11:30 2019/2/26
 * @ Explain :
 * @ UpdateDate : Update in
 */
@Service(value = "UserService")
@Component
public class UserServiceImpl implements IUserSerivce {

    @Resource
    private IUserDao userDao;

    @Autowired
    private HttpServletRequest request;

    @Resource
    private MailService mailService;

    @Override
    public List<User> getUser() {
        List<User> list = new ArrayList<User>();
        list.add(userDao.getUser());
        return list;
    }

    @Override
    public String CheckStatus(String openid) {
        String uuid = null;

        try {
            uuid = userDao.get_userid(openid);
        }catch (NullPointerException e){
            System.out.println("openid ：" + openid + "未创建用户");
        }
        return uuid;
    }

    @Override
    public String getUserId_CreateUser(String openid) {
        String uuid = "";
        try {
            uuid = userDao.get_userid(openid);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

        if (uuid == null) {
            uuid = new UserCreate().getUuid();

            if (userDao.wx_createUser(uuid, openid) == 1) {
                System.out.println("用户创建成功");
            } else
                System.out.println("用户创建失败");
        }
        return uuid;
    }

    @Override
    public Map app_CreateUser(UserInfo userCreat) {
        Map<String , Object> map = new HashMap<String , Object>();
        //系统自动生成唯一id
        String uuid = UserCreate.getUuid();

        userCreat.setUuid(uuid);
        System.out.println(userCreat.toString());

        //对用户表进行创建
        int i = userDao.app_createUser(userCreat);

        //如果是邮箱用户，发送点击验证
        if (userCreat.getType().equals("Mail")){
           // String message = "<html><body>" + "<a href='https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + userCreat.getMail() + "&code=" + uuid + "'>https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + userCreat.getMail() + "&code=" + uuid + "</a>" + "</body></html>";
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
                    "<a href='https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + userCreat.getMail() + "&code=" + uuid + "'>https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + userCreat.getMail() + "&code=" + uuid + "</a>" +
                    "<p>HKG epitherapeutics Limited<br />https://www.hkgepitherapeutics.com</p>" +
                    "<p>(+852) 2354 8297<br />info@hkgepitherapeutics.com</p><p>2019 All rights reserved</p>" +
                    "</div>" +
                    "</body>" +
                    "</html>";
            mailService.sendMail(message,userCreat.getMail());
        }

        if (i == 1){
            User user = new User();
            user.setUuid(uuid);

            //设置用户默认初始值
            user.setNickName(userCreat.getNickname());
            user.setGender("0");
            user.setAvatarUrls("static/images/user-logo.png");
            user.setCountry(userCreat.getCountry());

            if (userDao.Init_UserInfo(user) == 1){
                map.put("data" , user);
                return map;
            }
            else {
                map.put("msg" , "创建信息失败，请联系管理员");
            }
        }else {
            map.put("msg" , "用户注册失败，请联系管理员");
            return map;
        }
        map.put("msg" , "用户创建失败，请联系管理员。");
        return map;
    }

    @Override
    public User LoginUser(UserInfo userInfo) {
        User user = userDao.app_LoginUser(userInfo);

        System.out.println(user);

        return user;
    }

    public int UpdateUserPwd(UserInfo userInfo,String purpose){
        //用户找回密码，即根据已绑定信息重置验证码
        if (purpose.equals("lose")){
            return userDao.app_UserPwdLose(userInfo);
        }
        //用户根据旧密码修改密码
        if (purpose.equals("updatePwd")){
            return userDao.app_UserUpdatePwd(userInfo);
        }

        return 0;
    }

    @Override
    public String getPwd(String uuid) {
        return userDao.getPwd(uuid);
    }

    //信息修改模块
    //更新地址
    public int UpdateAddress(Address address){
        //补全对象传递的数据
        HttpSession session = request.getSession();
        User userInfo = (User)session.getAttribute("userInfo");
        address.setUuid(userInfo.getUuid());

        return userDao.UpdateAddress(address);

    }

    //新增地址
    public int AddAddress(Address address){
        //补全对象传递的数据
        HttpSession session = request.getSession();
        User userInfo = (User)session.getAttribute("userInfo");
        address.setUuid(userInfo.getUuid());

        return userDao.InsertAddress(address);

    }

    @Override
    public Integer CheckTel(String phone) {
        return userDao.CheckTel(phone);
    }

    @Override
    public Integer CheckMail(String mail) {
        return userDao.CheckMail(mail);
    }

    @Override
    public boolean UpdateMail(String uuid, String mail) {
        if (userDao.UpdateMail(uuid, mail) == 1){
            return true;
        }
        return false;
    }

    @Override
    public UserInfo findUserByMail(String mail) {
        UserInfo user = userDao.findUserByMail(mail);
        return user;
    }
}
