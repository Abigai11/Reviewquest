package com.project.reviewquest.campaign;

import java.util.List;

public interface CampaignService {
    void addCampaign(CampaignDTO campaignDTO);
    void updateCampaign(CampaignDTO campaignDTO);
    void deleteCampaign(Long id);
    CampaignDTO getCampaignById(Long id);
    List<CampaignDTO> getAllCampaigns(int page, int pageSize);
    void deleteImage(Long campaignId);
    void deleteDetailImage(Long campaignId);
    void deleteSubImage(Long campaignId, String imageFilePath);
    List<CampaignDTO> getCampaignsByCityAndRegion(String city, String region, int page, int pageSize);
    List<CampaignDTO> getCampaignsByCity(String city, int page, int pageSize);
    List<CampaignDTO> getCampaignsByRegion(String region, int page, int pageSize);
    int getTotalCampaigns();
    List<CampaignDTO> getCampaignsBymainCategory(String mainCategory, int page, int pageSize);
    List<CampaignDTO> getCampaignsBysubCategory(String subCategory, int page, int pageSize);
    List<CampaignDTO> getCampaignsByCampaignName(String searchKeyword, int page, int pageSize);
    List<CampaignDTO> getCampaignsByCampaignPrice(String searchKeyword, int page, int pageSize);
    List<CampaignDTO> getCampaignsByAllConditions(String city, String region, String mainCategory, String subCategory,
            int page, int pageSize);
    int getTotalCampaignsByAllConditions(String city, String region, String mainCategory, String subCategory);
    int getTotalCampaignsByCityRegionAndMainCategory(String city, String region, String mainCategory);
    int getTotalCampaignsByCityAndRegion(String city, String region);
    int getTotalCampaignsByCityMainCategoryAndSubCategory(String city, String mainCategory, String subCategory);
    int getTotalCampaignsByCityAndMainCategory(String city, String mainCategory);
    int getTotalCampaignsByCity(String city);
    int getTotalCampaignsByRegionMainCategoryAndSubCategory(String region, String mainCategory, String subCategory);
    int getTotalCampaignsByRegionAndMainCategory(String region, String mainCategory);
    int getTotalCampaignsByRegion(String region);
    int getTotalCampaignsByMainCategoryAndSubCategory(String mainCategory, String subCategory);
    int getTotalCampaignsByMainCategory(String mainCategory);
    int getTotalCampaignsBySubCategory(String subCategory);
    int getTotalCampaignsByCampaignName(String searchKeyword);
    int getTotalCampaignsByCampaignPrice(String searchKeyword);
	List<CampaignDTO> getCampaignsBycityAndMainCategory(String city, String mainCategory, int page, int pageSize);
	List<CampaignDTO> getCampaignsBycityRegionAndMainCategory(String city, String region, String mainCategory, int page,
			int pageSize);
	List<CampaignDTO> getCampaignsBycityMainCategoryAndSubCategory(String city, String mainCategory, String subCategory,
			int page, int pageSize);
	List<CampaignDTO> getCampaignsByregionMainCategoryAndSubCategory(String region, String mainCategory,
			String subCategory, int page, int pageSize);
	List<CampaignDTO> getCampaignsByregionAndMainCategory(String region, String mainCategory, int page, int pageSize);
	List<CampaignDTO> getCampaignsBymainCategoryAndSubCategory(String mainCategory, String subCategory, int page,
			int pageSize);
	List<CampaignDTO> getCampaignsByCampaignTypes(String searchKeyword, int page, int pageSize);
	List<CampaignDTO> getCampaignsByCampaignDetails(String searchKeyword, int page, int pageSize);
	List<CampaignDTO> getCampaignsByCampaignKeyword(String searchKeyword, int page, int pageSize);
	List<CampaignDTO> getCampaignsByCampaignInformation(String searchKeyword, int page, int pageSize);
	int getTotalCampaignsByCampaignTypes(String searchKeyword);
    int getTotalCampaignsByCampaignDetails(String searchKeyword);
    int getTotalCampaignsByCampaignKeyword(String searchKeyword);
	int getTotalCampaignsByCampaignInformation(String searchKeyword);
    void incrementApplicantsCount(Long id);
	List<CampaignDTO> getBestCampaigns();
	List<CampaignDTO> getNewCampaigns();
	List<CampaignDTO> getDdayCampaigns();
	void incrementApplicantsDelete(Long id);
	CampaignDTO getMypageCampaigns(Long campaignNum);
	ApplicationDTO getregistrationDates(String nickName, Long campaignNum);

}
