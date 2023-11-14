package com.project.reviewquest.campaign;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.net.URLDecoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.reviewquest.member.MemberDAO;
import com.project.reviewquest.member.MemberDTO;
import com.project.reviewquest.review.ReviewDTO;
import com.project.reviewquest.review.ReviewService;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller("CampaignController")
@RequestMapping("/")
public class CampaignController {

	@Autowired
	private CampaignService campaignService;

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private ApplicationService applicationService;
	
	@Autowired
	private ReviewService reviewService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView listCampaigns(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "region", required = false) String region,
			@RequestParam(value = "mainCategory", required = false) String mainCategory,
			@RequestParam(value = "subCategory", required = false) String subCategory,
			@RequestParam(value = "searchBy", defaultValue = "campaignName") String searchBy,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword, Model model) {

		int pageSize = 35; // 한 페이지에 표시할 캠페인 수

		List<CampaignDTO> campaigns = null;

		int totalCampaigns = 0; // totalCampaigns 변수 초기화

		// city와 region이 제공되면 해당 조건으로 필터링된 결과를 가져옵니다.
		if (city != null && !city.isEmpty()) {
			if (region != null && !region.isEmpty()) {
				if (mainCategory != null && !mainCategory.isEmpty()) {
					if (subCategory != null && !subCategory.isEmpty()) {
						// 모든 조건이 제공되는 경우
						campaigns = campaignService.getCampaignsByAllConditions(city, region, mainCategory, subCategory,
								page, pageSize);
						totalCampaigns = campaignService.getTotalCampaignsByAllConditions(city, region, mainCategory,
								subCategory);
					} else {
						// city, region, mainCategory만 제공되는 경우
						campaigns = campaignService.getCampaignsBycityRegionAndMainCategory(city, region, mainCategory,
								page, pageSize);
						totalCampaigns = campaignService.getTotalCampaignsByCityRegionAndMainCategory(city, region,
								mainCategory);
					}
				} else {
					// city, region만 제공되는 경우
					campaigns = campaignService.getCampaignsByCityAndRegion(city, region, page, pageSize);
					totalCampaigns = campaignService.getTotalCampaignsByCityAndRegion(city, region);
				}
			} else if (mainCategory != null && !mainCategory.isEmpty()) {
				if (subCategory != null && !subCategory.isEmpty()) {
					// city, mainCategory, subCategory만 제공되는 경우
					campaigns = campaignService.getCampaignsBycityMainCategoryAndSubCategory(city, mainCategory,
							subCategory, page, pageSize);
					totalCampaigns = campaignService.getTotalCampaignsByCityMainCategoryAndSubCategory(city,
							mainCategory, subCategory);
				} else {
					// city, mainCategory만 제공되는 경우
					campaigns = campaignService.getCampaignsBycityAndMainCategory(city, mainCategory, page, pageSize);
					totalCampaigns = campaignService.getTotalCampaignsByCityAndMainCategory(city, mainCategory);
				}
			} else {
				// city만 제공되는 경우
				campaigns = campaignService.getCampaignsByCity(city, page, pageSize);
				totalCampaigns = campaignService.getTotalCampaignsByCity(city);
			}
		} else if (region != null && !region.isEmpty()) {
			if (mainCategory != null && !mainCategory.isEmpty()) {
				if (subCategory != null && !subCategory.isEmpty()) {
					// region, mainCategory, subCategory만 제공되는 경우
					campaigns = campaignService.getCampaignsByregionMainCategoryAndSubCategory(region, mainCategory,
							subCategory, page, pageSize);
					totalCampaigns = campaignService.getTotalCampaignsByRegionMainCategoryAndSubCategory(region,
							mainCategory, subCategory);
				} else {
					// region, mainCategory만 제공되는 경우
					campaigns = campaignService.getCampaignsByregionAndMainCategory(region, mainCategory, page,
							pageSize);
					totalCampaigns = campaignService.getTotalCampaignsByRegionAndMainCategory(region, mainCategory);
				}
			} else {
				// region만 제공되는 경우
				campaigns = campaignService.getCampaignsByRegion(region, page, pageSize);
				totalCampaigns = campaignService.getTotalCampaignsByRegion(region);
			}
		} else if (mainCategory != null && !mainCategory.isEmpty()) {
			if (subCategory != null && !subCategory.isEmpty()) {
				// mainCategory, subCategory만 제공되는 경우
				campaigns = campaignService.getCampaignsBymainCategoryAndSubCategory(mainCategory, subCategory, page,
						pageSize);
				totalCampaigns = campaignService.getTotalCampaignsByMainCategoryAndSubCategory(mainCategory,
						subCategory);
			} else {
				// mainCategory만 제공되는 경우
				campaigns = campaignService.getCampaignsBymainCategory(mainCategory, page, pageSize);
				totalCampaigns = campaignService.getTotalCampaignsByMainCategory(mainCategory);
			}
		} else if (subCategory != null && !subCategory.isEmpty()) {
			// subCategory만 제공되는 경우
			campaigns = campaignService.getCampaignsBysubCategory(subCategory, page, pageSize);
			totalCampaigns = campaignService.getTotalCampaignsBySubCategory(subCategory);
		} else if (searchKeyword != null && !searchKeyword.isEmpty()) {
			if ("campaignName".equals(searchBy)) {
				campaigns = campaignService.getCampaignsByCampaignName(searchKeyword, page, pageSize);
				totalCampaigns = campaignService.getTotalCampaignsByCampaignName(searchKeyword);
				System.out.println(searchKeyword + " 캠페인 이름 검색");
			} else if ("campaignPrice".equals(searchBy)) {
				campaigns = campaignService.getCampaignsByCampaignPrice(searchKeyword, page, pageSize);
				totalCampaigns = campaignService.getTotalCampaignsByCampaignPrice(searchKeyword);
			} else if ("campaignTypes".equals(searchBy)) {
				campaigns = campaignService.getCampaignsByCampaignTypes(searchKeyword, page, pageSize);
				totalCampaigns = campaignService.getTotalCampaignsByCampaignTypes(searchKeyword);
			} else if ("providedDetails".equals(searchBy)) {
				campaigns = campaignService.getCampaignsByCampaignDetails(searchKeyword, page, pageSize);
				totalCampaigns = campaignService.getTotalCampaignsByCampaignDetails(searchKeyword);
			} else if ("keyword".equals(searchBy)) {
				campaigns = campaignService.getCampaignsByCampaignKeyword(searchKeyword, page, pageSize);
				System.out.println(searchKeyword + "키워드 컨트롤러 도착");
				totalCampaigns = campaignService.getTotalCampaignsByCampaignKeyword(searchKeyword);
			} else if ("companyInformation".equals(searchBy)) {
				campaigns = campaignService.getCampaignsByCampaignInformation(searchKeyword, page, pageSize);
				totalCampaigns = campaignService.getTotalCampaignsByCampaignInformation(searchKeyword);
			}

		} else {
			// 모든 조건이 비어 있는 경우
			campaigns = campaignService.getAllCampaigns(page, pageSize);
			totalCampaigns = campaignService.getTotalCampaigns();
		}

		int totalPages = (int) Math.ceil((double) totalCampaigns / pageSize);

		model.addAttribute("campaigns", campaigns);
		model.addAttribute("totalPages", totalPages);
		return new ModelAndView("campaign/list");
	}

	@RequestMapping(value = "/{id}/{nickName}", method = RequestMethod.GET)
	public ModelAndView viewCampaign(@PathVariable Long id, @PathVariable String nickName) throws Exception {
		CampaignDTO campaign = campaignService.getCampaignById(id);
		ApplicationDTO application = applicationService.getApplications(id, nickName);
		List<ReviewDTO> reviewList = reviewService.listReview(id);
		System.out.println(id + "전");
		System.out.println(nickName + "전");
		System.out.println(application + "후");
		ModelAndView modelAndView = new ModelAndView("campaign/detail");
		modelAndView.addObject("application", application);
		modelAndView.addObject("campaign", campaign);
		modelAndView.addObject("listReview", reviewList);
		return modelAndView;
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView viewCampaignWithoutNickName(@PathVariable Long id) throws Exception {
		CampaignDTO campaign = campaignService.getCampaignById(id);
		ApplicationDTO application = applicationService.getApplications(id, null); // 또는 원하는 기본값
		List<ReviewDTO> reviewList = reviewService.listReview(id);
		ModelAndView modelAndView = new ModelAndView("campaign/detail");
		modelAndView.addObject("application", application);
		modelAndView.addObject("campaign", campaign);
		modelAndView.addObject("listReview", reviewList);
		return modelAndView;
	}

	/*
	 * @RequestMapping(value = "/popup", method = RequestMethod.GET, produces =
	 * "application/json;charset=UTF-8")
	 * 
	 * @ResponseBody public String openPopup(Model model, HttpSession session)
	 * throws Exception { System.out.println("안"); MemberDTO userInfo = (MemberDTO)
	 * session.getAttribute("userInfo"); System.out.println(userInfo); String id =
	 * userInfo.getId(); System.out.println(id+"뭐"); MemberDTO memberDTO =
	 * memberDAO.getMemberById(id);
	 * 
	 * System.out.println(memberDTO.getId()+"멤버멤버");
	 * 
	 * // ObjectMapper를 사용하여 Java 객체를 JSON 문자열로 변환 ObjectMapper objectMapper = new
	 * ObjectMapper(); String jsonMemberDTO =
	 * objectMapper.writeValueAsString(memberDTO);
	 * 
	 * return jsonMemberDTO; }
	 */

//    @RequestMapping(value = "/application", method = RequestMethod.POST)
//    public String submitApplication(@ModelAttribute("applicationDTO") ApplicationDTO applicationDTO) {
//        // DTO 객체를 서비스로 전달하여 데이터베이스에 저장
//        applicationService.saveApplication(applicationDTO);
//
//        // 저장이 완료된 후에 보여줄 뷰 페이지로 이동
//        return "campaign/detail"; // 성공 페이지로 리다이렉트 또는 포워드
//    }

	@RequestMapping(value = "/application/{id}/{nickName}", method = RequestMethod.POST)
	public ModelAndView submitApplication(@ModelAttribute("applicationDTO") ApplicationDTO applicationDTO,
	    @PathVariable Long id, @PathVariable String nickName) {
	    try {
	        String decodedNickName = URLDecoder.decode(nickName, "UTF-8");
	        ApplicationDTO application = applicationService.saveApplication(applicationDTO);
	        String redirectUrl = "redirect:/" + id + "/" + URLEncoder.encode(decodedNickName, "UTF-8");
	        ModelAndView modelAndView = new ModelAndView(redirectUrl);
	        modelAndView.addObject("application", application);
	        return modelAndView;
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	        ModelAndView errorModelAndView = new ModelAndView("error");
	        errorModelAndView.addObject("errorMessage", "URL 디코딩 중 오류 발생");
	        return errorModelAndView;
	    }
	}

	@RequestMapping(value = "/updateApplication/{id}/{nickName}", method = RequestMethod.POST)
	public ModelAndView updateApplication(@ModelAttribute("applicationDTO") ApplicationDTO applicationDTO,
	    @PathVariable Long id, @PathVariable String nickName) {
	    try {
	        String decodedNickName = URLDecoder.decode(nickName, "UTF-8");
	        ApplicationDTO updatedApplication = applicationService.updateApplication(applicationDTO, id, decodedNickName);
	        String redirectUrl = "redirect:/" + id + "/" + URLEncoder.encode(decodedNickName, "UTF-8");
	        ModelAndView modelAndView = new ModelAndView(redirectUrl);
	        modelAndView.addObject("application", updatedApplication);
	        return modelAndView;
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	        ModelAndView errorModelAndView = new ModelAndView("error");
	        errorModelAndView.addObject("errorMessage", "URL 디코딩 중 오류 발생");
	        return errorModelAndView;
	    }
	}


	@RequestMapping(value = "/deleteApplication/{id}/{nickName}", method = RequestMethod.POST)
	public ModelAndView deleteApplication(@PathVariable Long id, @PathVariable String nickName) {
	    try {
	        // URL 디코딩
	        String decodedNickName = URLDecoder.decode(nickName, "UTF-8");
	        System.out.println(decodedNickName);
	        applicationService.deleteApplication(id, decodedNickName);
	        String redirectUrl = "redirect:/" + id + "/" + URLEncoder.encode(decodedNickName, "UTF-8");
	        ModelAndView modelAndView = new ModelAndView(redirectUrl);
	        return modelAndView;
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	        ModelAndView errorModelAndView = new ModelAndView("error");
	        errorModelAndView.addObject("errorMessage", "URL 디코딩 중 오류 발생");
	        return errorModelAndView;
	    }
	}


	@RequestMapping(value = "/mypagedeleteApplication/{id}/{nickName}", method = RequestMethod.POST)
	public ModelAndView mypagedeleteApplication(@PathVariable Long id, @PathVariable String nickName) {
	    try {
	        // URL 디코딩
	        String decodedNickName = URLDecoder.decode(nickName, "UTF-8");
	        applicationService.deleteApplication(id, decodedNickName);
	        String redirectUrl = "redirect:/mypage/influencer" + "/" + URLEncoder.encode(decodedNickName, "UTF-8");
	        ModelAndView modelAndView = new ModelAndView(redirectUrl);
	        return modelAndView;
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	        ModelAndView errorModelAndView = new ModelAndView("error");
	        errorModelAndView.addObject("errorMessage", "URL 디코딩 중 오류 발생");
	        return errorModelAndView;
	    }
	}

	@RequestMapping(value = "/contentApplication/{id}/{nickName}", method = RequestMethod.POST)
	public ModelAndView contentApplication(@PathVariable Long id, @PathVariable String nickName) {
	    try {
	        // URL 디코딩
	        String decodedNickName = URLDecoder.decode(nickName, "UTF-8");
	        applicationService.contentApplication(id, decodedNickName);
	        String redirectUrl = "redirect:/mypage/influencer" + "/" + URLEncoder.encode(decodedNickName, "UTF-8");
	        ModelAndView modelAndView = new ModelAndView(redirectUrl);
	        return modelAndView;
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	        ModelAndView errorModelAndView = new ModelAndView("error");
	        errorModelAndView.addObject("errorMessage", "URL 디코딩 중 오류 발생");
	        return errorModelAndView;
	    }
	}


}
