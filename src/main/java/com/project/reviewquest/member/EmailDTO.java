package com.project.reviewquest.member;

import org.springframework.stereotype.Component;

@Component("EmailDTO")
public class EmailDTO {
	 private String email;
	 private String verificationcode;
	 
	 
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getVerificationcode() {
		return verificationcode;
	}
	public void setVerificationcode(String verificationcode) {
		this.verificationcode = verificationcode;
	}
	 
	 

	 
}
