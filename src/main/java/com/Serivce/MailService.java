package com.Serivce;

import org.springframework.stereotype.Component;

@Component
public interface MailService {

    public boolean sendMail(String username , String code);
}