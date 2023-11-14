package com.project.reviewquest.donation;

import java.net.URLEncoder;

import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Component
public class DonationPage {
	private int page;	//현재 페이지 번호
	private int pageNum; //페이지 당 출력되는 게시글의 수
	private int totalCount; //총 게시글 수
	private int startPage; //시작 페이지
	private int endPage; //끝 페이지
	private boolean prev; //이전 페이지
	private boolean next; //다음 페이지
	private String searchType; //검색 조건
	private String keyword; //검색 키워드
	
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getPage() {
		return page;
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	private int displayPageNum = 10; //하단 페이지 갯수
	
	public DonationPage() { //현재 페이지 1, 페이지 당 게시글 갯수 12
		this.page = 1;
		this.pageNum = 12;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setPageNum(int pageNum) {
		if(pageNum <= 0 || pageNum > 100) {
			this.pageNum = 12;
			return;
		}
		this.pageNum = pageNum;
	}
	
	//현재 페이지 시작 게시글 번호 = (현재 페이지번호 - 1) * 페이지 당 출력할 게시글의 갯수
	public int getPageStart() {
		return (this.page - 1) * pageNum;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	private void calcData() {
		//끝 페이지 번호 = Math.ceil(현재 페이지 / 페이지 번호의 갯수) * 페이지 번호의 갯수
		endPage = (int)(Math.ceil(getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		//끝 페이지 번호 = Math.ceil(전체 게시글 갯수 / 페이지 당 출력할 게시글의 갯수)
		int tempEndPage = (int)(Math.ceil(totalCount / (double)getPageNum()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage > 1;
		
		next = endPage * getPageNum() < totalCount;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageNum", getPageNum())
				.build();
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageNum", getPageNum())
				.queryParam("searchType", getSearchType())
				.queryParam("keyword", encoding(getKeyword()))
				.build();
		return uriComponents.toUriString();
	}
	
	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "utf-8");
		} catch (Exception e) {
			return "";
		}
	}
}
