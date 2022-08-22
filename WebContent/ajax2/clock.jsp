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

<script type="text/javascript">

	var XMLHttp;
	
	XMLHttp = new XMLHttpRequest();
	
	function printClientTime(){
		
		//클라이언트 시간
		var clientTimeSpan = document.getElementById("clientTimeSpan");
		var now = new Date();
		var timeStr = now.getFullYear() + "년 "
						+ (now.getMonth()+1) + "월 "
						+ now.getDate() + "일 "
						+ now.getHours() + "시 "
						+ now.getMinutes() + "분 "
						+ now.getSeconds() + "초";
		
		clientTimeSpan.innerHTML = timeStr;
		
		setTimeout("printClientTime()",1000); //1초마다 자기 자신을 호출(1000=1초)
		
	}
	
	
	function requestTime(){
		
		//?dummy 이하는 써도 되고 생략해도 된다.
		XMLHttp.open("GET","clock_ok.jsp",true);
		
		XMLHttp.onreadystatechange = printServerTime;
		
		XMLHttp.send(null);
		
		setTimeout("requestTime()",1000);
		
	}
	
	
	function printServerTime(){
		
		if(XMLHttp.readyState==4){
			if(XMLHttp.status==200){
				var serverTimeSpan = document.getElementById("serverTimeSpan");
				serverTimeSpan.innerHTML = XMLHttp.responseText;
			}
		}
		
		
	}
	

	window.onload = function(){
		printClientTime();
		requestTime();
	}
	
</script>

</head>
<body>

<h1>Clock</h1>
<br/>
<hr>

1. 현재 클라이언트 시간은 <b><span id="clientTimeSpan"></span></b>입니다.<br/>
2. 현재 서버 시간은 <b><span id="serverTimeSpan"></span></b>입니다.<br/>


</body>
</html>