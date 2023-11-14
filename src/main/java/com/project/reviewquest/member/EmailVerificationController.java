package com.project.reviewquest.member;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmailVerificationController {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private EmailDTO emailDTO;
	
	
	/*이메일 인증중*/
	public void sendEmail(String to, String subject, String text) throws MessagingException{
    MimeMessage message = mailSender.createMimeMessage();
    MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
    helper.setFrom("reviewquest");
    helper.setTo(to);
    helper.setSubject(subject);
    helper.setText(text, true);
    mailSender.send(message);
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
    
    
    public String generateVerificationCode() {
        // 사용할 문자셋
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        SecureRandom secureRandom = new SecureRandom();
        StringBuilder code = new StringBuilder(15); // 8자리 코드 생성
        for (int i = 0; i < 15; i++) {
            int randomIndex = secureRandom.nextInt(characters.length());
            char randomChar = characters.charAt(randomIndex);
            code.append(randomChar);
        }
        return code.toString();
    }

    

    @RequestMapping(value = "/sendEmailVerification", method = RequestMethod.POST, consumes = "application/json", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String sendEmailForRegistration(@RequestBody Map<String, String> requestData, HttpServletRequest request) {
        System.out.println("컨트롤러에 sendEmailVerification 도착");     
    	try {
			
			  String email = requestData.get("email");
			  String division = requestData.get("division");
			  System.out.println("email : " +email);
			  System.out.println("division : " +division);
			  String subject = "회원가입 이메일 확인";
			 String filePath = request.getServletContext().getRealPath("/WEB-INF/views/member_view/EmailVerification.html");
			 String body = readHtmlFile(filePath);
			 

			 // 이메일 내용에 division 값을 추가
		        String divisionPlaceholder = "{{division}}"; // 템플릿 내의 플레이스홀더
		        body = body.replace(divisionPlaceholder, division);
		        
		        
		        // 인증 코드 생성
		        String verificationCode= generateVerificationCode();

		        System.out.println("전역변수 확인 ; "+verificationCode);
		        
		     // EmailDTO에 데이터 설정
	            emailDTO.setEmail(email);
	            emailDTO.setVerificationcode(verificationCode);
	            
	            System.out.println("dao 가기 전 확인");
	            System.out.println(emailDTO.getEmail());
	            System.out.println(emailDTO.getVerificationcode());
	            
	            // DAO를 사용하여 데이터베이스에 저장
	            memberDAO.saveVerificationCode(emailDTO);
    
		        // 이메일 템플릿에 인증 코드를 추가
		        String verificationCodePlaceholder = "{{verificationCode}}"; // 템플릿 내의 인증 코드 플레이스홀더
		        body = body.replace(verificationCodePlaceholder, verificationCode);
		        
            // 회원가입 이메일 전송 코드
            // 여기에 인증 링크를 생성하고 이메일 내용에 추가하는 로직을 추가해야 합니다.
		       sendEmail(email, subject, body);
		       
		       return "이메일이 전송되었습니다. 인증 링크를 입력해주세요.";
        } catch (Exception e) {
            // 이메일 보내기 실패 처리
            e.printStackTrace();
            return "이메일 전송에 실패했습니다.";
        }
    }
    
    
    
    
    
    @RequestMapping(value = "/verifyEmailCode", method = RequestMethod.POST, consumes = "application/json", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String verifyEmailCode(@RequestBody Map<String, String> requestData) throws Exception {
        // ...
    	System.out.println("verifyEmailCode 도착");
    	
    	String email = requestData.get("email");
    	String code = requestData.get("code");

		System.out.println(email);
		System.out.println(code);

		emailDTO.setEmail(email);
		emailDTO.setVerificationcode(code);
		
		int result = memberDAO.confirm_Verificationcode(emailDTO);
		System.out.println("결과값 : "+result);
		
		
		 if (result == 1) {
	            return "인증이 완료되었습니다"; // 중복된 경우 메시지 반환
	        } 
	     return "인증번호를 다시 확인해주세요"; // 중복되지 않은 경우 메시지 반환
	        
		 
    }
}
