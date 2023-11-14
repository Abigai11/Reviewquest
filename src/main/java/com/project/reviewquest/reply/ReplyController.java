package com.project.reviewquest.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.reviewquest.forum.ForumDTO;
import com.project.reviewquest.forum.ForumPage;
import com.project.reviewquest.forum.ForumService;
import com.project.reviewquest.member.CompanyDTO;
import com.project.reviewquest.member.InfluencerDTO;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	ReplyService replyService;
	@Autowired
	ForumService forumService;
	
	//댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	private ModelAndView writePOST(ReplyDTO replyDTO, ForumPage forumPage, RedirectAttributes redirectAttributes) throws Exception { 
		System.out.println("writePOST 실행");
	    
		replyService.insertReply(replyDTO);
		System.out.println(replyDTO);
		ModelAndView mav = new ModelAndView("redirect:/forum/read?num="+replyDTO.getNum());

		redirectAttributes.addAttribute("page", forumPage.getPage());
		redirectAttributes.addAttribute("pageNum", forumPage.getPageNum());
		redirectAttributes.addFlashAttribute("msg", "repSuccess");
		return mav; 
	}
	
	//댓글 조회
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public ModelAndView getModify(@RequestParam("num") int num, @RequestParam("replyNo") int replyNo) throws Exception {
		System.out.println("getModify 실행");
	    ModelAndView mav = new ModelAndView("/forum/replyModify");

	    // 게시글 정보를 가져오는 서비스 메서드 호출
	    ForumDTO forumDTO = forumService.readForum(num);

	    // 댓글 정보를 가져오는 서비스 메서드 호출
	    ReplyDTO replyDTO = replyService.selectReply(replyNo);

	    mav.addObject("forumDTO", forumDTO);
	    mav.addObject("replyDTO", replyDTO);
	    
	    return mav;
	}

	
	//댓글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	private ModelAndView postModify(ReplyDTO replyDTO, ForumPage forumPage,RedirectAttributes redirectAttributes) throws Exception { 
		System.out.println("postModify 실행");
		
		ModelAndView mav = new ModelAndView("redirect:/forum/read?num="+replyDTO.getNum());
		replyService.updateReply(replyDTO);
		System.out.println(replyDTO);
		redirectAttributes.addAttribute("page", forumPage.getPage());
		redirectAttributes.addAttribute("pageNum", forumPage.getPageNum());
		redirectAttributes.addFlashAttribute("msg", "repModSuccess");
		return mav; 
	}
	
	//댓글 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	private ModelAndView repRemove(@RequestParam("num") int num, @RequestParam("replyNo") int replyNo, 
		ForumPage forumPage,RedirectAttributes redirectAttributes) throws Exception { 
		System.out.println("remove 실행");
		
		ModelAndView mav = new ModelAndView("redirect:/forum/read");
		replyService.deleteReply(replyNo);
		redirectAttributes.addAttribute("num", num);
		redirectAttributes.addAttribute("page", forumPage.getPage());
		redirectAttributes.addAttribute("pageNum", forumPage.getPageNum());
		redirectAttributes.addAttribute("searchType", forumPage.getSearchType());
		redirectAttributes.addAttribute("keyword", forumPage.getKeyword());
		redirectAttributes.addFlashAttribute("msg", "repDelSuccess");
		return mav; 
	}
	
}
