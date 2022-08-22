<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%!

	String[] newsTitle = 
		{
		"[단독]신기하다, 선배들에 전화해 '용퇴' 만류…'검찰 남아 도와달라'",
		"'서울 아파트 시장 침체기 진입'...보유세 감면 덕에 '패닉 셀'은 없을 듯",
		"1330선 뚫은 환율···다시 불붙은 '슈퍼 달러'",
		"'착한 중국인은 1989년 다 죽었다'…한국 MZ '반중 정서' 확대 [한·중 수교 30년]",
		"이준석 '윤핵관 수사 개입, 예상했지만 황당해'",
		"푸틴 '정신적 스승'의 딸, 차량 폭발로 사망…암살 가능성"
				
		};

/*
6|[단독]이원석, 선배들에 전화해 '용퇴' 만류…[2022.08.22 오전 11:15:21]*
'서울 아파트 시장 침체기 진입'...[2022.08.22 오전 11:15:21]*
*/
%>

<%
	out.print(newsTitle.length + "|");
		
	for(int i=0;i<newsTitle.length;i++){
		out.print(newsTitle[i] + " [" + new Date() + "]");
		
		if(i!=(newsTitle.length-1)){
			out.print("*");
		}
	}



%>