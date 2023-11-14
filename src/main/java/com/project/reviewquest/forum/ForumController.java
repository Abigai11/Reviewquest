package com.project.reviewquest.forum;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.project.reviewquest.news.NewsDTO;
import com.project.reviewquest.news.NewsPage;
import com.project.reviewquest.news.NewsService;
import com.project.reviewquest.reply.ReplyDTO;
import com.project.reviewquest.reply.ReplyService;

@Controller
@RequestMapping("/forum")
public class ForumController {
	@Autowired
	ForumService forumService;
	@Autowired
	ReplyService replyService;
	
	//게시판 메인페이지
	@RequestMapping(value = {"/","/listForum"}, method = RequestMethod.GET)
	private ModelAndView forumList(@ModelAttribute ForumPage forumPage) throws Exception {
		System.out.println("forumList 실행");
		
		forumPage.setTotalCount(forumService.countSearchForum(forumPage));
		List<NewsDTO> newsList = forumService.newsList();
		List<ForumDTO> forumList = forumService.searchForum(forumPage);
		
		ModelAndView mav = new ModelAndView("forum/listForum");
		mav.addObject("forumList", forumList);
		mav.addObject("forumPage", forumPage);
		mav.addObject("newsList", newsList);
		System.out.println(forumPage);
		return mav;
	}
	
	//게시글 작성
	@RequestMapping(value = "/form", method = RequestMethod.GET) 
	private ModelAndView formGET() throws Exception { 
		System.out.println("formGET 실행");
		
		ModelAndView mav = new ModelAndView("/forum/form");
		return mav; 
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.POST) 
	private ModelAndView formPOST(ForumDTO forumDTO, @RequestParam("files") MultipartFile[] files,
			RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception { 
		System.out.println("formPOST 실행");
		ModelAndView mav = new ModelAndView("redirect:/forum/listForum");

		forumService.insertForum(forumDTO);
		redirectAttributes.addFlashAttribute("msg", "regSuccess");
		return mav; 
	}
	 
	//게시글 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET) 
	private ModelAndView read(@RequestParam("num") int num, @ModelAttribute ForumPage forumPage) throws Exception { 
		System.out.println("read 실행");
		
		forumPage.setTotalCount(forumService.countSearchForum(forumPage));
		List<ForumDTO> forumList = forumService.searchForum(forumPage);
		List<NewsDTO> newsList = forumService.newsList();
		
		ModelAndView mav = new ModelAndView("/forum/read");
		ForumDTO forumDTO = forumService.readForum(num);
		mav.addObject("forumDTO", forumDTO);
		mav.addObject("forumList", forumList);
		mav.addObject("forumPage", forumPage);
		mav.addObject("newsList", newsList);
		System.out.println(forumDTO);
		
		//댓글 조회
		List<ReplyDTO> reply = replyService.readReply(num);
		System.out.println(reply);
		mav.addObject("reply", reply);
		return mav; 
	}
	
	//게시글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET) 
	private ModelAndView modifyGET(@RequestParam("num") int num, @ModelAttribute ForumPage forumPage) throws Exception { 
		System.out.println("modifyGET 실행");
		
		ModelAndView mav = new ModelAndView("/forum/modify");
		ForumDTO forumDTO = forumService.readForum(num);
		mav.addObject("forumDTO", forumDTO);
		return mav; 
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST) 
	private ModelAndView modifyPOST(ForumDTO forumDTO, ForumPage forumPage,RedirectAttributes redirectAttributes,
			@RequestParam("files") MultipartFile[] files, HttpServletRequest request) throws Exception { 
		System.out.println("modifyPOST 실행");	

	    forumService.updateForum(forumDTO);
	    System.out.println(forumDTO);
	    
		ModelAndView mav = new ModelAndView("redirect:/forum/read");
		forumService.updateForum(forumDTO);
		redirectAttributes.addAttribute("num", forumDTO.getNum());
		redirectAttributes.addAttribute("page", forumPage.getPage());
		redirectAttributes.addAttribute("pageNum", forumPage.getPageNum());
		redirectAttributes.addAttribute("searchType", forumPage.getSearchType());
		redirectAttributes.addAttribute("keyword", forumPage.getKeyword());
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return mav; 
	}
	
	//게시글 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.POST) 
	private ModelAndView remove(@RequestParam("num") int num, ForumPage forumPage, RedirectAttributes redirectAttributes,
			ForumDTO forumDTO, HttpServletRequest request) throws Exception { 
		System.out.println("remove 실행");
		
		 // 게시글 번호로 이전 게시글 정보를 가져옴
	    forumDTO = forumService.readForum(forumDTO.getNum());
		
		ModelAndView mav = new ModelAndView("redirect:/forum/listForum");
		forumService.deleteForum(num);
		redirectAttributes.addAttribute("page", forumPage.getPage());
		redirectAttributes.addAttribute("pageNum", forumPage.getPageNum());
		redirectAttributes.addAttribute("searchType", forumPage.getSearchType());
		redirectAttributes.addAttribute("keyword", forumPage.getKeyword());
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return mav; 
	}
	
	//에디터에 이미지 삽입
		@PostMapping(value="/SummerNoteImageFile")
		@ResponseBody
		public String SummerNoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
			
			JsonObject jsonObject = new JsonObject();
			
			String fileRoot = request.getServletContext().getRealPath("/resources/images/upload");	//저장될 외부 파일 경로
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			String today = new SimpleDateFormat("yyMMdd").format(new Date());
			String saveFolder = fileRoot + File.separator + today;
					
			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			
			File targetFile = new File(saveFolder + "/" + savedFileName);	
			
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
				jsonObject.addProperty("url", request.getContextPath() + "/resources/images/upload/"+ today +"/"+savedFileName);
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
			String fileRoot = request.getServletContext().getRealPath("/resources/images/upload/");
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
