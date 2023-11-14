package com.project.reviewquest.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriUtils;

import com.project.reviewquest.campaign.ApplicationDTO;
import com.project.reviewquest.campaign.ApplicationService;
import com.project.reviewquest.campaign.CampaignDTO;
import com.project.reviewquest.campaign.CampaignService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private CampaignService campaignService;
	
	@Autowired
	private ApplicationService applicationService;
	
	//리뷰 작성
	@RequestMapping(value = "/create", method = RequestMethod.GET) 
	private ModelAndView createGET(@RequestParam("id") Long id) throws Exception { 
		System.out.println("createGET 실행");
		CampaignDTO campaignDTO = campaignService.getCampaignById(id);
		ModelAndView mav = new ModelAndView("review/create");
		mav.addObject("campaignDTO", campaignDTO);
		return mav; 
	}
	
	
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    private ModelAndView createPOST(ReviewDTO reviewDTO, @RequestParam("id") Long id, RedirectAttributes redirectAttributes,
                                    @RequestParam("name") String name, @RequestParam("division") String division) throws Exception {
        System.out.println("createPOST 실행");

        reviewService.createReview(reviewDTO);
        applicationService.contentApplication(id, name);

        try {
            // 이름을 URL 인코딩
            String encodedName = UriUtils.encode(name, "UTF-8");
            String redirectUrl = "redirect:/mypage/" + division + "/" + encodedName;

            ModelAndView mav = new ModelAndView(redirectUrl);
            redirectAttributes.addFlashAttribute("msg", "revSuccess");
            return mav;
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView errorModelAndView = new ModelAndView("error");
            errorModelAndView.addObject("errorMessage", "URL 인코딩 중 오류 발생");
            return errorModelAndView;
        }
    }
	 
	
	/*
	 * @RequestMapping(value = "/create", method = RequestMethod.POST, produces =
	 * "application/json")
	 * 
	 * @ResponseBody public ResponseEntity<?> createPOST(ReviewDTO reviewDTO,
	 * RedirectAttributes redirectAttributes, @RequestParam("id") Long
	 * id, @RequestParam("name") String name) throws Exception {
	 * System.out.println("createPOST 실행");
	 * 
	 * reviewService.createReview(reviewDTO); // 리뷰 생성 서비스 호출
	 * applicationService.contentApplication(id, name);
	 * 
	 * // 여기에서 필요한 로직을 수행하고 응답 데이터를 생성 Map<String, String> responseMap = new
	 * HashMap<>(); responseMap.put("status", "컨텐츠 등록"); // 응답 데이터에 상태 정보 추가
	 * 
	 * return ResponseEntity.ok(responseMap); }
	 */

	
	//리뷰 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET) 
	private ModelAndView readReview(@RequestParam("reviewNo") int reviewNo, @RequestParam("id") Long id, ReviewDTO reviewDTO) throws Exception { 
		System.out.println("readReview 실행");
		System.out.println(reviewDTO);
		CampaignDTO campaignDTO = campaignService.getCampaignById(id);
		ModelAndView mav = new ModelAndView("review/read");
		reviewDTO = reviewService.readReview(reviewNo);
		mav.addObject("reviewDTO", reviewDTO);
		mav.addObject("campaignDTO", campaignDTO);
		return mav; 
	}
	
	//리뷰 리스트
	@RequestMapping(value = "/", method = RequestMethod.GET)
	private ModelAndView listReview(@RequestParam("id") Long id, ReviewDTO reviewDTO) throws Exception {
		System.out.println("forumList 실행");
		System.out.println(reviewDTO.getFilePath());
		List<ReviewDTO> listReview = reviewService.listReview(id);
		CampaignDTO campaignDTO = campaignService.getCampaignById(id);
		System.out.println(listReview);
		ModelAndView mav = new ModelAndView("review/listReview");
		mav.addObject("listReview", listReview);
		mav.addObject("campaignDTO", campaignDTO);
		return mav;
	}
	
	//리뷰 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET) 
	private ModelAndView modifyGET(@RequestParam("reviewNo") int reviewNo, @RequestParam("id") Long id) throws Exception { 
		System.out.println("modifyGET 실행");
		
		CampaignDTO campaignDTO = campaignService.getCampaignById(id);
		ModelAndView mav = new ModelAndView("/review/modify");
		ReviewDTO reviewDTO = reviewService.readReview(reviewNo);
		mav.addObject("reviewDTO", reviewDTO);
		mav.addObject("campaignDTO", campaignDTO);
		return mav; 
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST) 
	private ModelAndView modifyPOST(ReviewDTO reviewDTO, RedirectAttributes redirectAttributes, @RequestParam("id") Long id) throws Exception { 
		System.out.println("modifyPOST 실행");
		ModelAndView mav = new ModelAndView("redirect:/review/read?id="+id+"&reviewNo="+reviewDTO.getReviewNo());
		reviewService.updateReview(reviewDTO);
		redirectAttributes.addFlashAttribute("msg", "revModSuccess");
		return mav; 
	}
}
