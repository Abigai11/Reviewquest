package com.project.reviewquest.campaign;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.reviewquest.campaign.CampaignDTO;

@Service("CampaignService")
public class CampaignServiceImpl implements CampaignService {

    @Autowired
    private CampaignDAO campaignDAO;
    
    @Autowired
	private SqlSession sqlSession;

    @Override
    public void addCampaign(CampaignDTO campaignDTO) {
        campaignDAO.insertCampaign(campaignDTO);
    }

    @Override
    public void updateCampaign(CampaignDTO campaignDTO) {
        campaignDAO.updateCampaign(campaignDTO);
    }

    @Override
    public void deleteCampaign(Long id) {
        campaignDAO.deleteCampaign(id);
    }

    @Override
    public CampaignDTO getCampaignById(Long id) {
        return campaignDAO.getCampaignById(id);
    }

    @Override
    public List<CampaignDTO> getAllCampaigns(int page, int pageSize) {
        int start = (page - 1) * pageSize;
        return campaignDAO.getAllCampaigns(start, pageSize);
    }

    
    @Override
    public void deleteImage(Long campaignId) {
        CampaignDTO campaign = campaignDAO.getCampaignById(campaignId);
        String ImageFilePath = campaign.getImageFilePath();
        if (ImageFilePath != null && !ImageFilePath.isEmpty()) {
            File ImageFileFile = new File(ImageFilePath);
            if (ImageFileFile.exists()) {
                if (ImageFileFile.delete()) {
                    // 파일 삭제 성공
                } else {
                    // 파일 삭제 실패
                    throw new RuntimeException("대표 이미지 파일 삭제 실패");
                }
            }
        }
        // 데이터베이스에서 대표 이미지 정보 제거
        campaignDAO.deleteImage(campaignId);
    }
    
    @Override
    public void deleteDetailImage(Long campaignId) {
        CampaignDTO campaign = campaignDAO.getCampaignById(campaignId);
        List<String> detailimageFilePaths = campaign.getDetailimageFilePaths();
        if (detailimageFilePaths != null && !detailimageFilePaths.isEmpty()) {
            for (String filePath : detailimageFilePaths) {
                File detailImageFile = new File(filePath);
                if (detailImageFile.exists()) {
                    if (detailImageFile.delete()) {
                        // 파일 삭제 성공
                    } else {
                        // 파일 삭제 실패
                        throw new RuntimeException("상세 이미지 파일 삭제 실패");
                    }
                }
            }
        }
        // 데이터베이스에서 상세 이미지 정보 제거
        campaignDAO.deleteDetailImage(campaignId);
    }


    @Override
    public void deleteSubImage(Long campaignId, String imageFilePath) {
        String subImageFilePath = imageFilePath;
        if (subImageFilePath != null && !subImageFilePath.isEmpty()) {
            File subImageFile = new File(subImageFilePath);
            if (subImageFile.exists()) {
                if (subImageFile.delete()) {
                    // 파일 삭제 성공
                } else {
                    // 파일 삭제 실패
                    throw new RuntimeException("서브 이미지 파일 삭제 실패");
                }
            }
        }
        // 데이터베이스에서 서브 이미지 정보 제거
        campaignDAO.deleteSubImage(campaignId, imageFilePath);
    }
    @Override
    public List<CampaignDTO> getCampaignsByRegion(String region, int page, int pageSize) {
        return campaignDAO.getCampaignsByRegion(region, page, pageSize);
    }

    
    @Override
    public List<CampaignDTO> getCampaignsByCity(String city, int page, int pageSize) {
        return campaignDAO.getCampaignsByCity(city, page, pageSize);
    }
	
    @Override
    public int getTotalCampaigns() {
        return campaignDAO.getTotalCampaignCount(); // DAO 메서드를 통해 데이터베이스에서 캠페인 개수 조회
    }


    @Override
    public List<CampaignDTO> getCampaignsBymainCategory(String mainCategory, int page, int pageSize) {
    	int start = (page - 1) * pageSize;
    	return campaignDAO.getCampaignsBymainCategory(mainCategory,start,pageSize);
    }

    @Override
    public List<CampaignDTO> getCampaignsBysubCategory(String subCategory, int page, int pageSize) {
    	int start = (page - 1) * pageSize;
    	return campaignDAO.getCampaignsBysubCategory(subCategory,start,pageSize);
    }
    
