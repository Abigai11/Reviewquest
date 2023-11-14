package com.project.reviewquest.reply;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
public class ReplyDTO {
	private int replyNo;
	private int num;
	private String replyText;
	private String replyName;
	private Timestamp reDate;
	private Timestamp updateDate;
	private String filePath;
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	public String getReplyName() {
		return replyName;
	}
	public void setReplyName(String replyName) {
		this.replyName = replyName;
	}
	public Timestamp getReDate() {
		return reDate;
	}
	public void setReDate(Timestamp reDate) {
		this.reDate = reDate;
	}
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	@Override
	public String toString() {
		return "ReplyDTO [replyNo=" + replyNo + ", num=" + num + ", replyText=" + replyText + ", replyName=" + replyName
				+ ", reDate=" + reDate + ", updateDate=" + updateDate + ", filePath=" + filePath + "]";
	}
	
}
