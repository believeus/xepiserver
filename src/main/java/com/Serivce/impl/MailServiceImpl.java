package com.Serivce.impl;

import com.Serivce.MailService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.Security;
import java.util.Date;
import java.util.Properties;

/**
 * @ CreateDate : Create in 12:46 2019/4/18
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Service
public class MailServiceImpl implements MailService {

    @Value("${spring.mail.fromuser}")
    private  String fromuser; //读取配置文件中的参数

    @Value("${spring.mail.host}")
    private String host; //

    @Value("${spring.mail.password}")
    private String pwd;

    @Value("${spring.mail.port}")
    private String port;

    /**
     * 使用加密的方式,利用465端口进行传输邮件,开启ssl
     */

    public boolean sendMail(String usermail,String uuid) {
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        String message = "<html><body>" + "<a href='https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + usermail + "&code=" + uuid + "'>https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + usermail + "&code=" + uuid + "</a>" + "</body></html>";
        //设置邮件会话参数
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.auth", "true");
        try {
            Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            //获取到邮箱会话,利用匿名内部类的方式,将发送者邮箱用户名和密码授权给jvm
            Session session = Session.getInstance(props, new Authenticator()
            {
                protected PasswordAuthentication getPasswordAuthentication()
                {
                    return new PasswordAuthentication(fromuser, pwd);
                }
            });
            //通过会话,得到一个邮件,用于发送
            Message msg = new MimeMessage(session);
            //设置发件人
            msg.setFrom(new InternetAddress(fromuser));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(usermail));//一个收件人
            msg.setSubject("[DO NOT REPLY] Epi-Aging verification email");
            //设置邮件消息
            //msg.setText(message);
            msg.setContent(message , "text/html;charset = utf-8");
            //设置发送的日期
            msg.setSentDate(new Date());
            //调用Transport的send方法去发送邮件
            Transport.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        System.out.println("Send success!");
    return true;
    }
}
