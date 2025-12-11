package com.quizpro.util;

import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailUtil {

    private static final String FROM_EMAIL = "kanipakamchaithanya76@gmail.com";
    private static final String APP_PASSWORD = "zein weya mpah qkey";

    public static void sendOtp(String to, int otp) {
        String subject = "Your OTP Code";
        String html = getOtpTemplate(otp);
        sendMail(to, subject, html);
    }

    public static void sendSuccessMail(String to) {
        String subject = "Registration Successful";
        String html = getSuccessTemplate();
        sendMail(to, subject, html);
    }

    public static void sendMail(String to, String subject, String htmlContent) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, APP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setContent(htmlContent, "text/html; charset=utf-8");
            Transport.send(message);
            System.out.println("HTML Mail Sent Successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static String getOtpTemplate(int otp) {
        return String.format("""
            <div style='font-family: Arial, sans-serif; padding: 20px; background: #f4f6f8;'>
                <div style='max-width: 500px; margin: auto; background: white; padding: 25px; 
                            border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);'>
                    <h2 style='text-align: center; color: #4a90e2;'>QuizPro OTP Verification</h2>
                    <p style='font-size: 16px; color: #333;'>Your OTP is:</p>
                    <h1 style='text-align: center; font-size: 40px; 
                               letter-spacing: 5px; color: #2d3436;'>%06d</h1>
                    <p style='font-size: 16px; color: #333; text-align:center;'>
                        Valid for <b>2 minutes</b>.
                    </p>
                </div>
            </div>
            """, otp);
    }

    public static String getSuccessTemplate() {
        return """
            <div style='font-family: Arial, sans-serif; padding: 20px; background: #f4f6f8;'>
                <div style='max-width: 500px; margin: auto; background: #ffffff; padding: 25px; 
                            border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);'>
                    <h2 style='text-align: center; color: #2ecc71;'>Registration Successful 🎉</h2>
                    <p style='font-size: 16px; color: #333;'>
                        Your QuizPro account has been successfully created.
                    </p>
                    <div style='text-align:center; margin-top: 20px;'>
                        <a href='http://localhost:8080/QuizPro/login.jsp'
                           style='background:#2ecc71; color:white; padding:10px 18px; 
                                  text-decoration:none; border-radius:6px;'>
                            Login Now
                        </a>
                    </div>
                </div>
            </div>
            """;
    }
}
