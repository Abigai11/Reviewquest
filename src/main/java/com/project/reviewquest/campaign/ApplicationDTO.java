package com.project.reviewquest.campaign;

import java.time.LocalDate;
import java.util.List;

public class ApplicationDTO {
	private Long id;
	private String nickName;
    private Long campaignNum;
    private List<String> snsURL;
    private String name;
    private String comment;
    private String Recipient;
    private String address;
    private String phone;
    private String email;
    private String status;
    private String registrationDate;
    
	public String getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getCampaignNum() {
		return campaignNum;
	}
	public void setCampaignNum(Long campaignNum) {
		this.campaignNum = campaignNum;
	}
	public List<String> getSnsURL() {
		return snsURL;
	}
	public void setSnsURL(List<String> snsURL) {
		this.snsURL = snsURL;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getRecipient() {
		return Recipient;
	}
	public void setRecipient(String recipient) {
		Recipient = recipient;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getApplicationStatusClass() {
	    if (status.equals("선정")) {
	        return "bg-gradient-in-progress";
	    } else if (status.equals("선정취소")) {
	        return "bg-gradient-waiting";
	    } else {
	        // 기본적으로 사용할 클래스를 반환합니다.
	        return "bg-gradient-ended";
	    }
	}

}
