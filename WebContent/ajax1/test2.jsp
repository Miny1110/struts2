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

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">

$(function(){
	
	$("#sendButton").click(function(){
		
		var param = "subject=" + $("#subject").val() + "&content=" + $("#content").val();
		
		$.ajax({
			/* 
			type~dataType까지가 send
			이 과정 전에 beforeSend가 실행. 여기에서 false가 뜨면 send가 안된다.
			beforeSend의 위치는 아무데나 상관없다. 콤마로 구분만 해주면 된다.
			데이터 작업을 하고 정상적으로 돌아왔으면 success에 그 데이터가 담긴다.
			 */
			type:"post",
			url:"test2_ok.jsp",
			data:param,
			dataType:"xml",
			success:function(args){
				//alert(args);
				
				$(args).find("status").each(function(){
					alert($(this).text());
				});
				
				var str = "";
				
				$(args).find("record").each(function(){
					var id = $(this).attr("id");
					var subject = $(this).find("subject").text();
					var content = $(this).find("content").text();
					
					str += "id=" + id + 
							", subject=" + subject + 
							", content=" + content + "<br/>";
					
				});
				
				$("#resultDIV").html(str);
				
			},
			beforeSend:showRequest,
			error:function(e){
				alert(e.responseText);
			}
		});
	});
});


function showRequest(){
	
	var flag = true;
	
	if(!$("#subject").val()){
		alert("제목을 입력하세요");
		$("#subject").focus();
		return false;
	}
	
	
	var flag = true;
	if(!$("#content").val()){
		alert("내용을 입력하세요");
		$("#content").focus();
		return false;
	}
	
}

</script>

</head>
<body>

제목: <input type="text" id="subject"><br/>
내용: <input type="text" id="content"><br/>
<input type="button" id="sendButton" value="보내기">

<div id="resultDIV"></div>

</body>
</html>