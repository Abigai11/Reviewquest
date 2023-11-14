package com.project.reviewquest.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	
	//리뷰 작성
	public void createReview(ReviewDTO reviewDTO) throws Exception {
		reviewDAO.createReview(reviewDTO);
	}
	
	//리뷰 조회
	public ReviewDTO readReview(int contentNo) throws Exception {
		return reviewDAO.readReview(contentNo);
	}
	
	//리뷰 조회
	public List<ReviewDTO> listReview(Long id) throws Exception {
		return reviewDAO.listReview(id);
	}
	
	//리뷰 수정
	public void updateReview(ReviewDTO reviewDTO) throws Exception {
		reviewDAO.updateReview(reviewDTO);
	}
	
	public Long reviewCount(Long id) throws Exception {
		return reviewDAO.reviewCount(id);
	}
}
