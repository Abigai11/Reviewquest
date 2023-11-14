package com.project.reviewquest.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

@Service("MemberService")
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
		
	public boolean loginCheck(Map params, HttpSession session)
	{
		String division = (String) params.get("division");
		String id = (String) params.get("id");
		String name=null;
		
		System.out.println("Service진입 division : "+division);
		System.out.println(id);
		
		switch (division)
		{
	       case "influencer":
	    	   System.out.println("인플루언서 케이스");
	    	   name=memberDAO.loginCheck_influencer(params, session);
	    	   break;
	           
	       case "company":
	    	   System.out.println("가맹점 케이스");
	    	   name=memberDAO.loginCheck_company(params, session);
	           break;
	           
	       case "admin":
	    	   System.out.println("관리자 케이스");
	    	   name=memberDAO.loginCheck_admin(params, session);
	           break;
	    }
		
		System.out.println("로그인체크 다녀와서 name 값 확인 : "+name);
		
		boolean result=(name==null)?false:true;
		
		if(result)
		{
			switch (division)
			{
		       case "influencer":  
		    	   InfluencerDTO influencer=memberDAO.viewMember_influencer(id); 
		    	   memberDAO.sessionLogin(influencer,null,null,session);
		    	   break;
		           
		       case "company":
		    	   CompanyDTO companyDTO=memberDAO.viewMember_company(id); 
		    	   memberDAO.sessionLogin(null,companyDTO,null,session);
		           break;
		           
		       case "admin":
		    	   System.out.println("admin case 진입해서 dao 가기 전");
		    	   AdminDTO adminDTO=memberDAO.viewMember_admin(id); 
		    	   System.out.println("잘가져왔는지 mapper에서 adminDTO : "+adminDTO.getId());
		    	   
		    	   memberDAO.sessionLogin(null,null,adminDTO,session);
		           break;
		    }
		}
		return result;
	}
	
	
	

	
	/*관리자 전체 회원 목록조회*/
	public List<MemberDTO> listMembers()
	{
		List<MemberDTO> membersList=new ArrayList<>();
		
		List<InfluencerDTO> listMembers_influencer=memberDAO.listMembers_influencer();
		List<CompanyDTO> listMembers_company=memberDAO.listMembers_company();
		
		membersList.addAll(listMembers_influencer);
		membersList.addAll(listMembers_company);
		
		return membersList;
	}
	
    public int getInfluencerCount() {
        return memberDAO.getInfluencerCount();
    }

   public int getCompanyCount() {
        return memberDAO.getCompanyCount();
    }

   public int getCampaignCount() {
        return memberDAO.getCampaignCount();
    }

   public int getApplicationCount() {
        return memberDAO.getApplicationCount();
    }
}