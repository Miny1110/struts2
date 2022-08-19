<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=cp%>/data/js/ajaxUtil.js"></script>

<script type="text/javascript">

	function sendIt(){
		
		//XMLHttpRequest 객체
		//xmlHttp = new XMLHttpRequest(); 크롬으로만 쓸거면 이거 쓰면 됨
		xmlHttp = createXMLHttpRequest(); //브라우저 여러개 고려하려면 이거 쓰면 됨
		
		//ajax 구현 방법에는 세가지 방법이 있음 (js로 구현, jquery로 구현, ajax로 구현)
		//1. 자바스크립트로 아작스 구현하기
		var query = "";
		var su1 = document.getElementById("su1").value; 
		var su2 = document.getElementById("su2").value; 
		var oper = document.getElementById("oper").value; 

		//get방식으로 데이터 전송
		query = "test1_ok.jsp?su1=" + su1 + "&su2=" + su2 + "&oper=" + oper;

		
		//데이터를 비동기 방식으로 보내기
		xmlHttp.onreadystatechange = callback; 

		xmlHttp.open("GET",query,true); //true가 비동기 방식으로 넘기라는 의미
		
		/*get방식은 주소에 데이터가 다 있으니까 괄호 안에 데이터를 쓰지 않아도 된다.
		post방식은 주소 뒤에 데이터가 없기 때문에 괄호 안에 데이터를 다 적어주어야 한다.
		(지금같은 경우는 ?뒤의 데이터들)*/
		xmlHttp.send(null);
		
	}
	
	
	function callback(){
		
		if(xmlHttp.readyState==4){
			if(xmlHttp.status==200){
				
				/*작업 코드가 짧으면 바로 적으면 되고,
				길면 새로운 함수를 만들고 그 함수를 호출해도 된다.*/
				
				printData();
				
			}
		}
	}
	
	
	function printData(){
		
		//서버로부터 돌아온 데이터(서버가 xml 형태로 돌려줌)
		//xml에서 root를 찾아서 result에 넣어라
		var result = xmlHttp.responseXML.getElementsByTagName("root")[0];
		
		var out = document.getElementById("resultDIV");
		
		out.innerHTML = "";
		out.style.display = "";
		
		var value = result.firstChild.nodeValue;
		
		out.innerHTML = value;
	}

</script>

</head>
<body>
<input type="text" id="su1">
<select id="oper">
	<option value="hap">더하기</option>
	<option value="sub">빼기</option>
	<option value="mul">곱하기</option>
	<option value="div">나누기</option>
</select>
<input type="text" id="su2">
<input type="button" value=" = " onclick="sendIt();">
<br/>

<div id="resultDIV" style="display: none;"></div>

</body>
</html>