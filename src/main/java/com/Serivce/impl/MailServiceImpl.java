package com.Serivce.impl;

import com.Serivce.MailService;
import com.Utils.CodeUtils;
import com.Utils.DESUtil;
import com.sun.org.apache.xml.internal.serializer.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
    //private static final String key = "k@hkgepitherapeutics.com";

    @Autowired
    private JavaMailSender mailSender; //自动注入的Bean

    @Value("${spring.mail.username}")
    private  String Sender; //读取配置文件中的参数

    @Value("${spring.mail.host}")
    private String host; //

    @Value("${spring.mail.password}")
    private String pwd;

   final String smtpPort = "465";

//    @Override
//    public boolean sendMail(String username, String code) {
//        System.out.println("Sending....");
//        //密钥
//        String key = "it@hkgepitherapeutics.com";
//        //使用MimeMessage，MIME协议
//        MimeMessage message = mailSender.createMimeMessage();
//        MimeMessageHelper helper;
//        //username 为目标邮箱
//        String mail = DESUtil.encrypt(username , key);
//        //code 为用户的uuid
//        String uuid = DESUtil.encrypt(code , key);
//
//        //MimeMessageHelper帮助我们设置更丰富的内容
//        try {
//            helper = new MimeMessageHelper(message, true);
//            helper.setFrom(Sender);
//            helper.setTo(username);
//            helper.setSubject("[DO NOT REPLY] Epi-Aging verification email");
//            helper.setText("<html><body>" +
//                    "<a href='https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + mail + "&code=" + uuid + "'>https://app.beijingepidial.com?mail=" + mail + "&code=" + uuid + "</a>" +
//                    "</body></html>", true);//true代表支持html
//            mailSender.send(message);
//        } catch (MessagingException e) {
//            e.printStackTrace();
//            return false;
//        }
//        System.out.println("Send Success!");
//        return true;
//    }

    /**
     * 使用加密的方式,利用465端口进行传输邮件,开启ssl
     */

    public boolean sendMail(String username,String code) {
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        final String username1 = Sender;
        final String password = pwd;

        //为保证不泄露，进行加密传输
        String mail = CodeUtils.encodeStr(username);
        String uuid = CodeUtils.encodeStr(code);

//        String mail = "";
//        String uuid = "";
        //System.out.println("加密密钥 : " + key);
        //username 为目标邮箱
//        try {
//            mail = URLEncoder.encode(DESUtil.encrypt(username , key) , "utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//            System.out.println("UrlEncode mail error!");
//        }
//        byte[] array = username.getBytes(); //获取字符数组
//        for(int i=0;i<array.length;i++) //遍历字符数组
//        {
//            array[i]=(byte)(array[i]^20000); //对每个数组元素进行异或运算
//        }
//        try {
//            mail = URLEncoder.encode(array.toString() , "utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        //mail = mail.replace("\\+" , "%20");
        //System.out.println("mail :" + mail);
        //code 为用户的uuid
//        try {
//            uuid = URLEncoder.encode(DESUtil.encrypt(code , key) , "utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//            System.out.println("UrlEncode uuid error!");
//        }
//        array = code.getBytes(); //获取字符数组
//        for(int i=0;i<array.length;i++) //遍历字符数组
//        {
//            array[i]=(byte)(array[i]^20000); //对每个数组元素进行异或运算
//        }
//        try {
//            uuid = URLEncoder.encode(array.toString() , "utf-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        //System.out.println("code :" + uuid);
        String message = "<html><body>" +
                "<a href='https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + mail + "&code=" + uuid + "'>https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + mail + "&code=" + uuid + "</a>" +
                "</body></html>";

        //设置邮件会话参数
        Properties props = new Properties();
        //邮箱的发送服务器地址
        props.setProperty("mail.smtp.host", "smtp.163.com");
        props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        //邮箱发送服务器端口,这里设置为465端口
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.auth", "true");

        try {
            Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            //获取到邮箱会话,利用匿名内部类的方式,将发送者邮箱用户名和密码授权给jvm
            Session session = Session.getDefaultInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username1, password);
                }
            });
            //通过会话,得到一个邮件,用于发送
            Message msg = new MimeMessage(session);
            //设置发件人
            msg.setFrom(new InternetAddress(Sender));
            //设置收件人,to为收件人,cc为抄送,bcc为密送
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(username, false));
//            msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(username, false));
//            msg.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(username, false));
            msg.setSubject("[DO NOT REPLY] Epi-Aging verification email");
            //设置邮件消息
            //msg.setText(message);
            msg.setContent(message , "text/html;charset = gbk");
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