    @Override
    public List<CampaignDTO> getCampaignsByCampaignName(String searchKeyword, int page, int pageSize) {
    	int start = (page - 1) * pageSize;
    	return campaignDAO.getCampaignsByCampaignName(searchKeyword,start,pageSize);
    }
    
    @Override
    public List<CampaignDTO> getCampaignsByCampaignPrice(String searchKeyword, int page, int pageSize) {
    	int start = (page - 1) * pageSize;
    	return campaignDAO.getCampaignsByCampaignPrice(searchKeyword,start,pageSize);
    }

	@Override
	public List<CampaignDTO> getCampaignsByAllConditions(String city, String region, String mainCategory, String subCategory , int page, int pageSize) {
		int start = (page - 1) * pageSize;
		return campaignDAO.getCampaignsByAllConditions(city,region, mainCategory , subCategory ,start,pageSize);
	}

	@Override
	public List<CampaignDTO> getCampaignsBycityAndMainCategory(String city, String mainCategory, int page, int pageSize) {
		int start = (page - 1) * pageSize;
		return campaignDAO.getCampaignsBycityAndMainCategory(city,mainCategory,start, pageSize);
	}
	

	@Override
	public List<CampaignDTO> getCampaignsByCityAndRegion(String city, String region, int page, int pageSize) {
		int start = (page - 1) * pageSize;
		return campaignDAO.getCampaignsByCityAndRegion(city, region, start, pageSize);
	}

	@Override
	public List<CampaignDTO> getCampaignsBycityRegionAndMainCategory(String city, String region, String mainCategory,
			int page, int pageSize) {
		int start = (page - 1) * pageSize;
		return campaignDAO.getCampaignsBycityRegionAndMainCategory(city, region, mainCategory, start, pageSize);
	}

	@Override
	public List<CampaignDTO> getCampaignsBycityMainCategoryAndSubCategory(String city, String mainCategory,
			String subCategory, int page, int pageSize) {
		int start = (page - 1) * pageSize;
		return campaignDAO.getCampaignsBycityMainCategoryAndSubCategory(city, mainCategory, subCategory, start, pageSize);
	}

	@Override
	public List<CampaignDTO> getCampaignsByregionMainCategoryAndSubCategory(String region, String mainCategory,
			String subCategory, int page, int pageSize) {  
		int start = (page - 1) * pageSize;
		return campaignDAO.getCampaignsByregionMainCategoryAndSubCategory(region, mainCategory, subCategory, start, pageSize);
	}
	
	@Override
	public List<CampaignDTO> getCampaignsByregionAndMainCategory(String region, String mainCategory, int page,
			int pageSize) {
		int start = (page - 1) * pageSize;
		return campaignDAO.getCampaignsByregionAndMainCategory(region, mainCategory, start, pageSize);
	}
	
	@Override
	public List<CampaignDTO> getCampaignsBymainCategoryAndSubCategory(String mainCategory, String subCategory, int page,
			int pageSize) {
		int start = (page - 1) * pageSize;
		return campaignDAO.getCampaignsBymainCategoryAndSubCategory(mainCategory, subCategory, start, pageSize);
	}
	
	@Override
	public int getTotalCampaignsByAllConditions(String city, String region, String mainCategory, String subCategory) {
		return campaignDAO.getTotalCampaignsByAllConditions(city,region,mainCategory ,subCategory);
	}
	@Override
	public int getTotalCampaignsByCityRegionAndMainCategory(String city, String region, String mainCategory) {
		return campaignDAO.getTotalCampaignsByCityRegionAndMainCategory(city,region,mainCategory);
	}
	@Override
	public int getTotalCampaignsByCityAndRegion(String city, String region) {
		return campaignDAO.getTotalCampaignsByCityAndRegion(city,region);
	}
	@Override
	public int getTotalCampaignsByCityMainCategoryAndSubCategory(String city, String mainCategory, String subCategory) {
		return campaignDAO.getTotalCampaignsByCityMainCategoryAndSubCategory(city,mainCategory, subCategory);
	}
	
	@Override
	public int getTotalCampaignsByCityAndMainCategory(String city, String mainCategory) {
		return campaignDAO.getTotalCampaignsByCityAndMainCategory(city,mainCategory);
	}

	@Override
	public int getTotalCampaignsByCity(String city) {
		return campaignDAO.getTotalCampaignsByCity(city);
	}
	
