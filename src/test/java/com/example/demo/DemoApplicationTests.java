package com.example.demo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Async;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

    @Test
    public void contextLoads() {
        System.out.println("Test satrt!");
    }

//    @Autowired
//    private JavaMailSender mailSender; //自动注入的Bean
//
//    @Value("${spring.mail.username}")
//    private String Sender; //读取配置文件中的参数
//
//    @Test
//    public void sendSimpleMail() throws Exception {
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setFrom(Sender);
//        message.setTo(Sender); //自己给自己发送邮件
//        message.setSubject("主题：简单邮件");
//        message.setText("测试邮件内容");
//        mailSender.send(message);
//    }
//    @Test
//    public void sendMail() throws Exception {
//        mailSender.send(new MimeMessagePreparator() {
//            @Override
//            public void prepare(MimeMessage mimeMessage) throws Exception {
//                    /*setRecipient（Message.RecipientType type, Address address），
//            用于设置邮件的接收者。有两个参数，第一个参数是接收者的类型，第二个参数是接收者。
//            接收者类型可以是Message.RecipientType.TO，Message.RecipientType.CC和Message.RecipientType.BCC，
//            TO表示主要接收人，CC表示抄送人，BCC表示秘密抄送人。接收者与发送者一样，通常使用InternetAddress的对象。*/
//                mimeMessage.setRecipient(Message.RecipientType.TO,
//                        new InternetAddress("目标邮箱的地址"));
//                mimeMessage.setFrom(new InternetAddress(Sender));
//                mimeMessage.setText("test");
//            }
//        });
//    }
}

