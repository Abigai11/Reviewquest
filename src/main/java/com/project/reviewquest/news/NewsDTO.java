package com.project.reviewquest.news;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
public class NewsDTO {
	private int num; //게시물 번호
	private String name; //작성자
	private String title; //게시물 제목
	private String content; //게시물 내용
	private int hit; //조회수
	private Timestamp writeDate; //작성 날짜
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	
}
