<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");	
	
	//JSON형태는 key와 value값으로 구성 (key:value)
	/*
		[
		 {"id":"1","userId":"suzi","userPwd":"a123"},
		 {"id":"2","userId":"inna","userPwd":"b123"},
		 {"id":"3","userId":"insun","userPwd":"c123"},
		 {"id":"4","userId":"dovin","userPwd":"d123"}
		]
	*/
	
	String result = "";
	
	for(int i=1;i<=3;i++){
		result += "{\"id\":\"" + i;
		result += "\",\"userId\":\"" + userId;
		result += "\",\"userPwd\":\"" + userPwd + "\"},";
	}
	
	result = result.substring(0,result.length()-1);
	result = "[" + result + "]";
	
	out.print(result);
	
%>
