package com.project.reviewquest.donation;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class DonationEmail {
	@Autowired
		@Resource(name = "mailSender")
		private JavaMailSender mailSender;
	
	public void sendEmail(String to, String subject, String text) throws MessagingException{
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        helper.setFrom("reviewquest");
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(text, true);
        mailSender.send(message);
    }
	
	public void sendEmailFromRedirectPage(String nickname, int amount, String email, 
    		HttpServletRequest request, String title) {
    		
        try {
            String subject = "기부 인증서입니다.";
            String filePath = request.getServletContext().getRealPath("/WEB-INF/views/donation/email.html");
            String body = readHtmlFile(filePath);

            // 이메일 내용에 nickname과 amount를 추가
            body = body.replace("{{nickname}}", nickname);
            body = body.replace("{{title}}", title);
            body = body.replace("{{amount}}", String.valueOf(amount));

            // 이메일을 보내는 코드
            sendEmail(email, subject, body);
        } catch (Exception e) {
            // 이메일 보내기 실패 처리
            e.printStackTrace();
        }
    }
	
	public String readHtmlFile(String filePath) throws IOException {
        StringBuilder content = new StringBuilder();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                content.append(line).append("\n");
            }
        }

        return content.toString();
    }
}
