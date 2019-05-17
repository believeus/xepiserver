package com.Dao.Info;

import com.Bean.Address;
import com.Bean.JsonOrderBean;
import com.Bean.User;
import com.Bean.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

@Mapper
public interface IUserDao {
    /**
     *
     * 功能描述: 测试方法
     *
     * @param:
     * @return:
     * @auther: Eestill
     * @date: 2019/2/26 13:30
     */
    public User getUser();

    /**
     *
     * 功能描述: 用于获取user_id
     *
     * @param:  String
     * @return: Integer
     * @auther: Eestill
     * @date: 2019/2/26 13:52
     */
    public String get_userid(@Param("wx_openid") String wx_openid);

    /**
     *
     * 功能描述: 用于微信用户创建用户
     *
     * @param uuid
     * @param openid
     * @return: 状态码
     * @auther: Eestill
     * @date: 2019/2/26 13:41
     */
    public int wx_createUser(@Param("uuid") String uuid,
                             @Param("wx_openid") String openid);

    /**
     *
     * 功能描述: 根据邮箱/手机号 来进行用户的创建
     * @author: Eestill
     * @date: 2019/3/7 16:33
     * @param userInfo
     */
    public int app_createUser(@Param("userInfo")UserInfo userInfo);

    /**
     *
     * 功能描述:
     * @author: Eestill
     * @date: 2019/3/7 19:48
     * @param userInfo
     */
    public User app_LoginUser(@Param("userInfo")UserInfo userInfo);

    /**
     *
     * 功能描述: 根据用户注册时，uuid进行数据初始化
     * @author: Eestill
     * @date: 2019/3/7 16:34
     * @param user
     */
    public int Init_UserInfo(@Param("user")User user);

    /**
     *
     * 功能描述: 通过验证后，根据用户提交的新密码进行密码修改
     * @author: Eestill
     * @date: 2019/3/11 13:58
     * @param userLink
     */
    public int app_UserPwdLose(@Param("userLink")UserInfo userLink);

    /**
     *
     * 功能描述: 用户修改密码
     * @author: Eestill
     * @date: 2019/3/11 14:14
     * @param userInfo
     */
    public int app_UserUpdatePwd(@Param("userInfo")UserInfo userInfo);

    /**
     *
     * 功能描述: 当用户用验证码登陆后自动查询用户密码，存放进对象中，用于后期功能的使用
     * @author: Eestill
     * @date: 2019/3/12 16:55
     * @param uuid
     */
    public String getPwd(String uuid);

    //暂时废弃方法
    public int UpdateAddress(@Param("address") Address address);

    public int InsertAddress(@Param("address") Address address);

    public int deleteAddress(@Param("address") Address address);

    //end

    //根据用户填写的地址信息
    //public int InsertNewAddress(@Param("map")Map map);
    public int InsertNewAddress(@Param("data")JsonOrderBean data);

    //临时用于获得主键
    public Integer getKey(@Param("uuid")String uuid);

    //检查填写的账户是否已经注册
    public Integer CheckTel(@Param("phone") String phone);

    //检查填写的账户是否已经注册
    public Integer CheckMail(@Param("mail") String mail);

    //更改用户邮箱授权状况
    public Integer UpdateMail(@Param("uuid")String uuid , @Param("mail")String mail);
}
