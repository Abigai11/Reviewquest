package com.project.reviewquest.member;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
@Component("InfluencerDTO")
public class InfluencerDTO implements MemberDTO{
	private String division;
	private String id;
	private String password;
	private String name;
	private String nickName;
	private String birthday;
	private String email;
	private String profilephoto;
	private String phoneNo;
	private String address;
	private String introduce;
	private String urlSNS;
	private String urlYoutube;
	private String urlNaver;
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
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
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

	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getUrlSNS() {
		return urlSNS;
	}
	public void setUrlSNS(String urlSNS) {
		this.urlSNS = urlSNS;
	}
	public String getUrlYoutube() {
		return urlYoutube;
	}
	public void setUrlYoutube(String urlYoutube) {
		this.urlYoutube = urlYoutube;
	}
	public String getUrlNaver() {
		return urlNaver;
	}
	public void setUrlNaver(String urlNaver) {
		this.urlNaver = urlNaver;
	}

	public Date getJoinDate() {
		return JoinDate;
	}
	public void setJoinDate(Date joinDate) {
		JoinDate = joinDate;
	}
	
	
	
}
