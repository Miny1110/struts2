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

<%-- 아래에 있는 네줄의 코드와 이 세줄의 코드는 같은 역할을 한다.
세줄 코드는 이클립스에  파일이 있어야 사용 가능, 밑에 네줄 코드는 파일 없어도 사용 가능
<link rel="stylesheet" href="<%=cp%>/data/css/jquery-ui.min.css">
<script type="text/javascript" src="<%=cp%>/data/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=cp%>/data/js/jquery-ui.min.js"></script>
 --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript">

$(function(){
	$("#container").tabs();
});

</script>

<style type="text/css">
	body{ font: 62.5% "굴림", sans-serif; margin: 50px;}
	ul#icons {margin: 0; padding: 0;}
	ul#icons li {margin: 2px; position: relative; padding: 4px 0; cursor: pointer; float: left;  list-style: none;}
	ul#icons span.ui-icon {float: left; margin: 0 4px;}
	#container { width: 300px;}
</style>

</head>
<body>

<div id="container">
<ul>
	<li><a href="#f1">첫번째</a></li>
	<li><a href="#f2">두번째</a></li>
	<li><a href="#f3">세번째</a></li>
</ul>

<div id="f1">
테스트1
</div>

<div id="f2">
테스트2
</div>

<div id="f3">
테스트3
</div>

</div>

</body>
</html>