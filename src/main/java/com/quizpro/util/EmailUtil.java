package com.quizpro.util;

import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailUtil {

	private static final String FROM_EMAIL = "quizpro.org@gmail.com";
	private static final String APP_PASSWORD = "pien sjzi ksxh xepi";

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
	
	public static void sendCompleteMail(String to) {
		String subject = "Test Completed Successfully";
		String html = getTestCompleteTemplate();
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
				            <div style="font-family: Arial, sans-serif; background:#eef2f7; padding:25px;">
				    <div style="
				        max-width:520px;
				        margin:auto;
				        background:white;
				        padding:30px;
				        border-radius:15px;
				        box-shadow:0 6px 20px rgba(0,0,0,0.12);
				        border-top:6px solid #4A90E2;
				    ">

				        <!-- Header -->
				        <div style="
				            text-align:center;
				            padding-bottom:15px;
				            border-bottom:1px solid #e5e5e5;
				        ">
				            <h2 style="
				                margin:0;
				                font-size:26px;
				                color:#4A90E2;
				                font-weight:700;
				            ">
				                🔐 QuizPro Verification
				            </h2>
				            <p style="color:#555; margin-top:5px; font-size:14px;">
				                Secure One-Time Password (OTP)
				            </p>
				        </div>

				        <!-- Message -->
				        <p style="font-size:16px; color:#333; margin-top:25px;">
				            Hello User,
				        </p>
				        <p style="font-size:16px; color:#444;">
				            Use the verification code below to complete your action:
				        </p>

				        <!-- OTP Box -->
				        <div style="
				            text-align:center;
				            background:#f7f9fc;
				            padding:20px;
				            border-radius:10px;
				            margin:25px 0;
				            border:1px solid #e0e6ed;
				        ">
				            <span style="
				                font-size:42px;
				                font-weight:bold;
				                color:#2d3436;
				                letter-spacing:10px;
				            ">
				                %06d
				            </span>
				        </div>

				        <!-- Footer Info -->
				        <p style="font-size:15px; color:#333; text-align:center;">
				            This code is valid for <b>2 minutes</b><br>
				            Please do not share it with anyone.
				        </p>

				        <p style="font-size:13px; color:#888; text-align:center; margin-top:20px;">
				            If you did not request this code, simply ignore this email.
				        </p>

				    </div>
				</div>

				            """, otp);
	}

	public static String getSuccessTemplate() {
		return """
								<div style="font-family: Arial, sans-serif; background:#eef2f7; padding:25px;">
				    <div style="
				        max-width:520px;
				        margin:auto;
				        background:white;
				        padding:30px;
				        border-radius:15px;
				        box-shadow:0 6px 20px rgba(0,0,0,0.12);
				        border-top:6px solid #2ecc71;
				    ">

				        <!-- Header -->
				        <div style="text-align:center; padding-bottom:15px; border-bottom:1px solid #e5e5e5;">
				            <h2 style="
				                margin:0;
				                font-size:26px;
				                color:#2ecc71;
				                font-weight:700;
				            ">
				                🎉 Registration Successful!
				            </h2>
				            <p style="color:#555; margin-top:5px; font-size:14px;">
				                Welcome to QuizPro – Your learning journey starts now.
				            </p>
				        </div>

				        <!-- Body -->
				        <p style="font-size:16px; color:#333; margin-top:25px;">
				            Hello,
				        </p>

				        <p style="font-size:16px; color:#444;">
				            Your QuizPro account has been created successfully.
				            You can now log in and start attempting quizzes.
				        </p>

				        <!-- Success Icon -->
				        <div style="text-align:center; margin:25px 0;">
				            <div style="
				                display:inline-block;
				                background:#e9f9f0;
				                padding:18px;
				                border-radius:50%;
				                border:2px solid #2ecc71;
				            ">
				                <span style="font-size:32px; color:#2ecc71;">✔</span>
				            </div>
				        </div>

				        <!-- Button -->
				        <div style="text-align:center; margin-top:20px;">
				            <a href="http://localhost:8080/QuizPro/login.jsp"
				                style="
				                    background:#2ecc71;
				                    color:white;
				                    padding:12px 22px;
				                    text-decoration:none;
				                    border-radius:8px;
				                    font-size:16px;
				                    font-weight:bold;
				                    box-shadow:0 3px 10px rgba(0,0,0,0.1);
				                    display:inline-block;
				                ">
				                Login Now
				            </a>
				        </div>

				        <!-- Footer -->
				        <p style="font-size:13px; color:#888; text-align:center; margin-top:25px;">
				            If you did not create this account, please ignore this email.
				        </p>

				    </div>
				</div>

								""";
	}

	public static String getTestCompleteTemplate() {
		return """
								<div style="font-family: Arial, sans-serif; background:#eef2f7; padding:25px;">
				    <div style="
				        max-width:520px;
				        margin:auto;
				        background:white;
				        padding:30px;
				        border-radius:15px;
				        box-shadow:0 6px 20px rgba(0,0,0,0.12);
				        border-top:6px solid #4A90E2;
				    ">

				        <!-- Header -->
				        <div style="text-align:center; padding-bottom:15px; border-bottom:1px solid #e5e5e5;">
				            <h2 style="
				                margin:0;
				                font-size:26px;
				                color:#4A90E2;
				                font-weight:700;
				            ">
				                🎉 Test Completed Successfully!
				            </h2>
				            <p style="color:#555; margin-top:5px; font-size:14px;">
				                Your QuizPro test has been submitted.
				            </p>
				        </div>

				        <!-- Body -->
				        <p style="font-size:16px; color:#333; margin-top:25px;">
				            Hello,
				        </p>

				        <p style="font-size:16px; color:#444;">
				            You have successfully completed the test.
				            You can check your score by login in to the portal and download the certificate from there.
				        </p>
				        
				        <p style="font-size:14px; color:#444;">
				            Thanks for using QuizPro
				        </p>

				        <!-- Footer -->
				        <p style="font-size:13px; color:#888; text-align:center; margin-top:25px;">
				            If you did not take this test, please ignore this email.
				        </p>

				    </div>
				</div>

								""";
	}
}
