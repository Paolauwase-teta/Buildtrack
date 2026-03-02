package com.example.constructionmis.util;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class EmailUtil {
    public static void sendEmail(String toEmail, String subject, String message) {
        String fromEmail = "paolauwase555@gmail.com";
        String appPassword = "fxtn qcku vplm svmd";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromEmail, appPassword);
                    }
                });

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(fromEmail));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            msg.setSubject(subject);
            msg.setText(message);

            Transport.send(msg);
            System.out.println("Email successfully sent to: " + toEmail);
        } catch (MessagingException e) {
            e.printStackTrace();
            throw new RuntimeException("Email sending failed: " + e.getMessage());
        }
    }
}
