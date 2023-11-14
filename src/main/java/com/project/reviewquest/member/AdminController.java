package com.project.reviewquest.member;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.reviewquest.campaign.ApplicationDTO;
import com.project.reviewquest.campaign.ApplicationService;
import com.project.reviewquest.campaign.CampaignDTO;
import com.project.reviewquest.campaign.CampaignPagination;
import com.project.reviewquest.campaign.CampaignService;
import com.project.reviewquest.member.InfluencerDTO;
import com.project.reviewquest.member.MemberDAO;
import com.project.reviewquest.member.MemberService;

@Controller("AdminController")
@RequestMapping("/admin")
public class AdminController {
	
    @Autowired
    private CampaignService campaignService;
    
    @Autowired
    private ServletContext servletContext;
    
    @Autowired
    private ApplicationService applicationService;
    
    @Autowired 
    private MemberDAO memberDAO;
    
    @Autowired
    private MemberService memberService;

    /* 관리자 페이지 이동 */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView admin(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("admin.jsp");
        ModelAndView mav = new ModelAndView("admin/admin_index");
        List<Integer> influencerData = memberDAO.getInfluencerData();
        List<Integer> companyData = memberDAO.getCompanyData();

        mav.addObject("influencerData", influencerData);
        mav.addObject("companyData", companyData);

        List<ApplicationDTO> applications = applicationService.getAllApplications();
        
	    List<CampaignDTO> campaigns = new ArrayList<>();
	    
	    for (ApplicationDTO application : applications) {
	        CampaignDTO campaign = campaignService.getMypageCampaigns(application.getCampaignNum());
	        
	        if (campaign != null) {
	            campaign.setApplications(application);
	            campaigns.add(campaign);
	        }
	    }
	    
	    mav.addObject("campaigns", campaigns);
	    mav.addObject("applications", applications);
        
        int influencerCount = memberService.getInfluencerCount();
        int companyCount = memberService.getCompanyCount();
        int campaignCount = memberService.getCampaignCount();
        int applicationCount = memberService.getApplicationCount();
        mav.addObject("influencerCount", influencerCount);
        mav.addObject("companyCount", companyCount);
        mav.addObject("campaignCount", campaignCount);
        mav.addObject("applicationCount", applicationCount);

        List<CampaignDTO> Bests = campaignService.getBestCampaigns();
        List<CampaignDTO> News = campaignService.getNewCampaigns();
        mav.addObject("Bests", Bests);
        mav.addObject("News", News);
        return mav;
    }
    
