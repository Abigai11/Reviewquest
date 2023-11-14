package com.project.reviewquest.member;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberDTO")
public interface MemberDTO {
		String getDivision();
	    void setDivision(String division);

	    String getId();
	    void setId(String id);

	    String getPassword();
	    void setPassword(String password);

	    String getName();
	    void setName(String name);

	    String getNickName();
	    void setNickName(String nickName);

	    String getEmail();
	    void setEmail(String email);

	    String getPhoneNo();
	    void setPhoneNo(String phoneNo);

	   
}
