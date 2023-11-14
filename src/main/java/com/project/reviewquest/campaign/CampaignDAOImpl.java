package com.project.reviewquest.campaign;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.reviewquest.campaign.CampaignPagination;

import com.project.reviewquest.campaign.CampaignDTO;

@Repository("CampaignRepository")
public class CampaignDAOImpl implements CampaignDAO {

	@Autowired
	private SqlSession sqlSession;
    
    @Override
    public void insertCampaign(CampaignDTO campaignDTO) {
        sqlSession.insert("CampaignDAO.insertCampaign", campaignDTO);
    }

    @Override
    public void updateCampaign(CampaignDTO campaignDTO) {
        sqlSession.update("CampaignDAO.updateCampaign", campaignDTO);
    }

    @Override
    public void deleteCampaign(Long id) {
        sqlSession.delete("CampaignDAO.deleteCampaign", id);
    }

    @Override
    public CampaignDTO getCampaignById(Long id) {
        return sqlSession.selectOne("CampaignDAO.getCampaignById", id);
    }

    @Override
    public List<CampaignDTO> getAllCampaigns(int page, int pageSize) {
        return sqlSession.selectList("CampaignDAO.getAllCampaigns", new CampaignPagination(page, pageSize));
    }

    @Override
    public void deleteImage(Long campaignId) {
        sqlSession.update("CampaignDAO.deletemage", campaignId);
    }
    
    @Override
    public void deleteDetailImage(Long campaignId) {
        sqlSession.update("CampaignDAO.deleteDetailImage", campaignId);
    }


	@Override
	public void deleteSubImage(Long campaignId, String imageFilePath) {
		// TODO Auto-generated method stub
	}
	

    @Override
    public List<CampaignDTO> getCampaignsByCity(String city, int page, int pageSize) {
        Map<String, Object> params = new HashMap<>();
        params.put("city", city);
        params.put("page", page);
        params.put("pageSize", pageSize);
        System.out.println(city+"DAO");
        return sqlSession.selectList("CampaignDAO.getCampaignsByCity", params);
    }

    @Override
    public List<CampaignDTO> getCampaignsByCityAndRegion(String city, String region, int page, int pageSize) {
        Map<String, Object> params = new HashMap<>();
        params.put("city", city);
        params.put("region", region);
        params.put("page", page);
        params.put("page", pageSize);
        return sqlSession.selectList("CampaignDAO.getCampaignsByCityAndRegion", params);
    }
    
    @Override
    public int getTotalCampaignCount() {
        return sqlSession.selectOne("CampaignDAO.getTotalCampaignCount");
    }

	@Override
	public List<CampaignDTO> getCampaignsBymainCategory(String mainCategory, int page, int pageSize) {
        Map<String, Object> params = new HashMap<>();
        params.put("mainCategory", mainCategory);
        params.put("page", page);
        params.put("pageSize", pageSize);
        return sqlSession.selectList("CampaignDAO.getCampaignsBymainCategory", params);
	}

	@Override
	public List<CampaignDTO> getCampaignsBysubCategory(String subCategory, int page, int pageSize) {
        Map<String, Object> params = new HashMap<>();
        params.put("subCategory", subCategory);
        params.put("page", page);
        params.put("pageSize", pageSize);
        return sqlSession.selectList("CampaignDAO.getCampaignsBysubCategory", params);
	}

	@Override
	public List<CampaignDTO> getCampaignsByCampaignName(String searchKeyword, int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("searchKeyword", searchKeyword);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsByCampaignName", params);
	}

	@Override
	public List<CampaignDTO> getCampaignsByCampaignPrice(String searchKeyword, int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("searchKeyword", searchKeyword);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsByCampaignPrice", params);
	}
	

	@Override
	public List<CampaignDTO> getCampaignsByCampaignTypes(String searchKeyword, int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("searchKeyword", searchKeyword);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsByCampaignTypes", params);
	}


	@Override
	public List<CampaignDTO> getCampaignsByCampaignDetails(String searchKeyword, int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("searchKeyword", searchKeyword);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsByCampaignDetails", params);
	}

	@Override
	public List<CampaignDTO> getCampaignsByCampaignKeyword(String searchKeyword, int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("searchKeyword", searchKeyword);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsByCampaignKeyword", params);
	}


