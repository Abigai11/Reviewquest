package com.project.reviewquest.review;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ReviewDAO {
	@Autowired
		@Resource(name = "sqlSessionReview")
	private SqlSession sqlSession;
	
	//리뷰 추가
	public void createReview(ReviewDTO reviewDTO) throws Exception {
		sqlSession.insert("mapper.review.createReview", reviewDTO);
	}
	
	//리뷰 조회
	public ReviewDTO readReview(int contentNo) throws Exception {
		return sqlSession.selectOne("mapper.review.readReview", contentNo);
	}
	
	//리뷰 전체 보기
	public List<ReviewDTO> listReview(Long id) throws Exception {
		List<ReviewDTO> listReview = sqlSession.selectList("mapper.review.listReview", id);
		return listReview;
	}
	
	//리뷰 수정
	public void updateReview(ReviewDTO reviewDTO) throws Exception {
		sqlSession.update("mapper.review.updateReview", reviewDTO);
	}
	
	//리뷰 갯수
	public Long reviewCount(Long id) throws Exception {
		return sqlSession.selectOne("mapper.review.countReview", id);
	}
}
