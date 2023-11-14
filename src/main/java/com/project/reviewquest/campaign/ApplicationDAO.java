package com.project.reviewquest.campaign;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ApplicationRepository")
public class ApplicationDAO {
	@Autowired
	private SqlSession sqlSession;
    
    public void insertApplication(ApplicationDTO ApplicationDTO) {
        sqlSession.insert("CampaignDAO.insertApplication", ApplicationDTO);
    }

    public ApplicationDTO selectApplicationById(Long id) {
        return sqlSession.selectOne("CampaignDAO.selectApplication", id);
    }

    
    public void updateApplication(ApplicationDTO applicationDTO, Long id, String nickName) {
        sqlSession.update("CampaignDAO.updateApplication", applicationDTO);
    }
    
    public void deleteApplication(Long id, String nickName) {
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("nickName", nickName);
        
        sqlSession.delete("CampaignDAO.deleteApplication", params);
    }

	public void contentApplication(Long id, String nickName) {
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("nickName", nickName);
        sqlSession.update("CampaignDAO.contentApplication", params);	
	}
	
    public List<ApplicationDTO> getApplicationsByCampaignId(Long id) {
        return sqlSession.selectList("CampaignDAO.getApplicationsByCampaignId", id);
    }
    
    public void updateStatusToSelected(Long campaignNum, Long id) {
        Map<String, Long> params = new HashMap<>();
        params.put("campaignNum", campaignNum);
        params.put("id", id);
        sqlSession.update("CampaignDAO.updateStatusToSelected", params);
    }

	public void NotselectApplication(Long campaignNum, Long id) {
        Map<String, Long> params = new HashMap<>();
        params.put("campaignNum", campaignNum);
        params.put("id", id);
        sqlSession.update("CampaignDAO.NotselectApplication", params);
	}
	
	public void updateStatusToCancel(Long campaignNum, Long id) {
        Map<String, Long> params = new HashMap<>();
        params.put("campaignNum", campaignNum);
        params.put("id", id);
        sqlSession.update("CampaignDAO.updateStatusToCancel", params);
	}

	public ApplicationDTO getApplicationByCampaignId(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	public ApplicationDTO getApplications(Long id, String nickName) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("id", id);
	    params.put("nickName", nickName);
	    return sqlSession.selectOne("CampaignDAO.getApplications", params);
	}

	public List<ApplicationDTO> getNickApplications(String nickName) {
	    return sqlSession.selectList("CampaignDAO.getNickApplications", nickName);
	}

	public List<ApplicationDTO> getAllApplications() {
		 return sqlSession.selectList("CampaignDAO.getAllApplications");
	}


}
