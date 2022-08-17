package com.test2;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class TestAction extends ActionSupport
	implements Preparable,ModelDriven<UserDTO>{

	private UserDTO dto;
	
	//request.setAttribute("dto", dto); 를 대신하는 메소드
	//스트럿쳐가 알아서 dto 데이터를 넘겨준다. ActionSupport에 의해서
	public UserDTO getDto() {
		return dto;
	}

	//struts1의 <form-beans>같은 역할. dto 객체를 준비
	@Override
	public void prepare() throws Exception {
		dto = new UserDTO();
	}

	@Override
	public UserDTO getModel() {
		return dto;
	}

	
	//매개변수 없음. 필요하면 그때그때 만들어주면 됨.(HttpServletRequest request...처럼)
	public String created() throws Exception{
		
		//dto.getMode()==null || dto.getMode().equals("") 작성 순서가 바뀌면 안된다.
		if(dto==null || dto.getMode()==null || dto.getMode().equals("")) {
			return INPUT;
		}
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		request.setAttribute("message", "스트럿츠2");
		
		return SUCCESS;
		
	}
	
}
