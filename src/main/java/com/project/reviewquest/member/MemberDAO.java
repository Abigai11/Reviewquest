package com.project.reviewquest.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

@Repository("memberDAO")
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	/*인증코드저장*/
	public void saveVerificationCode(EmailDTO emailDTO) throws Exception
	{
		System.out.println("dao도착");
		System.out.println(emailDTO.getEmail());
        System.out.println(emailDTO.getVerificationcode());
	    sqlSession.insert("mapper.member.insert_Verificationcode", emailDTO);
	}
	
	/*이메일 인증 확인*/
	public int confirm_Verificationcode(EmailDTO emailDTO) throws Exception
	{
		int result=sqlSession.selectOne("mapper.member.confirm_Verificationcode",emailDTO);
		return result;
	}
	
	
	/*오버라이딩 체크하기*/
	/*인플루언서 회원가입*/
	public void addMember_influencer(InfluencerDTO influencerDTO) throws Exception
	{
		System.out.println("인플루언서 회원가입");
		sqlSession.insert("mapper.member.insertMember_influencer", influencerDTO);	
	}
	
	/*가맹점 회원가입*/
	public void addMember_company(CompanyDTO companyDTO) throws Exception
	{
		System.out.println("가맹점 회원가입");
		sqlSession.insert("mapper.member.insertMember_company", companyDTO);	
	}
	
	/*가맹점 회원가입*/
	public void addMember(String division, CompanyDTO companyDTO) throws Exception
	{
		sqlSession.insert("mapper.member.insertMember",companyDTO);	
	}
	
	/*ID 중복 검사 input.jsp에서 ajax로 검증*/
	public int overlapped_id(String id) throws Exception
	{
		int result=0;
		int count_influencer=sqlSession.selectOne("mapper.member.selectOverlapped_ID_influencer",id);
		int count_company=sqlSession.selectOne("mapper.member.selectOverlapped_ID_company",id);
		int count_admin=sqlSession.selectOne("mapper.member.selectOverlapped_ID_admin",id);
		 if (count_influencer > 0 || count_company > 0 || count_admin > 0) {
		        result = 1; // 중복이 발견됨
		    }		  
		 System.out.println("id 중복 체크 중. count 값 : "+result);
		return result;
	}
		
	/*닉네임 중복 검사 input.jsp에서 ajax로 검증*/
	public int overlapped_nickName(String nickName) throws Exception
	{
		int result=0;
		int count_influencer=sqlSession.selectOne("mapper.member.selectOverlapped_nickName_influencer",nickName);
		int count_company=sqlSession.selectOne("mapper.member.selectOverlapped_nickName_company",nickName);
		int count_admin=sqlSession.selectOne("mapper.member.selectOverlapped_nickName_admin",nickName);
		 if (count_influencer > 0 || count_company > 0 || count_admin > 0) {
		        result = 1; // 중복이 발견됨
		    }		    
		return result;
	}
	/*사업자등록번호 닉네임 중복 검사 input.jsp에서 ajax로 검증*/
	public int overlapped_businessNO(String businessNO) throws Exception
	{
		int result=sqlSession.selectOne("mapper.member.selectOverlapped_businessNO",businessNO);
		return result;
	}
	/* 인플루언서 회원정보 확인 */
	public String loginCheck_influencer(Map params, HttpSession session)
	{    
		String name = sqlSession.selectOne("mapper.member.loginCheck_influencer", params);
	    return name;
	}
	
	/* 가맹점 회원정보 확인 */
	public String loginCheck_company(Map params, HttpSession session)
	{    
		String name = sqlSession.selectOne("mapper.member.loginCheck_company", params);
		return name;
	}
	
	/* 관리자 회원정보 확인 */
	public String loginCheck_admin(Map params, HttpSession session)
	{    
		String name = sqlSession.selectOne("mapper.member.loginCheck_admin", params);
		return name;
	}
	
	/* 인플루언서 DTO 객체 반환 */
	public InfluencerDTO viewMember_influencer(String id)
	{
		System.out.println("i객체반환");
		InfluencerDTO influencer=sqlSession.selectOne("mapper.member.viewMember_influencer", id); 
		return influencer;
	}
	
	/* 가맹점 DTO 객체 반환 */
	public CompanyDTO viewMember_company(String id)
	{
		System.out.println("c객체반환");
		CompanyDTO companyDTO=sqlSession.selectOne("mapper.member.viewMember_company", id); 
		return companyDTO;
	}
	
	/* 관리자 DTO 객체 반환 */
	public AdminDTO viewMember_admin(String id)
	{
		System.out.println("a객체반환");
		AdminDTO adminDTO=sqlSession.selectOne("mapper.member.viewMember_admin", id); 
		return adminDTO;
	}
	
	/* 인플루언서 DTO 객체 세션 저장 */
	public void sessionLogin(@ModelAttribute("influencerDTO") InfluencerDTO influencerDTO, 
							 @ModelAttribute("companyDTO") CompanyDTO companyDTO, 
							 @ModelAttribute("adminDTO") AdminDTO adminDTO,
							 HttpSession session)
	{	
		System.out.println("sessionLogin에서 세션 저장");
		if(influencerDTO!=null)
		{
			System.out.println("influencerDTO 세션 저장");
			session.setAttribute("userInfo", influencerDTO);
		}
		else if(companyDTO!=null)
		{
			System.out.println("companyDTO 세션 저장");
			session.setAttribute("userInfo", companyDTO);
		}
		else if(adminDTO!=null)
		{
			System.out.println("adminDTO 세션 저장");
			session.setAttribute("userInfo", adminDTO);
		}
	}
	
	/* 인플루언서 회원 로그아웃 */
	public void logout(HttpSession session)
	{	
		session.invalidate(); //세션 종료
	}
	
	/* 관리자 회원 탈퇴시키기*/
	/* 인플루언서 회원 탈퇴 */
	public void deleteMember(String id, String division) throws Exception
	{	
		System.out.println("dao에서 "+division);
		
		if (division.contains("influencer_delete"))
		 {
		        sqlSession.delete("mapper.member.delete_influencer", id);
		        System.out.println("인플루언서 탈퇴 mapper 완료");
		 }
		 else if (division.contains("company_delete"))
		 {
		        sqlSession.delete("mapper.member.delete_company", id);
		        System.out.println("가맹점 탈퇴 mapper 완료");
		 }
	}
	

	
	/* 회원 정보 수정 시, 비밀번호 공란일 때*/
	public String passwordForMod_influencer(String id)
	{
		String password=sqlSession.selectOne("mapper.member.passwordForMod_influencer", id);
		System.out.println("sql완료 비밀번호는 : "+password);
		return password;
	}
	
	/* 회원 정보 수정 시, 비밀번호 공란일 때*/
	public String passwordForMod_company(String id)
	{
		String password=sqlSession.selectOne("mapper.member.passwordForMod_company", id);
		System.out.println("sql완료 비밀번호는 : "+password);
		return password;
	}
	

	/* 인플루언서 회원 정보 수정 */
	public void Membermod_influencer(@ModelAttribute("influencerDTO") InfluencerDTO influencerDTO,HttpSession session) throws Exception
	{	
		System.out.println("dao에서 pw확인 : "+influencerDTO.getPassword());
		sqlSession.insert("mapper.member.modMember_influencer",influencerDTO);
	}
	
	/* 가맹점 회원 정보 수정 */
	public void Membermod_company(@ModelAttribute("companyDTO") CompanyDTO companyDTO,HttpSession session) throws Exception
	{	
		sqlSession.insert("mapper.member.modMember_company",companyDTO);
		System.out.println("membermod_influencer에서 companyDTO 세션 바인딩");
		session.setAttribute("userInfo", companyDTO);
	}
	
	
	/* 관리자 로그인 정보 가져오기 */
	public AdminDTO viewAdmin(AdminDTO admin)
	{
		AdminDTO admin2=sqlSession.selectOne("mapper.member.viewMember_admin", admin); 
		return admin2;
	}
	
	/*관리자 전체 회원 목록조회_인플루언서 */
	public List<InfluencerDTO> listMembers_influencer()
	{
		List<InfluencerDTO> listMembers_influencer=sqlSession.selectList("mapper.member.listMembers_influencer");
		return listMembers_influencer;
	}
	
	/*관리자 전체 회원 목록조회_가맹점 */
	public List<CompanyDTO> listMembers_company()
	{
		List<CompanyDTO> listMembers_company=sqlSession.selectList("mapper.member.listMembers_company");
		return listMembers_company;
	}
	
    public List<Integer> getInfluencerData() {
        return sqlSession.selectList("mapper.member.getInfluencerData");
    }

    public List<Integer> getCompanyData() {
        return sqlSession.selectList("mapper.member.getCompanyData");
    }
    
    public MemberDTO getMemberById(String id) {
        return sqlSession.selectOne("mapper.member.getMemberById", id);
    }

   public int getInfluencerCount() {
        return sqlSession.selectOne("mapper.member.getInfluencerCount");
    }

   public int getCompanyCount() {
        return sqlSession.selectOne("mapper.member.getCompanyCount");
    }

   public int getCampaignCount() {
        return sqlSession.selectOne("mapper.member.getCampaignCount");
    }

   public int getApplicationCount() {
        return sqlSession.selectOne("mapper.member.getApplicationCount");
    }
}
