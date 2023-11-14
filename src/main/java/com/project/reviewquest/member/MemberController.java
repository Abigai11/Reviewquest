package com.project.reviewquest.member;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller("MemberController")
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MemberService memberService;
	@Autowired
	private InfluencerDTO influencerDTO;
	@Autowired
	private CompanyDTO companyDTO;
	@Autowired
	private ServletContext servletContext;

	
	
	/*회원가입*/
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView MemberJoin(@ModelAttribute("influencerDTO") InfluencerDTO influencerDTO,
									@ModelAttribute("companyDTO") CompanyDTO companyDTO,
									@RequestParam("division") String division,
									@RequestParam("id") String id,
									@RequestParam("photo") MultipartFile profilephoto,
									HttpServletRequest request
									) throws Exception {

			System.out.println("member/join 도착");
			System.out.println(division);
			System.out.println(id);
			

            
            	 if (!profilephoto.isEmpty()) {
            	        
			            String originalFilename = profilephoto.getOriginalFilename();
			            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));//확장자 추출
			            String uploadPath = request.getServletContext().getRealPath("/resources/images/profilephoto");//경로
			            					
			            String uniqueFileName = File.separator+division +File.separator+ id+fileExtension;//파일 이름+확장자
			            String filePath = uploadPath + uniqueFileName;
			            File uploadDirectory = new File(uploadPath);
			            
			            if (!uploadDirectory.exists()) {
			                uploadDirectory.mkdirs(); // 디렉토리 생성
			            }
			      
			            try {
			                // 파일 저장
			            	profilephoto.transferTo(new File(filePath));
			                // 파일 경로 또는 파일 이름을 DTO에 설정
			            	System.out.println(filePath);
			            	
			            	switch (division)
			    			{
			    		       case "influencer":
			    		       {
			    		    	   System.out.println("division 확인 인플루언서 : "+influencerDTO.getDivision());
			    		    	   influencerDTO.setProfilephoto(uniqueFileName); 
			    		    	   memberDAO.addMember_influencer(influencerDTO);
			    		    	   break;
			    		       }
			    		       case "company":
			    		       {
			    		    	   System.out.println("division 확인 회사 : "+companyDTO.getDivision());
			    		    	   System.out.println("등록번호확인 : " + companyDTO.getBusinessNO());
			    		    	   companyDTO.setProfilephoto(uniqueFileName); 
			    		    	   memberDAO.addMember_company(companyDTO);
			    		    	   break;
			    		       }
			    			}
			            }
			                catch (IOException e) {
			                e.printStackTrace();
			            }
			        }
            

			ModelAndView mav = new ModelAndView();
		    mav.addObject("showAlert", true);
		    mav.setViewName("member_view/login");
			return mav;
	}
	
	/*ID 중복 검사 input.jsp에서 ajax로 id 검증*/
	@RequestMapping(value = "/overlapped_id", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String overlapped_id(@RequestParam("id") String id) throws Exception {
			System.out.println("member/overlapped_id 도착");
			System.out.println(id);
			
			int result = memberDAO.overlapped_id(id);
			System.out.println("결과값 : "+result);
			
	        if (result == 1) {
	            return "아이디가 중복됩니다"; // 중복된 경우 메시지 반환
	        } else {
	            return "사용 가능한 아이디입니다"; // 중복되지 않은 경우 메시지 반환
	        }
	}
	
	/*닉네임 중복 검사 input.jsp에서 ajax로 닉네임 검증*/
	@RequestMapping(value = "/overlapped_nickName", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String overlapped_nickName(@RequestParam("nickName") String nickName) throws Exception {
			System.out.println("member/overlapped_nickName 도착");
			System.out.println(nickName);
			
			int result = memberDAO.overlapped_nickName(nickName);
			System.out.println("결과값 : "+result);
			
	        if (result == 1) {
	            return "닉네임이 중복됩니다"; // 중복된 경우 메시지 반환
	        } else {
	            return "사용 가능한 닉네임입니다"; // 중복되지 않은 경우 메시지 반환
	        }
	}
	
	/*사업자등록번호 중복 검사 input.jsp에서 ajax로 사업자등록번호 검증*/
	@RequestMapping(value = "/overlapped_businessNO", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String overlapped_businessNO(@RequestParam("businessNO") String businessNO) throws Exception {
			System.out.println("member/overlapped_businessNO 도착");
			System.out.println(businessNO);
			
			int result = memberDAO.overlapped_businessNO(businessNO);
			System.out.println("결과값 : "+result);
			
	        if (result == 1) {
	            return "이미 등록된 사업자 등록 번호입니다."; // 중복된 경우 메시지 반환
	        } else {
	            return "등록 가능한 사업자 등록 번호입니다."; // 중복되지 않은 경우 메시지 반환
	        }
	}
	
	/*인플루언서, 로그인*/
	@RequestMapping(value = "/loginCheck")
	public ModelAndView loginCheck(@RequestParam("id") String id, @RequestParam("password") String password, 
			                       @RequestParam("division") String division, HttpSession session) throws Exception {
		System.out.println("loginCheck 도착");
		System.out.println("id : "+id);
		System.out.println("password : "+password);
		
		 Map<String, String> params = new HashMap();
		 params.put("id", id);
		 params.put("password", password);
		 params.put("division", division);
		 
		boolean result=memberService.loginCheck(params, session);
		
		System.out.println("회원인가용!? : " + result);
		ModelAndView mav = new ModelAndView();

		if (result)// 로그인 성공
		{	
			mav.setViewName("redirect:/index");
		}
		else { // 로그인 실패
			mav.setViewName("redirect:/login");
			/* mav.addObject("showAlert", ); */			
		}
		return mav;
	}
	
	/*로그아웃, 세션 종료를 위해 개인 회원의 탈퇴에만 거쳐감*/
	@RequestMapping(value = "/logout")
	public ModelAndView logout(@RequestParam("id") String id, @RequestParam("division") String division, HttpSession session) {
		System.out.println("member/logout 도착");
		System.out.println("구분 : "+division);
		System.out.println("아이디 : "+id);
		
		memberDAO.logout(session);
		ModelAndView mav = new ModelAndView();
		
		/* 멤버의 로그아웃 : division=logout */
		/* 관리자의 로그아웃 : division=admin_logout */
		if("logout".contains(division))
		{
			switch (division)
			{
			    case "logout":
			    	mav.setViewName("redirect:/index");
			        break;
			        
			    case "admin_logout":
			    	mav.setViewName("redirect:/login_admin");
			        break;
			}
		}
		/* 회원의 자발적 탈퇴 division=company_delete || influencer_delete */
		else
		{
			System.out.println("로그아웃에서 delete로(탈퇴)");
			mav.addObject("id", id);
			mav.addObject("division", division);
			mav.setViewName("redirect:/member/delete");
			System.out.println("로그아웃에서 member/delete로");
		}
		return mav;
	}
	
	/*인플루언서, 회원탈퇴*/
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView Memberdelete(@RequestParam("id") String id, @RequestParam("division") String division ) throws Exception {
		System.out.println("member/delete 도착");
		System.out.println("id"+id);
		System.out.println("division : "+division);
		
		memberDAO.deleteMember(id,division);
		
		ModelAndView mav = new ModelAndView();
		
		/* 관리자의 강제 탈퇴 delete_admin */
		if (division.contains("delete_admin")) //관리자 권한으로 회원 탈퇴
		{
			mav.setViewName("redirect:/member/allmember_admin");
			mav.addObject("division",division);
			System.out.println("allmember_admin로 출발");
		}
		/* 회원의 자발적 탈퇴 division=company_delete || influencer_delete */
		else
		{
			mav.setViewName("redirect:/index");
			mav.addObject("division",division);
			System.out.println("index로 출발");
		}	
		mav.addObject("showAlert", true);//탈퇴 알림창
		return mav;
	}

	/*개인정보 수정&관리자 수정*/
	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public ModelAndView Membermod(@ModelAttribute("influencerDTO") InfluencerDTO influencerDTO,
								  @ModelAttribute("companyDTO") CompanyDTO companyDTO, 
								  @RequestParam("division") String division,
								  HttpSession session) throws Exception {
		System.out.println("member/mod 도착");
		//수정하려는 DTO에 따라 SQL 실행하여 DB 정보 수정
		String division_mod=null;
		ModelAndView mav = new ModelAndView();
		
		switch (division)
		{
	       case "influencer":
	       {
	    	   division_mod = influencerDTO.getDivision();
	       }
	       case "company":
	       {
	    	   division_mod = companyDTO.getDivision();
	       }
		}
		 
		 System.out.println("mod에서 division 확인 : "+division_mod);
		 
				
		switch (division_mod)
		{
	       case "influencer":
	    	   if (influencerDTO.getPassword() == null || influencerDTO.getPassword().trim().isEmpty()) //비밀번호 입력 안하고 수정할 떄
		   		{
		   			String password=memberDAO.passwordForMod_influencer(influencerDTO.getId());
		   			influencerDTO.setPassword(password);
		   		}
				System.out.println("mod에서 dto 이름 확인 : "+influencerDTO.getName());
				System.out.println("mod에서 dto 아이디 확인 : "+influencerDTO.getId());
				System.out.println("mod에서 dto 비번 확인 : "+influencerDTO.getPassword());
				System.out.println("mod에서 dto division 확인 : "+influencerDTO.getDivision());
				memberDAO.Membermod_influencer(influencerDTO, session);
				
	    	   break;
	           
	       case "company":
	    	   if (companyDTO.getPassword() == null || companyDTO.getPassword().trim().isEmpty()) //비밀번호 입력 안하고 수정할 떄
		   		{
	    		   String password=memberDAO.passwordForMod_company(companyDTO.getId());
	    		   companyDTO.setPassword(password);
		   		}
				System.out.println("mod에서 dto 이름 확인 : "+companyDTO.getName());
				System.out.println("mod에서 dto 아이디 확인 : "+companyDTO.getId());
				System.out.println("mod에서 dto 비번 확인 : "+companyDTO.getPassword());
				System.out.println("mod에서 dto division 확인 : "+companyDTO.getDivision());
				memberDAO.Membermod_company(companyDTO, session);
				break;
					

	    }
		
		// 현재 로그인한 사용자 구분(회원일 경우 userInfo 세션 바인딩, 관리자일 경우 member)
		switch (division)
		{
	       case "admin":
	       {
	    	   switch (division_mod)
	    	   {
	    	   	   case "influencer":
				   {
					   memberDAO.Membermod_influencer(influencerDTO,session);
					   session.setAttribute("admin_onemember", influencerDTO);
					   System.out.println("sql 완료 후 mod에서 influencerDTO 세션 바인딩");
					   break;
				   }
				   
			       case "company":
			       {
			    	   memberDAO.Membermod_company(companyDTO,session);
			    	   session.setAttribute("admin_onemember", companyDTO);
			    	   System.out.println("sql 완료 후 mod에서 companyDTO 세션 바인딩");
			    	   break;
			       }
	    	   }
	       }
	       case "influencer":
	       {
	    	   memberDAO.Membermod_influencer(influencerDTO,session);
			   session.setAttribute("userInfo", influencerDTO);
			   System.out.println("sql 완료 후 mod에서 influencerDTO 세션 바인딩");
			   break;
	       }
	       
	       case "company":
	       {	
	    	   memberDAO.Membermod_company(companyDTO,session);
	    	   session.setAttribute("userInfo", companyDTO);
	    	   System.out.println("sql 완료 후 mod에서 companyDTO 세션 바인딩");
	    	   break;
	       }
		}
		System.out.println("mod작업완료");
		mav.setViewName("redirect:/mypage");
		mav.addObject("division", division);
		return mav;
		
	}
	
	

    /* 관리자 allmember 이동 */
	@RequestMapping(value = "/allmember_admin", method = RequestMethod.GET)
	public ModelAndView allmember_admin(@RequestParam("division") String division, HttpSession session) {
	    System.out.println("/member/allmember_admin 도착!");

	    List membersList = memberService.listMembers(); //인플루언서 리스트 하나, 가맹점 리스트 하나가 담긴 List
	    session.setAttribute("membersList", membersList);
	    System.out.println("allmember_admin에서 세션 저장 membersList");
	    
	    ModelAndView mav = new ModelAndView("redirect:/allmember_admin");
	    if (division.contains("delete_admin"))
	    {
	    	System.out.println("last 팝업창 테스트");
	    	mav.addObject("showAlert", true);//탈퇴 알림창
	    }
	    return mav;
	}
	

	/* 관리자 권한 회원 정보 관리 */
	@RequestMapping(value = "/manageMember_admin", method = RequestMethod.GET)
	public ModelAndView manageMember_admin(@RequestParam("sendto") String sendto, 
	                                       @RequestParam("id") String id, HttpSession session) {
	    System.out.println("manageMember_admin 도착!");
	    String division = null;
	    String nickname = null;
	    if (sendto.contains("influencer")) {
	        InfluencerDTO admin_onemember = memberDAO.viewMember_influencer(id);
	        session.setAttribute("admin_onemember", admin_onemember);
	        nickname = admin_onemember.getNickName();
	        division = "influencer";
	    } else if (sendto.contains("company")) {
	        CompanyDTO admin_onemember = memberDAO.viewMember_company(id);
	        session.setAttribute("admin_onemember", admin_onemember);
	        System.out.println(admin_onemember.getAddress()+"검사");
	        System.out.println(admin_onemember.getCompanyTel()+"검사");
	        nickname = admin_onemember.getNickName();
	        division = "company";
	    }
	    System.out.println("닉네임 확인 : " + nickname);

	    // 문자열에서 '_'의 인덱스를 찾음
	    int underscoreIndex = sendto.indexOf('_');
	    // '_' 이전의 문자열을 추출
	    if (underscoreIndex != -1) {
	        sendto = sendto.substring(0, underscoreIndex);
	    }
	    System.out.println("sendto: " + sendto);

	    try {
	        // 닉네임을 UTF-8로 인코딩
	        String encodedNickname = URLEncoder.encode(nickname, "UTF-8");

	        ModelAndView mav = new ModelAndView();

	        switch (sendto) {
	            case "details":
	                System.out.println("디테일 페이지 도착");
	                mav.addObject("division", division);
	                mav.setViewName("redirect:/mypage/" + division + "/" + encodedNickname);
	                break;
	            case "edit":
	                System.out.println("edit 도착");
	                mav.setViewName("redirect:/mypage_update_" + division);
	                break;
	            case "delete":
	                System.out.println("delete 도착");
	                division += "_delete_admin";
	                mav.addObject("id", id);
	                mav.addObject("division", division);
	                mav.setViewName("redirect:/member/delete");
	                break;
	        }

	        return mav;
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	        // 예외 처리 코드 추가
	        return new ModelAndView("error");
	    }
	}
	
	
	
	
	
	
	
}
