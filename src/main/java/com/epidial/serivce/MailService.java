package com.epidial.serivce;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.Security;
import java.util.Date;
import java.util.Properties;


@Service
public class MailService {

    @Value("${spring.mail.fromuser}")
    private String fromuser; //读取配置文件中的参数

    @Value("${spring.mail.host}")
    private String host; //

    @Value("${spring.mail.password}")
    private String pwd;

    @Value("${spring.mail.port}")
    private String port;

    /**
     * 使用加密的方式,利用465端口进行传输邮件,开启ssl
     */

    public String sendMail(String title, String message, String toMail) {
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
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
            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromuser, pwd);
                }
            });
            //通过会话,得到一个邮件,用于发送
            Message msg = new MimeMessage(session);
            //设置发件人
            msg.setFrom(new InternetAddress(fromuser));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));//一个收件人
            msg.setSubject(title);
            //设置邮件消息
            //msg.setText(message);
            msg.setContent(message, "text/html;charset = utf-8");
            //设置发送的日期
            msg.setSentDate(new Date());
            //调用Transport的send方法去发送邮件
            Transport.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        System.out.println("Send success!");
        return "success";
    }
}
