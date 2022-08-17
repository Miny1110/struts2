package com.board;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class BoardAction extends ActionSupport
	implements Preparable,ModelDriven<BoardDTO>{

	private BoardDTO dto;
	
	public BoardDTO getDto() {
		return dto;
	}

	@Override
	public BoardDTO getModel() {
		return dto; //ModelDriven<BoardDTO>에 dto 담아서 리턴
	}

	@Override
	public void prepare() throws Exception {
		dto = new BoardDTO(); //객체생성
	}

	public String created() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		//입력창
		if(dto==null || dto.getMode()==null || dto.getMode().equals("")) {
			request.setAttribute("mode", "create");
			return INPUT;
		}
		
		
		
		return SUCCESS;
		
	}
	
	public String list() throws Exception{
		
		
		return SUCCESS;
		
	}
	
}
