package com.project.reviewquest.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.reviewquest.forum.ForumDAO;
import com.project.reviewquest.forum.ForumPage;

@Service
public class ReplyService {
	@Autowired
	private ReplyDAO replyDAO;
	
	@Autowired
	private ForumDAO forumDAO;
	
	//댓글 조회
	public List<ReplyDTO> readReply(int num) throws Exception {
		return replyDAO.readReply(num);
	}
	
	//댓글 작성
	public void insertReply(ReplyDTO replyDTO) throws Exception {
		addReply(replyDTO);
		replyDAO.insertReply(replyDTO);
	}
	
	//단일 댓글 조회
	public ReplyDTO selectReply(int replyNo) throws Exception {
	    return replyDAO.selectReply(replyNo);
	}

	
	//댓글 수정
	public void updateReply(ReplyDTO replyDTO) throws Exception {
		replyDAO.updateReply(replyDTO);
	}
	
	//댓글 삭제
	public void deleteReply(int replyNo) throws Exception {
		removeReply(replyNo);
		replyDAO.deleteReply(replyNo);
	}
	
	//페이징
	public List<ReplyDTO> replyPaging(int num, ForumPage forumPage) throws Exception {
		return replyDAO.replyPaging(num, forumPage);
	}
	
	//총 댓글 수
	public int countReply(int num) throws Exception {
		return replyDAO.countReply(num);
	}
	
	@Transactional
	public void addReply(ReplyDTO replyDTO) throws Exception {
		forumDAO.replyCnt(replyDTO.getNum(), 1);
	}
	
	@Transactional
	public void removeReply(int replyNo) throws Exception {
		int num = replyDAO.getNum(replyNo);
		forumDAO.replyCnt(num, -1);
	}
}
