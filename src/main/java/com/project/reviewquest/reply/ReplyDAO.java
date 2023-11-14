package com.project.reviewquest.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.reviewquest.forum.ForumPage;

@Repository
public class ReplyDAO {
	@Autowired
		@Resource(name = "sqlSessionReply")
	private SqlSession sqlSession;
	
	//댓글 추가
	public void insertReply(ReplyDTO replyDTO) throws Exception {
		sqlSession.insert("mapper.reply.insertReply", replyDTO);
	}
	
	//댓글 조회
	public List<ReplyDTO> readReply(int num) throws Exception {
		List<ReplyDTO> listReply = sqlSession.selectList("mapper.reply.readReply", num);
		return listReply;
	}
	
	//단일 댓글 조회
	public ReplyDTO selectReply(int replyNo) throws Exception {
	    return sqlSession.selectOne("mapper.reply.selectReply", replyNo);
	}

	
	//댓글 수정
	public void updateReply(ReplyDTO replyDTO) throws Exception {
		sqlSession.update("mapper.reply.updateReply", replyDTO);
	}
	
	//댓글 삭제
	public void deleteReply(int replyNo) throws Exception {
		sqlSession.delete("mapper.reply.deleteReply", replyNo);
	}
	
	//댓글 페이징
	public List<ReplyDTO> replyPaging(int num, ForumPage forumPage) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("num", num);
		paramMap.put("forumPage", forumPage);
		List<ReplyDTO> map = sqlSession.selectList("mapper.reply.replyPaging", paramMap);
		return map;
	}
	
	//총 댓글 개수
	public int countReply(int num) throws Exception {
		int count = sqlSession.selectOne("mapper.reply.countReply", num);
		return count;
	}
	
	//게시글 번호 조회
	public int getNum(int replyNo) throws Exception {
		return sqlSession.selectOne("mapper.reply.getNum", replyNo);
	}
}
