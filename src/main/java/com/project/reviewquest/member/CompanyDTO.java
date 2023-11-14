package com.project.reviewquest.member;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component("CompanyDTO")
public class CompanyDTO implements MemberDTO{
	private String division;
	private String id;
	private String password;
	private String name;
	private String nickName;
	private String email;
	private String profilephoto;
	private String phoneNo;
	private String address;
	private String companyName;
	private String businessNO;
	private String companyTel;
	private String introduce;
	private String urlSNS;
	private Date JoinDate;
	
	
	
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProfilephoto() {
		return profilephoto;
	}
	public void setProfilephoto(String profilephoto) {
		this.profilephoto = profilephoto;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getBusinessNO() {
		return businessNO;
	}
	public void setBusinessNO(String businessNO) {
		this.businessNO = businessNO;
	}
	public String getCompanyTel() {
		return companyTel;
	}
	public void setCompanyTel(String companyTel) {
		this.companyTel = companyTel;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Date getJoinDate() {
		return JoinDate;
	}
	public void setJoinDate(Date joinDate) {
		JoinDate = joinDate;
	}
	public String getUrlSNS() {
		return urlSNS;
	}
	public void setUrlSNS(String urlSNS) {
		this.urlSNS = urlSNS;
	}
	
	
}
