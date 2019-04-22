package com.Serivce.impl;

import com.Serivce.MailService;
import com.Utils.DESUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.MailMessage;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * @ CreateDate : Create in 12:46 2019/4/18
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Service
public class MailServiceImpl implements MailService {
    @Autowired
    private JavaMailSender mailSender; //自动注入的Bean

    @Value("${spring.mail.username}")
    private  String Sender; //读取配置文件中的参数

    @Override
    public boolean sendMail(String username, String code) {
//        try {
//            System.out.println("Sending....");
//            //密钥
//            String key = "it@hkgepitherapeutics.com";
//            MailMessage message = mailSender.createMimeMessage();
//            message.setFrom(Sender);
//            message.setTo(username); //目标邮箱
//            message.setSubject("[DO NOT REPLY] Epi-Aging verification email");
//            //username 为目标邮箱
//            String mail = DESUtil.encrypt(username , key);
//            //code 为用户的uuid
//            String uuid = DESUtil.encrypt(code , key);
//
//            StringBuffer sb = new StringBuffer();
//            sb.append("<h1>大标题-h1</h1>")
//                    .append("<a>http://localhost:8080/App/CheckMail.jhtml?mail=\" + mail + \"&code=\" + uuid + \"</a>")
//                    .append("<p style='text-align:right'>右对齐</p>");
//            message.setText(sb.toString() , true);
//
////            message.setText("<html><body>" +
////                    "<a href='http://localhost:8080/App/CheckMail.jhtml?mail=\'" + mail + "&code=" + uuid + "'>http://localhost:8080/App/CheckMail.jhtml?mail=" + mail + "&code=" + uuid + "</a>" +
////                    "</body></html>");
//            mailSender.send(message);
//        } catch (MailException e) {
//            e.printStackTrace();
//            return false;
//        }
        System.out.println("Sending....");
        //密钥
        String key = "it@hkgepitherapeutics.com";
        //使用MimeMessage，MIME协议
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper;
        //username 为目标邮箱
        String mail = DESUtil.encrypt(username , key);
        //code 为用户的uuid
        String uuid = DESUtil.encrypt(code , key);

        //MimeMessageHelper帮助我们设置更丰富的内容
        try {
            helper = new MimeMessageHelper(message, true);
            helper.setFrom(Sender);
            helper.setTo(username);
            helper.setSubject("[DO NOT REPLY] Epi-Aging verification email");
            helper.setText("<html><body>" +
                    "<a href='https://app.beijingepidial.com/App/CheckMail.jhtml?mail=" + mail + "&code=" + uuid + "'>http://localhost:8080/App/CheckMail.jhtml?mail=" + mail + "&code=" + uuid + "</a>" +
                    "</body></html>", true);//true代表支持html
            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
        System.out.println("Send Success!");
        return true;
    }
}