	@Override
	public List<CampaignDTO> getCampaignsByCampaignInformation(String searchKeyword, int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("searchKeyword", searchKeyword);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsByCampaignInformation", params);
	}
	@Override
	public List<CampaignDTO> getCampaignsByAllConditions(String city, String region, String mainCategory, String subCategory,
			int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("city", city);
	    params.put("region", region);
	    params.put("mainCategory", mainCategory);
	    params.put("subCategory", subCategory);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsByAllConditions", params);
	}
	
	@Override
	public List<CampaignDTO> getCampaignsByRegion(String region, int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("region", region);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsByRegion", params);

	}
	
	@Override
	public List<CampaignDTO> getCampaignsBycityRegionAndMainCategory(String city, String region, String mainCategory, int page,
			int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("city", city);
	    params.put("region", region);
	    params.put("mainCategory", mainCategory);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsBycityRegionAndMainCategory", params);
	}
	
	@Override
	public List<CampaignDTO> getCampaignsBycityMainCategoryAndSubCategory(String region, String mainCategory, String subCategory,
			int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("region", region);
	    params.put("mainCategory", mainCategory);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsBycityMainCategoryAndSubCategory", params);
	}
	
	@Override
	public List<CampaignDTO> getCampaignsBycityAndMainCategory(String city, String mainCategory, int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("city", city);
	    params.put("mainCategory", mainCategory);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsBycityAndMainCategory", params);
	}
	
	@Override
	public List<CampaignDTO> getCampaignsByregionMainCategoryAndSubCategory(String region, String mainCategory,
			String subCategory, int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("region", region);
	    params.put("mainCategory", mainCategory);
	    params.put("subCategory", subCategory);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsByregionMainCategoryAndSubCategory", params);
	}
	
	public List<CampaignDTO> getCampaignsByregionAndMainCategory(String region, String mainCategory, int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("region", region);
	    params.put("mainCategory", mainCategory);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsByregionAndMainCategory", params);
	}
	
	public List<CampaignDTO> getCampaignsBymainCategoryAndSubCategory(String mainCategory, String subCategory, int page,
			int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("mainCategory", mainCategory);
	    params.put("subCategory", subCategory);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsBymainCategoryAndSubCategory", params);
	}

	@Override
	public List<CampaignDTO> getCampaignsBycityAndMainCategory(String city, String region, String mainCategory,
			int page, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("city", city);
	    params.put("region", region);
	    params.put("page", page);
	    params.put("pageSize", pageSize);
	    return sqlSession.selectList("CampaignDAO.getCampaignsBycityAndMainCategory", params);
	}

