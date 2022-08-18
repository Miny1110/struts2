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

<script type="text/javascript" src="<%=cp%>/data/js/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
	/* 
	//같은게 두개있으면 맨 마지막 하나만 실행
	window.onload = function(){
		alert("환영!");
	}
	
	window.onload = function(){
		alert("진짜루 환영!");
	}
	 */

$(document).ready(function(){
	alert("환영!");
})
//위처럼 쓰는게 정석인데 아래처럼 써도 실행된다.
$(function(){
	alert("진짜루 환영!");
})


$(function(){
	$(document.body).css("background","#DAD9FF");
})


$(function(){
	$("<div><p>신기하네</p></div>").appendTo("body");
})
	 
</script>

</head>
<body>

</body>
</html>