	@Override
	public int getTotalCampaignsByRegionMainCategoryAndSubCategory(String region, String mainCategory, String subCategory) {
		return campaignDAO.getTotalCampaignsByRegionMainCategoryAndSubCategory(region,mainCategory,subCategory);
	}
	
	@Override
	public int getTotalCampaignsByRegionAndMainCategory(String region, String mainCategory) {
		return campaignDAO.getTotalCampaignsByRegionAndMainCategory(region,mainCategory);
	}
	
	@Override
	public int getTotalCampaignsByRegion(String region) {
		return campaignDAO.getTotalCampaignsByRegion(region);
	}
	
	@Override
	public int getTotalCampaignsByMainCategoryAndSubCategory(String mainCategory, String subCategory) {
		return campaignDAO.getTotalCampaignsByMainCategoryAndSubCategory(mainCategory,subCategory);
	}
	
	@Override
	public int getTotalCampaignsByMainCategory(String mainCategory) {
		return campaignDAO.getTotalCampaignsByMainCategory(mainCategory);
	}
	
	@Override
	public int getTotalCampaignsBySubCategory(String subCategory) {
		return campaignDAO.getTotalCampaignsBySubCategory(subCategory);
	}
	
	@Override
	public int getTotalCampaignsByCampaignName(String searchKeyword) {
		return campaignDAO.getTotalCampaignsByCampaignName(searchKeyword);
	}
	
	@Override
	public int getTotalCampaignsByCampaignPrice(String searchKeyword) {
		return campaignDAO.getTotalCampaignsByCampaignPrice(searchKeyword);
	}

	@Override
	public List<CampaignDTO> getCampaignsByCampaignTypes(String searchKeyword, int page, int pageSize) {
		return campaignDAO.getCampaignsByCampaignTypes(searchKeyword ,page, pageSize);
	}

	@Override
	public List<CampaignDTO> getCampaignsByCampaignDetails(String searchKeyword, int page, int pageSize) {
		return campaignDAO.getCampaignsByCampaignDetails(searchKeyword ,page, pageSize);
	}

	@Override
	public List<CampaignDTO> getCampaignsByCampaignKeyword(String searchKeyword, int page, int pageSize) {
		return campaignDAO.getCampaignsByCampaignKeyword(searchKeyword ,page, pageSize);
	}

	@Override
	public List<CampaignDTO> getCampaignsByCampaignInformation(String searchKeyword, int page, int pageSize) {
		return campaignDAO.getCampaignsByCampaignInformation(searchKeyword ,page, pageSize);
	}

	@Override
	public int getTotalCampaignsByCampaignTypes(String searchKeyword) {
		return campaignDAO.getTotalCampaignsByCampaignTypes(searchKeyword);
	}

	@Override
	public int getTotalCampaignsByCampaignDetails(String searchKeyword) {
		return campaignDAO.getTotalCampaignsByCampaignDetails(searchKeyword);
	}

	@Override
	public int getTotalCampaignsByCampaignKeyword(String searchKeyword) {
	    System.out.println(searchKeyword + "키워드 DAO 도착");
		return campaignDAO.getTotalCampaignsByCampaignKeyword(searchKeyword);
	}

	@Override
	public int getTotalCampaignsByCampaignInformation(String searchKeyword) {
		return campaignDAO.getTotalCampaignsByCampaignInformation(searchKeyword);
	}

    public void incrementApplicantsCount(Long id) {
        campaignDAO.incrementApplicantsCount(id);
    }

    public void incrementApplicantsDelete(Long id) {
        campaignDAO.incrementApplicantsDelete(id);
    }
    
	@Override
	public List<CampaignDTO> getBestCampaigns() {
		return campaignDAO.getBestCampaigns();
	}

	@Override
	public List<CampaignDTO> getNewCampaigns() {
		return campaignDAO.getNewCampaigns();
	}

	@Override
	public List<CampaignDTO> getDdayCampaigns() {
		return campaignDAO.getDdayCampaigns();
	}

	@Override
	public CampaignDTO getMypageCampaigns(Long campaignNum) {
		return campaignDAO.getMypageCampaigns(campaignNum);
	}

	@Override
	public ApplicationDTO getregistrationDates(String nickName, Long id) {
		return campaignDAO.getregistrationDates(nickName, id);
	}

}
