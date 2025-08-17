package com.example.demo.utils;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.example.demo.BookStore.BookAvailablityRequest;
import com.example.demo.audit.Audit;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendOtpEmail(String toEmail,String otp) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("Test Email from Spring Boot");
        message.setText(otp);
        message.setFrom("your_email@gmail.com");

        mailSender.send(message);
    }

    public void sendReminderEmail(Audit log){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(log.getEmail());
        message.setSubject(log.getBookname() +" is in limited stock");
        message.setText("Hey "+log.getUsername()+" Why wait any more, just order and start reading");
        message.setFrom("your_email@gmail.com");

        mailSender.send(message);
    }

    public void sendAvailabilityEmail(List<BookAvailablityRequest> requests){
        SimpleMailMessage message = new SimpleMailMessage();
        for(BookAvailablityRequest request : requests){
            message.setTo(request.getUserEmail());
            message.setSubject(request.getBookName()+" is available now");
            message.setText("Hi "+request.getUserName()+ " buy it soon before it goes out of stock again");
            message.setFrom("your_email@gmail.com");

            mailSender.send(message);
            
        }
    }
}

