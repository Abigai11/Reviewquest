package com.project.reviewquest.review;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
public class ReviewDTO {
	private int contentNo;
	private int reviewNo;
	private String url;
	private String word;
	private String name;
	private Timestamp reDate;
	private String filePath;
	
	public int getContentNo() {
		return contentNo;
	}
	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getReDate() {
		return reDate;
	}
	public void setReDate(Timestamp reDate) {
		this.reDate = reDate;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
}