	@Override
	public int getTotalCampaignsByCityRegionAndMainCategory(String city, String region, String mainCategory) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("city", city);
	    params.put("region", region);
	    params.put("mainCategory", mainCategory);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByCityRegionAndMainCategory", params);
	}

	@Override
	public int getTotalCampaignsByCityRegionAndMainCategory(String city, String region) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("city", city);
	    params.put("region", region);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByCityRegionAndMainCategory", params);
	}

	@Override
	public int getTotalCampaignsByCityMainCategoryAndSubCategory(String city, String mainCategory, String subCategory) {
		Map<String, Object> params = new HashMap<>();
	    params.put("city", city);
	    params.put("mainCategory", mainCategory);
	    params.put("subCategory", subCategory);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByCityMainCategoryAndSubCategory", params);
	}

	@Override
	public int getTotalCampaignsByCityAndMainCategory(String city, String mainCategory) {
		Map<String, Object> params = new HashMap<>();
	    params.put("city", city);
	    params.put("mainCategory", mainCategory);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByCityAndMainCategory", params);
	}

	@Override
	public int getTotalCampaignsByCity(String city) {
		Map<String, Object> params = new HashMap<>();
	    params.put("city", city);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByCity", params);
	}

	@Override
	public int getTotalCampaignsByRegionMainCategoryAndSubCategory(String region, String mainCategory,
			String subCategory) {
		Map<String, Object> params = new HashMap<>();
	    params.put("region", region);
	    params.put("mainCategory", mainCategory);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByRegionMainCategoryAndSubCategory", params);
	}

	@Override
	public int getTotalCampaignsByRegionAndMainCategory(String region, String mainCategory) {
		Map<String, Object> params = new HashMap<>();
	    params.put("region", region);
	    params.put("mainCategory", mainCategory);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByRegionAndMainCategory", params);
	}

	@Override
	public int getTotalCampaignsByRegion(String region) {
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByRegion", region);
	}

	@Override
	public int getTotalCampaignsByMainCategoryAndSubCategory(String mainCategory, String subCategory) {
		Map<String, Object> params = new HashMap<>();
	    params.put("mainCategory", mainCategory);
	    params.put("subCategory", subCategory);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByMainCategoryAndSubCategory", params);
	}

	@Override
	public int getTotalCampaignsByMainCategory(String mainCategory) {
		Map<String, Object> params = new HashMap<>();
	    params.put("mainCategory", mainCategory);
	    System.out.println(mainCategory + "메인 도착");
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByMainCategory", params);
	}

	@Override
	public int getTotalCampaignsBySubCategory(String subCategory) {
		Map<String, Object> params = new HashMap<>();
	    params.put("subCategory", subCategory);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsBySubCategory", params);
	}

	@Override
	public int getTotalCampaignsByCampaignName(String searchKeyword) {
		Map<String, Object> params = new HashMap<>();
	    params.put("searchKeyword", searchKeyword);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByCampaignName", params);
	}

	@Override
	public int getTotalCampaignsByCampaignPrice(String searchKeyword) {
		Map<String, Object> params = new HashMap<>();
	    params.put("searchKeyword", searchKeyword);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByCampaignPrice", params);
	}

	@Override
	public int getTotalCampaignsByCityAndRegion(String city, String region) {
		Map<String, Object> params = new HashMap<>();
	    params.put("city", city);
	    params.put("region", region);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByCityAndRegion", params);
	}

	@Override
	public int getTotalCampaignsByAllConditions(String city, String region, String mainCategory,
			String subCategory) {
		Map<String, Object> params = new HashMap<>();
	    params.put("city", city);
	    params.put("region", region);
	    params.put("mainCategory", mainCategory);
	    params.put("subCategory", subCategory);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByAllConditions", params);
	}


	@Override
	public int getTotalCampaignsByCampaignTypes(String searchKeyword) {
		Map<String, Object> params = new HashMap<>();
	    params.put("searchKeyword", searchKeyword);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByCampaignTypes", params);
	}


	@Override
	public int getTotalCampaignsByCampaignDetails(String searchKeyword) {
		Map<String, Object> params = new HashMap<>();
	    params.put("searchKeyword", searchKeyword);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByCampaignDetails", params);
	}


	@Override
	public int getTotalCampaignsByCampaignKeyword(String searchKeyword) {
		Map<String, Object> params = new HashMap<>();
	    params.put("searchKeyword", searchKeyword);
	    System.out.println(searchKeyword + "키워드 DAO 도착");
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByCampaignKeyword", params);
	}


	@Override
	public int getTotalCampaignsByCampaignInformation(String searchKeyword) {
		Map<String, Object> params = new HashMap<>();
	    params.put("searchKeyword", searchKeyword);
	    return sqlSession.selectOne("CampaignDAO.getTotalCampaignsByCampaignInformation", params);
	}

	@Override
	public void incrementApplicantsCount(Long id) {
	    sqlSession.update("CampaignDAO.incrementApplicantsCount", id);
	}
	
	@Override
	public void incrementApplicantsDelete(Long id) {
	    sqlSession.update("CampaignDAO.incrementApplicantsDelete", id);
	}
	
	@Override
	public List<CampaignDTO> getBestCampaigns() {
        return sqlSession.selectList("CampaignDAO.getBestCampaigns");
    }

	@Override
	public List<CampaignDTO> getNewCampaigns() {
        return sqlSession.selectList("CampaignDAO.getNewCampaigns");
    }

	@Override
	public List<CampaignDTO> getDdayCampaigns() {
        return sqlSession.selectList("CampaignDAO.getDdayCampaigns");
    }

	@Override
	public CampaignDTO getMypageCampaigns(Long campaignNum) {
		 return sqlSession.selectOne("CampaignDAO.getMypageCampaigns", campaignNum);
	}

	@Override
	public ApplicationDTO getregistrationDates(String nickName, Long id) {
		Map<String, Object> params = new HashMap<>();
	    params.put("nickName", nickName);
	    params.put("id", id);
	    return sqlSession.selectOne("CampaignDAO.getregistrationDates", params);
	}





	
}

