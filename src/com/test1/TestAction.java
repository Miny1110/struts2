package com.test1;

import com.opensymphony.xwork2.ActionSupport;

public class TestAction extends ActionSupport{
	
	private UserDTO user;
	private String message;
	
	//DTO 객체의 게터/세터를 만들어야 한다.
	public UserDTO getUser() {
		return user;
	}

	public void setUser(UserDTO user) {
		this.user = user;
	}

	public String getMessage() {
		return message;
	}

	public String execute() throws Exception{
		
		message = user.getUserName() + "님 방가방가...";
		
		return "ok";
				
	}

}
