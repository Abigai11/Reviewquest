package com.project.reviewquest.news;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.reviewquest.reply.ReplyDAO;
import com.project.reviewquest.reply.ReplyDTO;
import com.project.reviewquest.reply.ReplyService;

@Repository
public class NewsDAO {
	@Autowired
		@Resource(name = "sqlSessionNews")
	private SqlSession sqlSession;
	
	//게시글 전체 보기
	public List<NewsDTO> selectAllNews() throws Exception {
		List<NewsDTO> newsList = sqlSession.selectList("mapper.news.selectAllNews");
		return newsList;
	}
	
	//게시글 추가
	public void newsInsert(NewsDTO newsDTO) throws Exception {
		sqlSession.insert("mapper.news.newsInsert", newsDTO);
	}
	
	//게시글 조회
	public NewsDTO newsRead(int num) throws Exception {
		NewsDTO newsDTO = sqlSession.selectOne("mapper.news.newsRead", num);
		return newsDTO;
	}
	
	//게시글 수정
	public void newsUpdate(NewsDTO newsDTO) throws Exception {
		sqlSession.update("mapper.news.newsUpdate", newsDTO);
	}
	
	//게시글 삭제
	public void newsDelete(int num) throws Exception {
		sqlSession.delete("mapper.news.newsDelete", num);
	}
	
	//페이징
	public List<NewsDTO> paging(NewsPage newsPage) throws Exception {
		List<NewsDTO> newsList = sqlSession.selectList("mapper.news.selectAllNews", newsPage);
		return newsList;
	}
	
	//전체 게시글 갯수
	public int newsCount(NewsPage newsPage) throws Exception {
		int count = sqlSession.selectOne("mapper.news.newsCount", newsPage);
		return count;
	}
	
	//검색된 목록
	public List<NewsDTO> newsSearch(NewsPage newsPage) throws Exception {
		List<NewsDTO> search = sqlSession.selectList("mapper.news.newsSearch", newsPage);
		return search;
	}
	
	//검색된 게시글 갯수
	public int newsCountSearch(NewsPage newsPage) throws Exception {
		int countSearch = sqlSession.selectOne("mapper.news.newsCountSearch", newsPage);
		return countSearch;
	}
	
	//조회수
	public void viewCnt(int num) throws Exception {
		sqlSession.update("mapper.news.updateViewCnt", num);
	}
}
