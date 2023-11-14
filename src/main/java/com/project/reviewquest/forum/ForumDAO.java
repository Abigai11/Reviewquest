package com.project.reviewquest.forum;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.reviewquest.news.NewsDTO;
import com.project.reviewquest.reply.ReplyDAO;
import com.project.reviewquest.reply.ReplyDTO;
import com.project.reviewquest.reply.ReplyService;

@Repository
public class ForumDAO {
	@Autowired
		@Resource(name = "sqlSessionForum")
	private SqlSession sqlSession;
	
	//게시글 전체 보기
	public List<NewsDTO> newsList() throws Exception {
		List<NewsDTO> newsList = sqlSession.selectList("mapper.forum.newsList");
		return newsList;
	}
	
	//게시글 추가
	public void insertForum(ForumDTO forumDTO) throws Exception {
		sqlSession.insert("mapper.forum.insertForum", forumDTO);
	}
	
	//게시글 조회
	public ForumDTO readForum(int num) throws Exception {
		ForumDTO forumDTO = sqlSession.selectOne("mapper.forum.readForum", num);
		return forumDTO;
	}
	
	//게시글 수정
	public void updateForum(ForumDTO forumDTO) throws Exception {
		sqlSession.update("mapper.forum.updateForum", forumDTO);
	}
	
	//게시글 삭제
	public void deleteForum(int num) throws Exception {
		sqlSession.delete("mapper.forum.deleteForum", num);
	}
	
	//페이징
	public List<ForumDTO> paging(ForumPage forumPage) throws Exception {
		List<ForumDTO> forumList = sqlSession.selectList("mapper.forum.selectAllForum", forumPage);
		return forumList;
	}
	
	//테스트 데이터
	public void testCreate() throws Exception {
		for(int i=1; i<=1000; i++) {
			ForumDTO forumDto = new ForumDTO();
			forumDto.setTitle(i + "번째 글 제목입니다...");
			forumDto.setContent(i + "번째 글 내용입니다...");
			forumDto.setName("user0" + (i%10));
		
			insertForum(forumDto);
		}
	}
	
	//전체 게시글 갯수
	public int countForum(ForumPage forumPage) throws Exception {
		int count = sqlSession.selectOne("mapper.forum.countForum", forumPage);
		return count;
	}
	
	//검색된 목록
	public List<ForumDTO> searchForum(ForumPage forumPage) throws Exception {
		List<ForumDTO> search = sqlSession.selectList("mapper.forum.searchForum", forumPage);
		return search;
	}
	
	//검색된 게시글 갯수
	public int countSearchForum(ForumPage forumPage) throws Exception {
		int countSearch = sqlSession.selectOne("mapper.forum.countSearchForum", forumPage);
		return countSearch;
	}
	
	//댓글 갯수 갱신
	public void replyCnt(int num, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("num", num);
		paramMap.put("amount", amount);
		System.out.println(num + ", " + amount);
		
		sqlSession.update("mapper.forum.updateReplyCnt", paramMap);
	}
	
	public void viewCnt(int num) throws Exception {
		sqlSession.update("mapper.forum.updateViewCnt", num);
	}
}
