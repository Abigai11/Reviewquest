package com.project.reviewquest.news;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.project.reviewquest.reply.ReplyDTO;
import com.project.reviewquest.reply.ReplyService;

@Controller
@RequestMapping("/news")
public class NewsController {
	@Autowired
	NewsService newsService;
	@Autowired
	ReplyService replyService;
	
	//게시판 메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	private ModelAndView newsList(@ModelAttribute NewsPage newsPage) throws Exception {
		System.out.println("newsList 실행");
		
		newsPage.setTotalCount(newsService.newsCountSearch(newsPage));
		List<NewsDTO> newsList = newsService.newsSearch(newsPage);
		
		ModelAndView mav = new ModelAndView("/news/newsList");
		mav.addObject("newsList", newsList);
		mav.addObject("newsPage", newsPage);
		System.out.println(newsPage);
		return mav;
	}
	
	//게시글 작성
	@RequestMapping(value = "/form", method = RequestMethod.GET) 
	private ModelAndView newsGET() throws Exception { 
		System.out.println("newsGET 실행");
		
		ModelAndView mav = new ModelAndView("/news/form");
		return mav; 
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.POST) 
	private ModelAndView newsPOST(NewsDTO newsDTO, RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception { 
		System.out.println("newsPOST 실행");
		ModelAndView mav = new ModelAndView("redirect:/news/");

		newsService.newsInsert(newsDTO);
		redirectAttributes.addFlashAttribute("msg", "regSuccess");
		return mav; 
	}
	 
	//게시글 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET) 
	private ModelAndView read(@RequestParam("num") int num, @ModelAttribute NewsPage newsPage) throws Exception { 
		System.out.println("read 실행");
		
		newsPage.setTotalCount(newsService.newsCountSearch(newsPage));
		List<NewsDTO> newsList = newsService.newsSearch(newsPage);
		
		ModelAndView mav = new ModelAndView("/news/read");
		NewsDTO newsDTO = newsService.newsRead(num);
		mav.addObject("newsDTO", newsDTO);
		mav.addObject("newsList", newsList);
		mav.addObject("newsPage", newsPage);
		System.out.println(newsDTO);
		
		//댓글 조회
		List<ReplyDTO> reply = replyService.readReply(num);
		System.out.println(reply);
		mav.addObject("reply", reply);
		return mav; 
	}
	
	//게시글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET) 
	private ModelAndView modifyGET(@RequestParam("num") int num, @ModelAttribute NewsPage newsPage) throws Exception { 
		System.out.println("modifyGET 실행");
		
		ModelAndView mav = new ModelAndView("/news/modify");
		NewsDTO newsDTO = newsService.newsRead(num);
		mav.addObject("newsDTO", newsDTO);
		return mav; 
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST) 
	private ModelAndView modifyPOST(NewsDTO newsDTO, NewsPage newsPage,RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception { 
		System.out.println("modifyPOST 실행");	
	    
	    newsService.newsUpdate(newsDTO);
	    System.out.println(newsDTO);
	    
		ModelAndView mav = new ModelAndView("redirect:/news/read");
		redirectAttributes.addAttribute("num", newsDTO.getNum());
		redirectAttributes.addAttribute("page", newsPage.getPage());
		redirectAttributes.addAttribute("pageNum", newsPage.getPageNum());
		redirectAttributes.addAttribute("searchType", newsPage.getSearchType());
		redirectAttributes.addAttribute("keyword", newsPage.getKeyword());
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return mav; 
	}
	
	//게시글 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.POST) 
	private ModelAndView remove(@RequestParam("num") int num, NewsPage newsPage, RedirectAttributes redirectAttributes,
			NewsDTO newsDTO, HttpServletRequest request) throws Exception { 
		System.out.println("remove 실행");
		
		 // 게시글 번호로 이전 게시글 정보를 가져옴
	    newsDTO = newsService.newsRead(newsDTO.getNum());
		
		ModelAndView mav = new ModelAndView("redirect:/news/");
		newsService.newsDelete(num);
		redirectAttributes.addAttribute("page", newsPage.getPage());
		redirectAttributes.addAttribute("pageNum", newsPage.getPageNum());
		redirectAttributes.addAttribute("searchType", newsPage.getSearchType());
		redirectAttributes.addAttribute("keyword", newsPage.getKeyword());
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return mav; 
	}
}
