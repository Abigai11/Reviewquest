package com.project.reviewquest.campaign;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.sql.Date;
import java.time.Duration;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class CampaignDTO {
    private Long id; // 캠페인 ID
    private Date registrationDate; //캠페인 등록일
    private String campaignName; // 캠페인명
    private String campaignPrice; // 캠페인 제공 단가
    private Date startDate; // 캠페인 신청 기간
    private Date endDate; // 캠페인 마감 기간
    private Date selectDate; // 캠페인 선정 일자
    private Date registrationStart; //콘텐츠 등록기간 시작
    private Date registrationEnd; //콘텐츠 등록기간 종료
    private int selectedCandidates; //선정자수
    private int applicants; //신청자수
    private List<String> campaignTypes; // 캠페인 유형
    private String snsIcon; //SNS아이콘
    private String imageFileName; // 대표 이미지 파일명
    private String imageFilePath; // 대표 이미지 경로
    private List<String> detailimageFileNames; // 상세 페이지 파일명
    private List<String> detailimageFilePaths; // 상세 페이지 경로
    private List<String> subImageFileNames; // 서브 이미지 파일명 목록
    private List<String> subImageFilePaths; // 서브 이미지 경로 목록
    private String providedDetails; //제공내역
    private String keyword; //검색 키워드
    private String notification; //안내사항
    private String companyInformation; //업체정보
    private String mainCategory; // 1차 카테고리
    private String subCategory; //2차 카테고리
    private String city; //지역별
    private String region; // 상세지역별
    private ApplicationDTO applications;

    

	public ApplicationDTO getApplications() {
		return applications;
	}

	public void setApplications(ApplicationDTO applications) {
		this.applications = applications;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getProvidedDetails() {
		return providedDetails;
	}

	public void setProvidedDetails(String providedDetails) {
		this.providedDetails = providedDetails;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCampaignName() {
		return campaignName;
	}

	public void setCampaignName(String campaignName) {
		this.campaignName = campaignName;
	}

	public String getCampaignPrice() {
		return campaignPrice;
	}

	public void setCampaignPrice(String campaignPrice) {
		this.campaignPrice = campaignPrice;
	}



	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getSelectDate() {
		return selectDate;
	}

	public void setSelectDate(Date selectDate) {
		this.selectDate = selectDate;
	}

	public Date getRegistrationStart() {
		return registrationStart;
	}

	public void setRegistrationStart(Date registrationStart) {
		this.registrationStart = registrationStart;
	}

	public Date getRegistrationEnd() {
		return registrationEnd;
	}

	public void setRegistrationEnd(Date registrationEnd) {
		this.registrationEnd = registrationEnd;
	}


	public int getSelectedCandidates() {
		return selectedCandidates;
	}

	public void setSelectedCandidates(int selectedCandidates) {
		this.selectedCandidates = selectedCandidates;
	}

	public int getApplicants() {
		return applicants;
	}

	public void setApplicants(int applicants) {
		this.applicants = applicants;
	}

	public String getCompanyInformation() {
		return companyInformation;
	}

	public void setCompanyInformation(String companyInformation) {
		this.companyInformation = companyInformation;
	}

	public String getSnsIcon() {
		return snsIcon;
	}

	public void setSnsIcon(String snsIcon) {
		this.snsIcon = snsIcon;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImageFilePath() {
		return imageFilePath;
	}

	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}


	public List<String> getDetailimageFileNames() {
	    return detailimageFileNames;
	}

	public void setDetailimageFileNames(List<String> detailimageFileNames) {
		this.detailimageFileNames = detailimageFileNames;
	}

	public List<String> getDetailimageFilePaths() {
		return detailimageFilePaths;
	}

	public void setDetailimageFilePaths(List<String> detailimageFilePaths) {
		this.detailimageFilePaths = detailimageFilePaths;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getNotification() {
		return notification;
	}

	public void setNotification(String notification) {
		this.notification = notification;
	}

	public String getcompanyInformation() {
		return companyInformation;
	}

	public void setcompanyInformation(String companyInformation) {
		this.companyInformation = companyInformation;
	}

	public List<String> getSubImageFileNames() {
		return subImageFileNames;
	}

	public void setSubImageFileNames(List<String> subImageFileNames) {
		this.subImageFileNames = subImageFileNames;
	}

	public List<String> getSubImageFilePaths() {
		return subImageFilePaths;
	}

	public void setSubImageFilePaths(List<String> subImageFilePaths) {
		this.subImageFilePaths = subImageFilePaths;
	}

	public String getMainCategory() {
		return mainCategory;
	}

	public void setMainCategory(String mainCategory) {
		this.mainCategory = mainCategory;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

    public List<String> getCampaignTypes() {
		return campaignTypes;
	}

	public void setCampaignTypes(List<String> campaignTypes) {
		this.campaignTypes = campaignTypes;
	}
	
	public long daysUntilEndDate() {
	    LocalDate currentDate = LocalDate.now();
	    long daysRemaining = ChronoUnit.DAYS.between(currentDate, endDate.toLocalDate());
	    return daysRemaining;
	}
	
    public String getCampaignStatus() {
        LocalDate currentDate = LocalDate.now();
        if (currentDate.isBefore(startDate.toLocalDate())) {
            return "캠페인 신청 대기중";
        } else if (currentDate.isBefore(endDate.toLocalDate())) {
            return "캠페인 신청진행중";
        } else if (currentDate.isBefore(selectDate.toLocalDate())) {
            return "캠페인 선정완료";
        } else if (currentDate.isBefore(registrationEnd.toLocalDate())) {
            return "캠페인 등록 진행중";
        } else {
            return "캠페인 진행 종료";
        }
    }

    public String getCampaignStatusClass() {
        LocalDate currentDate = LocalDate.now();
        if (currentDate.isBefore(startDate.toLocalDate())) {
            return "bg-gradient-waiting"; // 대기 중일 때 클래스
        } else if (currentDate.isBefore(endDate.toLocalDate())) {
            return "bg-gradient-in-progress"; // 진행 중일 때 클래스
        } else if (currentDate.isBefore(selectDate.toLocalDate())) {
            return "bg-gradient-complete"; // 선정 완료일 때 클래스
        } else if (currentDate.isBefore(registrationEnd.toLocalDate())) {
            return "bg-gradient-registration"; // 등록 중일 때 클래스
        } else {
            return "bg-gradient-ended"; // 종료일 때 클래스
        }
    }

}   

