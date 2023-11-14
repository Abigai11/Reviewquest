package com.project.reviewquest.donation;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
public class DonationDTO {
	private int num; //기부글 번호
	private String title; //기부글 제목
	private String office; //기부글 기관명
	private String content; //기부글 내용
	private String fileName; //기부글 파일이름
	private String filePath; //기부글 파일위치
	private Date date; //현재 날짜
	private Date endDate; //마감 날짜
	private int amount; //현재금액
	private int targetAmount; //목표금액
	private int people; //참여 인원
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTargetAmount() {
		return targetAmount;
	}
	public void setTargetAmount(int targetAmount) {
		this.targetAmount = targetAmount;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	
}
