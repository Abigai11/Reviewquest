package com.project.reviewquest.donation;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.project.reviewquest.forum.ForumDTO;
import com.project.reviewquest.forum.ForumPage;
import com.project.reviewquest.reply.ReplyDTO;

@Controller
@RequestMapping("/donation")
public class DonationController {
	@Autowired
	private DonationService donationService;
	
	//관리자 기부글 작성
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminGET() throws Exception {
		System.out.println("adminGET 실행");
		
		ModelAndView mav = new ModelAndView("admin/adminDonationCreate");
		return mav; 
	}
	
	//관리자 기부글 조회
	@RequestMapping(value = "/adminList", method = RequestMethod.GET)
	private ModelAndView adminList(@ModelAttribute DonationAdminList donationAdminList) throws Exception {
		System.out.println("donationList 실행");
		
		donationAdminList.setTotalCount(donationService.donationCount(donationAdminList));
		System.out.println(donationAdminList);
		
		List<DonationDTO> donationList = donationService.donationSearch(donationAdminList);
		System.out.println(donationList);
		
		ModelAndView mav = new ModelAndView("admin/adminDonationList");
		mav.addObject("donationList", donationList);
		mav.addObject("donationAdminList", donationAdminList);
		return mav;
	}
	
	//기부글 작성
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView createGET() throws Exception {
		System.out.println("createGET 실행");
		
		ModelAndView mav = new ModelAndView("donation/create");
		return mav; 
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST) 
	private ModelAndView createPOST(DonationDTO donationDTO, DonationFileUpload upload, @RequestParam("file") MultipartFile file,
			RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception { 
		System.out.println("createPOST 실행");
		ModelAndView mav = new ModelAndView("redirect:/donation/");
		upload.fileUpload(donationDTO, request, file);
		
		donationService.donationCreate(donationDTO);
		redirectAttributes.addFlashAttribute("msg", "doRegSuccess");
		return mav; 
	}
	
	//기부글 조회
	@RequestMapping(value = "/", method = RequestMethod.GET)
	private ModelAndView donationList(@ModelAttribute DonationPage donationPage) throws Exception {
		System.out.println("donationList 실행");
		
		donationPage.setTotalCount(donationService.donationCount(donationPage));
		System.out.println(donationPage);
		
		List<DonationDTO> donationList = donationService.donationSearch(donationPage);
		System.out.println(donationList);
		
		ModelAndView mav = new ModelAndView("donation/list");
		mav.addObject("donationList", donationList);
		mav.addObject("donationPage", donationPage);
		return mav;
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET) 
	private ModelAndView donationRead(@RequestParam("num") int num) throws Exception { 
		System.out.println("donationRead 실행");
		
		ModelAndView mav = new ModelAndView("donation/read");
		DonationDTO donationDTO = donationService.donationRead(num);
		mav.addObject("donationDTO", donationDTO);
		
		return mav;
	}
	
	//기부글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET) 
	private ModelAndView modifyGET(@RequestParam("num") int num) throws Exception { 
		System.out.println("modifyGET 실행");
		
		ModelAndView mav = new ModelAndView("/donation/modify");
		DonationDTO donationDTO = donationService.donationRead(num);
		mav.addObject("donationDTO", donationDTO);
		return mav; 
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST) 
	private ModelAndView modifyPOST(DonationDTO donationDTO, DonationFileUpload upload, RedirectAttributes redirectAttributes, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws Exception { 
		System.out.println("modifyPOST 실행");
		
		System.out.println(donationDTO.getFilePath());
		
		 // 게시글 번호로 이전 게시글 정보를 가져옴
	    DonationDTO donation = donationService.donationRead(donationDTO.getNum());
	    System.out.println(donationDTO);
	    
	    if (file != null && !file.isEmpty()) {
	    	System.out.println("업로드 실행");
	        upload.fileUpload(donationDTO, request, file);
	        donationService.donationUpdate(donationDTO);
	    } else {
	    
		    donation.setTitle(donationDTO.getTitle());
		    donation.setOffice(donationDTO.getOffice());
		    donation.setContent(donationDTO.getContent());
		    donation.setEndDate(donationDTO.getEndDate());
		    donation.setTargetAmount(donationDTO.getTargetAmount());
		    
		    System.out.println(donation);
		    donationService.donationUpdate(donation);
	    }
	    	
		ModelAndView mav = new ModelAndView("redirect:/donation/read");
		
		redirectAttributes.addAttribute("num", donationDTO.getNum());
		redirectAttributes.addFlashAttribute("msg", "doModSuccess");
		return mav; 
	}
	
	//게시글 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.POST) 
	private ModelAndView remove(@RequestParam("num") int num, RedirectAttributes redirectAttributes,
			DonationDTO donationDTO, HttpServletRequest request) throws Exception { 
		System.out.println("remove 실행");
		
		 // 게시글 번호로 이전 게시글 정보를 가져옴
	    donationDTO = donationService.donationRead(num);
	    
	    // 이전 파일 경로 및 파일 이름 가져오기
	    String filePath = donationDTO.getFilePath();
	    
	    // 이전 파일 삭제
	    if (filePath != null && !filePath.isEmpty()) {
	        String realPath = request.getServletContext().getRealPath("/resources/images/doUpload");
	        File previousFile = new File(realPath + File.separator + filePath);
	        if (previousFile.exists()) {
	            previousFile.delete();
	        }
	    }
	    
		
		ModelAndView mav = new ModelAndView("redirect:/donation/");
		donationService.donationDelete(num);
		redirectAttributes.addFlashAttribute("msg", "doDelSuccess");
		return mav; 
	}
	
	//기부금액 업데이트
	@RequestMapping(value = "/updateAmount", method = RequestMethod.POST)
	private ModelAndView update(@RequestParam("num") int num, @RequestParam("amount") String strAmount, 
			@RequestParam("nickname") String nickname, @RequestParam("email") String email, @RequestParam("title") String title,
			RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {
		System.out.println("updateAmount 실행");
		String cleanAmount = strAmount.replace(",", "");
		int amount = Integer.parseInt(cleanAmount);
		
		DonationDTO donationDTO = donationService.donationRead(num);
		donationService.sendEmailFromRedirectPage(nickname, amount, email, request, title);
		
		// 현재 금액을 가져와서 새로운 기부 금액을 더함
	    int currentAmount = donationDTO.getAmount();
	    int newAmount = currentAmount + amount;
		
		donationDTO.setAmount(newAmount);		
		donationService.amountUpdate(donationDTO);
		
		
		
		ModelAndView mav = new ModelAndView("redirect:/donation/read");
		
		redirectAttributes.addAttribute("num", donationDTO.getNum());
		redirectAttributes.addFlashAttribute("msg", "amountSuccess");
		return mav; 
	}
	
	//에디터에 이미지 삽입
	@PostMapping(value="/SummerNoteImageFile")
	@ResponseBody
	public String SummerNoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = request.getServletContext().getRealPath("/resources/images/doUpload");	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String today = new SimpleDateFormat("yyMMdd").format(new Date());
		String saveFolder = fileRoot + File.separator + today;
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(saveFolder + "/" + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", request.getContextPath() + "/resources/images/doUpload/"+ today +"/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
			System.out.println("저장");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		// JSON 객체를 문자열로 변환하여 반환
	    String a = jsonObject.toString();
	    System.out.println(a);
	    return a;
	}
	
	//에디터 이미지 삭제
	@RequestMapping(value = "/deleteSummernoteImageFile")
	@ResponseBody
	public void deleteSummernoteImageFile(@RequestParam("file") String fileName, HttpServletRequest request) {
	    // 폴더 위치
		String fileRoot = request.getServletContext().getRealPath("/resources/images/doUpload/");
		String today = new SimpleDateFormat("yyMMdd").format(new Date());
		String filePath = fileRoot + today + File.separator;
	    
	    // 해당 파일 삭제
	    deleteFile(filePath, fileName);
	}

	// 파일 하나 삭제
	private void deleteFile(String filePath, String fileName) {
	    Path path = Paths.get(filePath, fileName);
	    try {
	        Files.delete(path);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    System.out.println("이미지 삭제완료");
	}


}
