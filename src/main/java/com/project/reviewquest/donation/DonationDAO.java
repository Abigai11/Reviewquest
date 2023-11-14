package com.project.reviewquest.donation;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.reviewquest.forum.ForumDTO;
import com.project.reviewquest.forum.ForumPage;


@Repository
public class DonationDAO {
	@Autowired
		@Resource(name = "sqlSessionDonation")
	private SqlSession sqlSession;
	
	//게시글 추가
	public void donationCreate(DonationDTO donationDTO) throws Exception {
		sqlSession.insert("mapper.donation.donationCreate", donationDTO);
	}
	
	//게시글 전체 보기
	public List<DonationDTO> donationList(DonationPage donationPage) throws Exception {
		return sqlSession.selectList("mapper.donation.donationList", donationPage);
	}
	
	//게시글 조회
	public DonationDTO donationRead(int num) throws Exception {
		return sqlSession.selectOne("mapper.donation.donationRead", num);
	}
	
	//게시글 수정
	public void donationUpdate(DonationDTO donationDTO) throws Exception {
		sqlSession.update("mapper.donation.donationUpdate", donationDTO);
	}
	
	//게시글 삭제
	public void donationDelete(int num) throws Exception {
		sqlSession.delete("mapper.donation.donationDelete", num);
	}
	
	//기부금액 업데이트
	public void amountUpdate(DonationDTO donationDTO) throws Exception {
		sqlSession.update("mapper.donation.amountUpdate", donationDTO);
	}
	
	//검색된 목록
	public List<DonationDTO> donationSearch(DonationPage donationPage) throws Exception {
		return sqlSession.selectList("mapper.donation.donationSearch", donationPage);
	}
	
	//검색된 목록
	public List<DonationDTO> donationSearch(DonationAdminList donationAdminList) throws Exception {
		return sqlSession.selectList("mapper.donation.donationSearch", donationAdminList);
	}
	
	//전체 게시글 갯수
	public int donationCount(DonationPage donationPage) throws Exception {
		int count = sqlSession.selectOne("mapper.donation.donationCount", donationPage);
		return count;
	}
	
	//전체 게시글 갯수
	public int donationCount(DonationAdminList donationAdminList) throws Exception {
		int count = sqlSession.selectOne("mapper.donation.donationCount", donationAdminList);
		return count;
	}
}
