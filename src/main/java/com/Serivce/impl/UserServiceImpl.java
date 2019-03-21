package com.Serivce.impl;

import com.Bean.Address;
import com.Bean.User;
import com.Bean.UserInfo;
import com.Dao.IUserDao;
import com.Serivce.IUserSerivce;
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

        if (i == 1){
            User user = new User();
            user.setUuid(uuid);


            //设置用户默认初始值
            user.setNickName("user");
            user.setGender("0");
            user.setAvatarUrls("http://47.75.111.0/data/image/UserInfo/default.jpg");

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
    public int CheckTel(String phone) {
        return userDao.CheckTel(phone);
    }
}
