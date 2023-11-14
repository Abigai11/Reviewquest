package com.project.reviewquest.news;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.reviewquest.reply.ReplyDAO;
import com.project.reviewquest.reply.ReplyDTO;
import com.project.reviewquest.reply.ReplyService;


@Service
@Transactional(propagation = Propagation.REQUIRED)
public class NewsService {
	@Autowired
	private NewsDAO newsDAO;

	//게시글 전체 보기
	public List<NewsDTO> newsList() throws Exception {
		List<NewsDTO> newsList = newsDAO.selectAllNews();
		return newsList;
	}
	
	//게시글 추가
	@Transactional
	public void newsInsert(NewsDTO newsDTO) throws Exception {
		newsDAO.newsInsert(newsDTO);
	}
	
	//게시글 조회
	public NewsDTO newsRead(int num) throws Exception {
		newsDAO.viewCnt(num);
		return newsDAO.newsRead(num);
	}
	
	//게시글 수정
	public void newsUpdate(NewsDTO newsDTO) throws Exception {
		newsDAO.newsUpdate(newsDTO);
	}
	
	//게시글 삭제
	public void newsDelete(int num) throws Exception {
		newsDAO.newsDelete(num);
	}
	
	//페이징
	public List<NewsDTO> paging(NewsPage newsPage) throws Exception {
		List<NewsDTO> newsList = newsDAO.paging(newsPage);
		return newsList;
	}
	
	//게시글 갯수
	public int newsCount(NewsPage newsPage) throws Exception {
		int count = newsDAO.newsCount(newsPage);
		return count;
	}
	
	//검색된 목록
	public List<NewsDTO> newsSearch(NewsPage newsPage) throws Exception {
		List<NewsDTO> search = newsDAO.newsSearch(newsPage);
		return search;
	}
	
	//검색된 목록 갯수
	public int newsCountSearch(NewsPage newsPage) throws Exception {
		int countSearch = newsDAO.newsCountSearch(newsPage);
		return countSearch;
	}
	
}
