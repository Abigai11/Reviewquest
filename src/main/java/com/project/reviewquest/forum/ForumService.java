package com.project.reviewquest.forum;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.reviewquest.news.NewsDTO;
import com.project.reviewquest.reply.ReplyDAO;
import com.project.reviewquest.reply.ReplyDTO;
import com.project.reviewquest.reply.ReplyService;


@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ForumService {
	@Autowired
	private ForumDAO forumDAO;

	//게시글 전체 보기
	public List<NewsDTO> newsList() throws Exception {
		List<NewsDTO> newsList = forumDAO.newsList();
		return newsList;
	}
	
	//게시글 추가
	@Transactional
	public void insertForum(ForumDTO forumDTO) throws Exception {
		forumDAO.insertForum(forumDTO);
	}
	
	//게시글 조회
	public ForumDTO readForum(int num) throws Exception {
		forumDAO.viewCnt(num);
		return forumDAO.readForum(num);
	}
	
	//게시글 수정
	public void updateForum(ForumDTO forumDTO) throws Exception {
		forumDAO.updateForum(forumDTO);
	}
	
	//게시글 삭제
	public void deleteForum(int num) throws Exception {
		forumDAO.deleteForum(num);
	}
	
	//페이징
	public List<ForumDTO> paging(ForumPage forumPage) throws Exception {
		List<ForumDTO> forumlist = forumDAO.paging(forumPage);
		return forumlist;
	}
	
	//테스트 데이터
	public void testCreate() throws Exception {
		forumDAO.testCreate();
	}
	
	//게시글 갯수
	public int countForum(ForumPage forumPage) throws Exception {
		int count = forumDAO.countForum(forumPage);
		return count;
	}
	
	//검색된 목록
	public List<ForumDTO> searchForum(ForumPage forumPage) throws Exception {
		List<ForumDTO> search = forumDAO.searchForum(forumPage);
		return search;
	}
	
	//검색된 목록 갯수
	public int countSearchForum(ForumPage forumPage) throws Exception {
		int countSearch = forumDAO.countSearchForum(forumPage);
		return countSearch;
	}
	
}
