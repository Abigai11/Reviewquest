package com.project.reviewquest.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.reviewquest.campaign.ApplicationDTO;
import com.project.reviewquest.campaign.ApplicationService;
import com.project.reviewquest.campaign.CampaignDTO;
import com.project.reviewquest.campaign.CampaignService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller("MainController")
@RequestMapping("/")
public class MainController {

   @Autowired
   private ApplicationService applicationService;
   
    @Autowired
    private CampaignService campaignService;

    @Autowired
    private MemberService memberService;
    
   /* 메인 */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView admin(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
            HttpServletRequest request, 
            HttpServletResponse response,
            Model model) {
        
        List<CampaignDTO> campaigns = null;
        campaigns = campaignService.getAllCampaigns(page,pageSize);
        
        List<CampaignDTO> Bests = campaignService.getBestCampaigns();
        List<CampaignDTO> News = campaignService.getNewCampaigns();
        List<CampaignDTO> Ddays = campaignService.getDdayCampaigns();
        
        model.addAttribute("campaigns", campaigns);
        model.addAttribute("Bests", Bests);
        model.addAttribute("News", News);
        model.addAttribute("Ddays", Ddays);
        
        int influencerCount = memberService.getInfluencerCount();
        int companyCount = memberService.getCompanyCount();
        int campaignCount = memberService.getCampaignCount();
        int applicationCount = memberService.getApplicationCount();
        
        model.addAttribute("influencerCount", influencerCount);
        model.addAttribute("companyCount", companyCount);
        model.addAttribute("campaignCount", campaignCount);
        model.addAttribute("applicationCount", applicationCount);
        
        System.out.println(campaigns);
        return new ModelAndView("common/index");
    }

   /* 로그인 페이지 이동 */
   @RequestMapping(value = "/login")
   public ModelAndView login() {
      System.out.println("login.jsp");
      ModelAndView mav = new ModelAndView("member_view/login");
      return mav;
   }

   /* 회원약관 페이지 이동 */
   @RequestMapping(value = "/join")
   public ModelAndView Memberjoin() {
      System.out.println("join.jsp");
      ModelAndView mav = new ModelAndView("member_view/join");
      return mav;
   }

   /* 회원가입 페이지 이동 */
   @RequestMapping(value = "/input", method = RequestMethod.GET)
   public ModelAndView Memberinput(@RequestParam(required = false) String division) {
      System.out.println(division + "의 회원 가입이 진행됩니다!");
      ModelAndView mav = new ModelAndView("member_view/input_" + division);
      mav.addObject("division", division);
      return mav;
   }

   /* 마이페이지 페이지 이동 */
   @RequestMapping(value = "/mypage/{division}/{nickName}", method = RequestMethod.GET)
   public ModelAndView mypage(@PathVariable String division, @PathVariable String nickName) {
       System.out.println("mypage_influencer.jsp");
       List<ApplicationDTO> applications = applicationService.getNickApplications(nickName);
       List<CampaignDTO> campaigns = new ArrayList<>();
       
       for (ApplicationDTO application : applications) {
           CampaignDTO campaign = campaignService.getMypageCampaigns(application.getCampaignNum());
           
           campaign.setApplications(application);
           
           campaigns.add(campaign);
       }
       
       ModelAndView mav = new ModelAndView("member_view/mypage_" + division);
       mav.addObject("campaigns", campaigns);
       mav.addObject("applications", applications);
       return mav;
   }
   

   /* 인플루언서 마이페이지 개인 정보 수정 페이지 이동 */
   @RequestMapping(value = "/mypage_update_influencer")
   public ModelAndView mypage_update_influencer() {
      System.out.println("mypage_update_influencer.jsp 메인컨트롤러");
      ModelAndView mav = new ModelAndView("member_view/mypage_update_influencer");
      return mav;
   }

   /* 가맹점 마이페이지 개인 정보 수정 페이지 이동 */
   @RequestMapping(value = "/mypage_update_company")
   public ModelAndView mypage_update_company() {
      System.out.println("mypage_update_company.jsp");
      ModelAndView mav = new ModelAndView("member_view/mypage_update_company");
      return mav;
   }

   /* 관리자 로그인 페이지 이동 */
   @RequestMapping(value = "/login_admin")
   public ModelAndView login_admin() {
      System.out.println("login_admin.jsp");
      ModelAndView mav = new ModelAndView("admin/login_admin");
      return mav;
   }


   /* 관리자 페이지 전체 멤버보기 */
   @RequestMapping(value = "/allmember_admin")
   public ModelAndView allmember_admin() {
       ModelAndView mav = new ModelAndView("admin/allmember_admin");
       List<ApplicationDTO> applications = applicationService.getAllApplications();
       
       List<CampaignDTO> campaigns = new ArrayList<>();
       
       for (ApplicationDTO application : applications) {
           CampaignDTO campaign = campaignService.getMypageCampaigns(application.getCampaignNum());
           
           campaign.setApplications(application);
           
           campaigns.add(campaign);  
       }
       
       mav.addObject("campaigns", campaigns);
       mav.addObject("applications", applications);
      return mav;
   }

}