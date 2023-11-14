package com.project.reviewquest.donation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.reviewquest.forum.ForumDTO;
import com.project.reviewquest.forum.ForumPage;


@Service
@Transactional(propagation = Propagation.REQUIRED)
public class DonationService {
	@Autowired
	private DonationDAO donationDAO;
	@Autowired
	private DonationEmail donationEmail;
	
	//게시글 추가
	@Transactional
	public void donationCreate(DonationDTO donationDTO) throws Exception {
		donationDAO.donationCreate(donationDTO);
	}
	
	//게시글 전체 보기
	public List<DonationDTO> donationList(DonationPage donationPage) throws Exception {
		List<DonationDTO> donationList = donationDAO.donationList(donationPage);
		return donationList;
	}
	
	//게시글 조회
	public DonationDTO donationRead(int num) throws Exception {
		return donationDAO.donationRead(num);
	}
	
	//게시글 수정
	public void donationUpdate(DonationDTO donationDTO) throws Exception {
		donationDAO.donationUpdate(donationDTO);
	}
	
	//게시글 삭제
	public void donationDelete(int num) throws Exception {
		donationDAO.donationDelete(num);
	}
	
	//기부금액 업데이트
	public void amountUpdate(DonationDTO donationDTO) throws Exception {
		donationDAO.amountUpdate(donationDTO);
	}
	
	//이메일 전송
	public void sendEmailFromRedirectPage(String nickname, int amount, String email, 
    		HttpServletRequest request, String title) throws Exception {
		donationEmail.sendEmailFromRedirectPage(nickname, amount, email, request, title);
	}
	
	//검색된 목록
	public List<DonationDTO> donationSearch(DonationPage donationPage) throws Exception {
		return donationDAO.donationSearch(donationPage);
	}
	
	//검색된 목록
	public List<DonationDTO> donationSearch(DonationAdminList donationadminList) throws Exception {
		return donationDAO.donationSearch(donationadminList);
	}
	
	//게시글 갯수
	public int donationCount(DonationPage donationPage) throws Exception {
		int count = donationDAO.donationCount(donationPage);
		return count;
	}
	
	//게시글 갯수
	public int donationCount(DonationAdminList donationadminList) throws Exception {
		int count = donationDAO.donationCount(donationadminList);
		return count;
	}
}
