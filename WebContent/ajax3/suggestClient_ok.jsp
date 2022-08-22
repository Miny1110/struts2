<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%!
/* %뒤에 느낌표를 붙여야 전역변수로 인식된다.
메소드 안에 메소드를 만들 수 없다.(클래스 만들기는 가능)
그래서 느낌표를 붙여서 search라는 메소드를 만들수 있게 해주어야 한다. */

	String[] keywords = {
			"ajax","Ajax","Ajax실전 프로그래밍","AJA","AZERA",
			"자수","자전거","자라","자바프로그래밍","자바 서버 페이지",
			"자바 스터디","astra","abort","자바 서비스","자바캔",
			"ABC마트","Apple"			
	};

	public List<String> search(String userKeyword){
		
		if(userKeyword==null || userKeyword.equals("")){
			//return null;
			return Collections.EMPTY_LIST;
		}
		
		userKeyword = userKeyword.toUpperCase(); //사용자가 입려한 것을 대문자로 변환
		
		List<String> lists = new ArrayList<String>();
		
		for(int i=0;i<keywords.length;i++){
			
			if(keywords[i].startsWith(userKeyword)){
				lists.add(keywords[i]);
			}
			
		}
		
		return lists;
		
	}

%>

<%

	String userKeyword = request.getParameter("userKeyword");
	List<String> keywordLists = search(userKeyword);

	out.print(keywordLists.size()); //반환된 제시어의 개수
	
	out.print("|");
	
	Iterator<String> it = keywordLists.iterator();
	
	while(it.hasNext()){
		
		String value = (String) it.next();
		
		out.print(value);
		
		if(keywordLists.size()-1 > 0 ){
			out.print(",");
		}
		
	}
	
	/* 
	//Map
	for(int i=0;i<keywordLists.size();i++){
		
		String key = (String)keywordLists.get(i);
		out.print(key);
		if(i<keywordLists.size()-1){
			out.print(",");
		}
	}
 */


%>