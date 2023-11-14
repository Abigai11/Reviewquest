package com.project.reviewquest.campaign;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApplicationService {

    @Autowired
    private ApplicationDAO applicationDAO;

    @Autowired
    private CampaignService campaignService;

    public ApplicationDTO saveApplication(ApplicationDTO applicationDTO) {
        applicationDAO.insertApplication(applicationDTO);
        Long id = applicationDTO.getCampaignNum();
        campaignService.incrementApplicantsCount(id);
        return applicationDTO;
    }
    
    public ApplicationDTO selectApplication(Long id) {
        return applicationDAO.selectApplicationById(id);
    }
    

    public ApplicationDTO updateApplication(ApplicationDTO applicationDTO, Long id, String nickName) {
        applicationDAO.updateApplication(applicationDTO, id, nickName);
        return applicationDTO;
    }
	
    public void deleteApplication(Long id, String nickName) {
        applicationDAO.deleteApplication(id, nickName);
        campaignService.incrementApplicantsDelete(id);
    }
    
	public void contentApplication(Long id, String nickName) {
        applicationDAO.contentApplication(id, nickName);
	}
	
    public List<ApplicationDTO> getApplicationsByCampaignId(Long id) {
        List<ApplicationDTO> applications = applicationDAO.getApplicationsByCampaignId(id);

        // 가져온 어플리케이션 목록 반환
        return applications;
    }

    public void updateStatusToSelected(Long campaignNum, Long id) {
        applicationDAO.updateStatusToSelected(campaignNum, id);
    }

	public void NotselectApplication(Long campaignNum, Long id) {
	    applicationDAO.NotselectApplication(campaignNum, id);
	}
	
	public void updateStatusToCancel(Long campaignNum, Long id) {
		applicationDAO.updateStatusToCancel(campaignNum, id);
	}

	public ApplicationDTO getApplications(Long id, String nickName) {
		return applicationDAO.getApplications(id, nickName);
	}

	public List<ApplicationDTO> getNickApplications(String nickName) {
	    return applicationDAO.getNickApplications(nickName);
	}

	public List<ApplicationDTO> getAllApplications() {
		  return applicationDAO.getAllApplications();
	}

}