    /* 캠페인 관리 페이지 이동 */
    @RequestMapping(value = "/campaign", method = RequestMethod.GET)
    public ModelAndView campaign(HttpServletRequest request, HttpServletResponse response){
        System.out.println("campaign.jsp");
        ModelAndView mav = new ModelAndView("admin/campaign"); // 뷰 이름만 설정
        return mav;
    }
    
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView listCampaigns(
        @RequestParam(value = "page", defaultValue = "1") int page,
        @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
        @RequestParam(value = "city", required = false) String city,
        @RequestParam(value = "region", required = false) String region,
        @RequestParam(value = "mainCategory", required = false) String mainCategory,
        @RequestParam(value = "subCategory", required = false) String subCategory,
        @RequestParam(value = "searchBy", defaultValue = "campaignName") String searchBy,
        @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
        @RequestParam(value = "sortOption", defaultValue = "recent") String sortOption,
        Model model
    ) {
    	
        CampaignPagination pagination = new CampaignPagination(page, pageSize);
        
        // 페이지 번호와 페이지 크기를 가져옵니다.
        int currentPage = pagination.getPage();
        int currentPageSize = pagination.getPageSize();
        
        List<CampaignDTO> campaigns = null;
        
        int totalCampaigns = 0; // totalCampaigns 변수 초기화
        
        // city와 region이 제공되면 해당 조건으로 필터링된 결과를 가져옵니다.
        if (city != null && !city.isEmpty()) {
            if (region != null && !region.isEmpty()) {
                if (mainCategory != null && !mainCategory.isEmpty()) {
                    if (subCategory != null && !subCategory.isEmpty()) {
                        // 모든 조건이 제공되는 경우
                        campaigns = campaignService.getCampaignsByAllConditions(city, region, mainCategory, subCategory, page, pageSize);
                        totalCampaigns = campaignService.getTotalCampaignsByAllConditions(city, region, mainCategory, subCategory);
                    } else {
                        // city, region, mainCategory만 제공되는 경우
                        campaigns = campaignService.getCampaignsBycityRegionAndMainCategory(city, region, mainCategory, page, pageSize);
                        totalCampaigns = campaignService.getTotalCampaignsByCityRegionAndMainCategory(city, region, mainCategory);
                    }
                } else {
                    // city, region만 제공되는 경우
                    campaigns = campaignService.getCampaignsByCityAndRegion(city, region, page, pageSize);
                    totalCampaigns = campaignService.getTotalCampaignsByCityAndRegion(city, region);
                }
            } else if (mainCategory != null && !mainCategory.isEmpty()) {
                if (subCategory != null && !subCategory.isEmpty()) {
                    // city, mainCategory, subCategory만 제공되는 경우
                    campaigns = campaignService.getCampaignsBycityMainCategoryAndSubCategory(city, mainCategory, subCategory, page, pageSize);
                    totalCampaigns = campaignService.getTotalCampaignsByCityMainCategoryAndSubCategory(city, mainCategory, subCategory);
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
                    campaigns = campaignService.getCampaignsByregionMainCategoryAndSubCategory(region, mainCategory, subCategory, page, pageSize);
                    totalCampaigns = campaignService.getTotalCampaignsByRegionMainCategoryAndSubCategory(region, mainCategory, subCategory);
                } else {
                    // region, mainCategory만 제공되는 경우
                    campaigns = campaignService.getCampaignsByregionAndMainCategory(region, mainCategory, page, pageSize);
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
                campaigns = campaignService.getCampaignsBymainCategoryAndSubCategory(mainCategory, subCategory, page, pageSize);
                totalCampaigns = campaignService.getTotalCampaignsByMainCategoryAndSubCategory(mainCategory, subCategory);
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


        // 페이지 계산을 더 간단하게 수정합니다.
        int totalPages = (int) Math.ceil((double) totalCampaigns / currentPageSize);
        model.addAttribute("campaigns", campaigns);
        model.addAttribute("totalPages", totalPages);
        return new ModelAndView("admin/campaign");
    }

    // Campaign 추가 폼에 이미지 업로드 필드 추가
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showAddCampaignForm() {
        return "admin/campaign_reg"; // campaign/add.jsp로 이동
    }

    @RequestMapping(value = "/addCampaign", method = RequestMethod.POST)
    public String addCampaign(
        @RequestParam("imageFile") MultipartFile imageFile, 
        @RequestParam("detailImageFiles") List<MultipartFile> detailImageFiles, 
        @RequestParam("subImageFiles") List<MultipartFile> subImageFiles,
        CampaignDTO campaignDTO,
        Model model,
        HttpServletRequest request
    ) {
    	System.out.println("dd");
        try {
            String fileName = ""; // 이미지 파일명
            String filePath = ""; // 이미지 파일 경로
            List<String> detailimageFileNames = new ArrayList<>(); // 상세 이미지 파일명 목록
            List<String> detailimageFilePaths = new ArrayList<>(); // 상세 이미지 파일 경로 목록
            List<String> subImageFileNames = new ArrayList<>(); // 서브 이미지 파일명 목록
            List<String> subImageFilePaths = new ArrayList<>(); // 서브 이미지 파일 경로 목록

            // 이미지 업로드 및 처리
            if (!imageFile.isEmpty()) {
                fileName = imageFile.getOriginalFilename();
                // 웹 어플리케이션의 실제 경로를 가져옴
                String realPath = request.getSession().getServletContext().getRealPath("/resources/images/");
                // 업로드할 파일 경로 설정
                filePath = realPath + File.separator + fileName;
                File dest = new File(filePath);
                // 이미지 파일을 지정된 경로로 복사
                imageFile.transferTo(dest);
            }

            for (MultipartFile detailImageFile : detailImageFiles) {
                // 상세 페이지 이미지 업로드 및 처리
                if (!detailImageFile.isEmpty()) {
                    String detailImageFileName = detailImageFile.getOriginalFilename();
                    // 웹 어플리케이션의 실제 경로를 가져옴
                    String realPath = request.getSession().getServletContext().getRealPath("/resources/images/");
                    // 업로드할 파일 경로 설정
                    String detailImageFilePath = realPath + File.separator + detailImageFileName;
                    File dest = new File(detailImageFilePath);
                    // 상세 페이지 이미지 파일을 지정된 경로로 복사
                    detailImageFile.transferTo(dest);
                    detailimageFileNames.add(detailImageFileName);
                    detailimageFilePaths.add(detailImageFilePath);
                }
            }
            // 서브 이미지 업로드 및 처리
            for (MultipartFile subImageFile : subImageFiles) {
                if (!subImageFile.isEmpty()) {
                    String subImageFileName = subImageFile.getOriginalFilename();
                    // 웹 어플리케이션의 실제 경로를 가져옴
                    String realPath = request.getSession().getServletContext().getRealPath("/resources/images/");
                    // 업로드할 파일 경로 설정
                    String subImageFilePath = realPath + File.separator + subImageFileName;
                    File dest = new File(subImageFilePath);
                    // 서브 이미지 파일을 지정된 경로로 복사
                    subImageFile.transferTo(dest);
                    subImageFileNames.add(subImageFileName);
                    subImageFilePaths.add(subImageFilePath);
                }
            }

            // CampaignDTO에 이미지 정보 및 카테고리 설정
            campaignDTO.setImageFileName(fileName);
            campaignDTO.setImageFilePath(filePath);
            campaignDTO.setDetailimageFileNames(detailimageFileNames);
            campaignDTO.setDetailimageFilePaths(detailimageFilePaths);
            campaignDTO.setSubImageFileNames(subImageFileNames);
            campaignDTO.setSubImageFilePaths(subImageFilePaths);

            // 나머지 Campaign 추가 로직
            campaignService.addCampaign(campaignDTO);

            // 업로드 성공 메시지
            model.addAttribute("message", "이미지가 성공적으로 업로드되었습니다.");
            
            

        } catch (IOException e) {
            e.printStackTrace();
            // 업로드 실패 메시지
            model.addAttribute("message", "이미지 업로드에 실패했습니다.");
        }

        return "redirect:/admin/list?mainCategory=&region=";
    }

    
    // Campaign 수정 폼에 이미지 업로드 필드 추가
    @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
    public ModelAndView showEditCampaignForm(@PathVariable Long id) {
        CampaignDTO campaign = campaignService.getCampaignById(id);
        System.out.println(campaign.getDetailimageFileNames());
        ModelAndView modelAndView = new ModelAndView("admin/campaign_edit");
        modelAndView.addObject("campaign", campaign);
        return modelAndView;
    }
    
    @RequestMapping(value = "/{id}/editCampaign", method = RequestMethod.POST)
    public String editCampaign(
        @PathVariable Long id,
        @RequestParam("imageFile") MultipartFile imageFile,
        @RequestParam("detailImageFiles") List<MultipartFile> detailImageFiles,
        @RequestParam("subImageFiles") List<MultipartFile> subImageFiles,
        CampaignDTO campaignDTO,
        Model model
    ) {
        System.out.println(detailImageFiles);
        try {
            if (!imageFile.isEmpty()) {
                // 이미지 파일 업로드 및 CampaignDTO에 업데이트
                String realPath = servletContext.getRealPath("/resources/images/");
                String fileName = imageFile.getOriginalFilename();
                String filePath = realPath + File.separator + fileName;
                File dest = new File(filePath);
                imageFile.transferTo(dest);
                campaignDTO.setImageFileName(fileName);
                campaignDTO.setImageFilePath(filePath);
            }

            // 상세 이미지 업로드 및 CampaignDTO에 업데이트
            List<String> detailimageFileNames = new ArrayList<>();
            List<String> detailimageFilePaths = new ArrayList<>();
            for (MultipartFile detailImageFile : detailImageFiles) {
                if (!detailImageFile.isEmpty()) {
                    String detailImageFileName = detailImageFile.getOriginalFilename();
                    String realPath = servletContext.getRealPath("/resources/images/");
                    String detailImageFilePath = realPath + File.separator + detailImageFileName;
                    File detailImageDest = new File(detailImageFilePath);
                    detailImageFile.transferTo(detailImageDest);
                    detailimageFileNames.add(detailImageFileName);
                    detailimageFilePaths.add(detailImageFilePath);
                }
            }

            // 서브 이미지 업로드 및 CampaignDTO에 업데이트
            List<String> subImageFileNames = new ArrayList<>();
            List<String> subImageFilePaths = new ArrayList<>();
            for (MultipartFile subImageFile : subImageFiles) {
                if (!subImageFile.isEmpty()) {
                    String subImageFileName = subImageFile.getOriginalFilename();
                    String realPath = servletContext.getRealPath("/resources/images/");
                    String subImageFilePath = realPath + File.separator + subImageFileName;
                    File subImageDest = new File(subImageFilePath);
                    subImageFile.transferTo(subImageDest);
                    subImageFileNames.add(subImageFileName);
                    subImageFilePaths.add(subImageFilePath);
                }
            }

            campaignDTO.setDetailimageFileNames(detailimageFileNames); // 상세 이미지 파일명 목록 설정
            campaignDTO.setDetailimageFilePaths(detailimageFilePaths); // 상세 이미지 파일 경로 목록 설정
            campaignDTO.setSubImageFileNames(subImageFileNames); // 서브 이미지 파일명 목록 설정
            campaignDTO.setSubImageFilePaths(subImageFilePaths); // 서브 이미지 파일 경로 목록 설정

            // Campaign 정보 업데이트
            campaignDTO.setId(id);
            campaignService.updateCampaign(campaignDTO);

            // 업데이트 성공 메시지
            model.addAttribute("message", "Campaign updated successfully.");

        } catch (IOException e) {
            e.printStackTrace();
            // 업로드 실패 메시지
            model.addAttribute("message", "Failed to update campaign and images.");
        }

        return "redirect:/admin/list?mainCategory=&region=";
    }

    
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
    public String deleteCampaign(@PathVariable Long id, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        campaignService.deleteCampaign(id);
        String referer = request.getHeader("Referer");
        if (referer != null && !referer.isEmpty()) {
            return "redirect:" + referer;
        } else {
            return "redirect:/"; // 기본 리다이렉트 URL을 설정하세요.
        }
    }
    
    @RequestMapping(value = "/{id}/deleteImage", method = RequestMethod.POST)
    public String deleteImage(@PathVariable Long id, Model model, HttpServletRequest request) {
        CampaignDTO campaign = campaignService.getCampaignById(id);
        try {
            // 대표 이미지 파일 삭제 로직 (서버 파일 시스템에서 해당 파일 삭제)
            String imageFilePath = campaign.getImageFilePath();
            if (imageFilePath != null && !imageFilePath.isEmpty()) {
                File imageFile = new File(imageFilePath);
                if (imageFile.exists() && imageFile.delete()) {
                    // 파일 삭제 성공
                }
            }

            // 데이터베이스에서 대표 이미지 정보를 삭제하는 로직
            campaignService.deleteImage(id);

            // 이미지 삭제 성공 메시지
            model.addAttribute("message", "Image deleted successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            // 이미지 삭제 실패 메시지
            model.addAttribute("message", "Failed to delete Image.");
        }

        String currentUrl = request.getRequestURL().toString();
        System.out.println("Current URL: " + currentUrl);
        return "redirect:" + currentUrl;
    }

    
    @RequestMapping(value = "/{id}/deleteDetailImage", method = RequestMethod.DELETE)
    public String deleteDetailImage(@PathVariable Long id, Model model, HttpServletRequest request) {
        CampaignDTO campaign = campaignService.getCampaignById(id);
        try {
            // 상세 이미지 파일 삭제 로직 (서버 파일 시스템에서 해당 파일 삭제)
            List<String> detailImageFilePaths = campaign.getDetailimageFilePaths();
            if (detailImageFilePaths != null && !detailImageFilePaths.isEmpty()) {
                for (String filePath : detailImageFilePaths) {
                    File detailImageFile = new File(filePath);
                    if (detailImageFile.exists() && detailImageFile.delete()) {
                        // 파일 삭제 성공
                    }
                }
            }

            // 데이터베이스에서 상세 이미지 정보를 삭제하는 로직
            campaignService.deleteDetailImage(id);

            // 이미지 삭제 성공 메시지
            model.addAttribute("message", "Detail Image deleted successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            // 이미지 삭제 실패 메시지
            model.addAttribute("message", "Failed to delete Detail Image.");
        }
        // 현재 페이지의 URL로 리다이렉트
        String currentUrl = request.getRequestURL().toString();
        System.out.println("Current URL: " + currentUrl);
        return "redirect:" + currentUrl;
        
    }

    @RequestMapping(value = "/{id}/deleteSubImage", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteSubImage(@PathVariable Long id, @RequestParam("subImageFileName") String imageFilePath, Model model, HttpServletRequest request) {
        try {
            // 서브 이미지 파일 삭제 로직 (서버 파일 시스템에서 해당 파일 삭제)

            // 데이터베이스에서 서브 이미지 정보를 삭제하는 로직
            campaignService.deleteSubImage(id, imageFilePath);

            // 이미지 삭제 성공 메시지
            model.addAttribute("message", "Sub Image deleted successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            // 이미지 삭제 실패 메시지
            model.addAttribute("message", "Failed to delete Sub Image.");
        }
        String currentUrl = request.getRequestURL().toString();
        return "redirect:" + currentUrl;
    }
    
    @RequestMapping(value = "application/{id}", method = RequestMethod.GET)
    public ModelAndView application(@PathVariable Long id, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        ModelAndView modelAndView = new ModelAndView("admin/application");
        
        List<ApplicationDTO> applications = applicationService.getApplicationsByCampaignId(id);
        CampaignDTO campaign = campaignService.getCampaignById(id);

        if (applications.isEmpty()) {
            // 어플리케이션이 없는 경우 처리
            redirectAttributes.addFlashAttribute("errorMessage", "신청자가 없습니다.");
            return new ModelAndView("redirect:" + request.getHeader("Referer"));
        }
        
        modelAndView.addObject("applications", applications);
        modelAndView.addObject("campaign", campaign);
        
        return modelAndView;
    }



    @RequestMapping(value = "/application/{campaignNum}/{id}", method = RequestMethod.GET)
    public String selectApplication(@PathVariable Long campaignNum, @PathVariable Long id) {
	        applicationService.updateStatusToSelected(campaignNum, id);
	        return "redirect:/admin/application/{campaignNum}";
    }

    @RequestMapping(value = "/application/{campaignNum}/{id}/not", method = RequestMethod.GET)
    public String NotselectApplication(@PathVariable Long campaignNum, @PathVariable Long id) {
	        applicationService.NotselectApplication(campaignNum, id);
	        return "redirect:/admin/application/{campaignNum}";
    }
    
    @RequestMapping(value = "/application/{campaignNum}/{id}/cancel", method = RequestMethod.GET)
    public String cancelApplication(@PathVariable Long campaignNum, @PathVariable Long id, HttpServletRequest request) {
        applicationService.updateStatusToCancel(campaignNum, id);
        return "redirect:/admin/application/{campaignNum}";
    }
}
