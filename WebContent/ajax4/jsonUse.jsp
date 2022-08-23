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

<style type="text/css">

#resultDiv{
	border: 1px dotted #0000ff;
}

div{
	margin: auto;
	width: 600;
	height: 100%;
}

</style>

<script type="text/javascript">
	function useJson() {
		
		var userArray = 
			[
				{
					id:"suzi",
					name:"배수지",
					age:27,
					phone:
						[
							{home:["031-111-1111","032-111-2222"]},
							{office:["02-123-1234","02-456-4564"]}
						]
				},
				{
					id:"inna",
					name:"유인나",
					age:41,
					phone:[{},{}]
				},
				{
					id:"insun",
					name:"정인선",
					age:30,
					phone:[{},{}]
				},
		];

	
		//한개의 데이터 가져오기
		var id = userArray[0].id;
		var name = userArray[0].name;
		var age = userArray[0].age;
		
		var homephone1 = userArray[0].phone[0].home[0];
		var homephone2 = userArray[0].phone[0].home[1];
		
		var officephone1 = userArray[0].phone[1].office[0];
		var officephone2 = userArray[0].phone[1].office[1];

		var printData = id + "," + name + "," + age + "<br/>";
		printData += "homephone1: " + homephone1 + "<br/>";
		printData += "homephone2: " + homephone2 + "<br/>";
		
		printData += "officephone1: " + officephone1 + "<br/>";
		printData += "officephone2: " + officephone2 + "<br/>";
		
		
		//전체데이터
		for(var i=0;i<userArray.length;i++){
			var id = userArray[i].id;
			var name = userArray[i].name;
			var age = userArray[i].age;
			printData += id + "," + name + "," + age + "<br/>";
		}
		
		var resultDiv = document.getElementById("resultDiv");
		resultDiv.innerHTML = printData; 
	}
	
	window.onload = function(){
		useJson();
	}
	
</script>

</head>
<body>

<h1>JSON(Javascript Object Notaion)</h1>
<!-- json: 자바스크립트에서 데이터를 저장하는 방법 -->

<hr/>

<div id="resultDiv"></div>

</body>
</html>