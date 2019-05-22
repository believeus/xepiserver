package com.Serivce;

import com.Bean.Address;
import com.Bean.User;
import com.Bean.UserInfo;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
public interface IUserSerivce {
    public List<User> getUser();

    /**
     *
     * 功能描述: 根据openid检查用户情况（若无openid->没有进行微信授权操作）
     *
     * @param openid
     * @return: Integer
     * @auther: Eestill
     * @date: 2019/2/26 14:07
     */
    public String CheckStatus(String openid);

    /**
     *
     * 功能描述: 后台自动分配id给用户，并把用户的wxopenid存入数据库当中
     * @auther: Eestill
     * @date: 2019/2/26 14:53
     * @param openid
     */
    public String getUserId_CreateUser(String openid);

    /**
     *
     * 功能描述: 用于处理app用户提交的注册申请
     * @author: Eestill
     * @date: 2019/3/7 16:06
     * @param userInfo
     */
    public Map app_CreateUser(UserInfo userInfo);

    /**
     *
     * 功能描述: 根据用户所选择的登陆方式进行登陆
     * @author: Eestill
     * @date: 2019/3/8 8:45
     * @param userInfo
     */
    public User LoginUser(UserInfo userInfo);

    /**
     *
     * 功能描述: 用户进行密码修改 | 密码找回
     * @author: Eestill
     * @date: 2019/3/11 14:30
     * @param userInfo
     */
    public int UpdateUserPwd(UserInfo userInfo,String purpose);


    public String getPwd(String uuid);

    /**
     *
     * 功能描述: 用户进行地址的添加
     * @author: Eestill
     * @date: 2019/3/12 20:54
     * @param address
     */
    public int AddAddress(Address address);


    /**
     *
     * 功能描述: 用户进行现有地址的更新
     * @author: Eestill
     * @date: 2019/3/12 20:55
     * @param address
     */
    public int UpdateAddress(Address address);


    //检查输入的电话号码是否被注册
    public Integer CheckTel(String phone);

    //检查输入的电子邮箱是否被注册
    public Integer CheckMail(String mail);

    //更改用户授权情况
    public boolean UpdateMail(String uuid , String mail);

    public UserInfo findUserByMail(String mail);
}
