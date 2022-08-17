<%@ page  contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게 시 판</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/board/css/style.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/board/css/created.css" />
<script type="text/javascript" src="<%=cp%>/board/js/util.js"></script>
<script type="text/javascript">

	function sendIt() {
		
		var f = document.myForm;
		
		str = f.subject.value;
		str = str.trim(); //trim공백을 없애는 js 출력
		
		if(!str) {
			alert("\n제목을 입력하세요.");
			f.subject.focus();
			return;
			
		}
		f.subject.value = str;
		
		str = f.name.value;
		str = str.trim(); //trim공백을 없애는 js 출력
		
		if(!str) {
			alert("\n이름을 입력하세요.");
			f.name.focus();
			return;
			
		}
		/* 
		//한글을 제대로 입력했는지 검사하는 js
		if(!isValidKorean(str)){
			alert("\n이름을 정확히 입력하세요.");
			f.name.focus();
			return;
		}
		 */
		f.name.value = str;
		
		//이메일을 체크하는 유틸이 이미 있어 이메일의 형식을 맞추는 function생성
		//이메일은 not null로 되어있기 때문에 선택사항임.
		//값을 잘못 입력했을때만 오류값이 출력됨.
		if(f.email.value) {
		
		if(!isValidEmail(f.email.value)) {
			alert("\n정상적인 E-Mail을 입력하세요.");
			f.email.focus();
			return;	
			}
		}
		
		str = f.content.value;
		str = str.trim(); 
		
		if(!str) {
			alert("\n내용을 입력하세요.");
			f.content.focus();
			return;
			
		}
		f.content.value = str;
		
		str = f.pwd.value;
		str = str.trim(); 
		
		if(!str) {
			alert("\n패스워드를 입력하세요.");
			f.pwd.focus();
			return;
			
		}
		f.pwd.value = str;

		
		//create.jsp 하나로 다 사용
		if(f.mode.value=="create"){
			f.action = "<%=cp%>/bbs/created.action";
		}else if(f.mode.value=="update"){
			f.action = "<%=cp%>/bbs/updated.action";
		}else if(f.mode.value=="reply"){
			f.action = "<%=cp%>/bbs/reply.action";
		}

		f.submit();
		
	}

</script>
</head>
<body>

<div id="bbs">
	<div id="bbs_title">
	게 시 판
	</div>

	<form action="" method="post" name="myForm">
		<div id="bbsCreated">
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
					<dd>
						<input type="text" name="subject" value="${dto.subject }"
						size="64" maxlength="100" class="boxTF">
					</dd>
				</dl>
			</div>
	
	
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>작&nbsp;성&nbsp;자</dt>
					<dd>
						<input type="text" name="name" value="${dto.name }"
						size="35" maxlength="20" class="boxTF">
					</dd>
				</dl>
			</div>
			
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>E&nbsp;-&nbsp;Mail</dt>
					<dd>
						<input type="text" name="email" value="${dto.email }"
						size="35" maxlength="50" class="boxTF">
					</dd>
				</dl>
			</div>
			
			
			<div id="bbsCreated_content">
				<dl>
					<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
					<dd>
						<textarea rows="12" cols="63" 
						name="content" class="boxTA">${dto.content }</textarea>
					</dd>	
				</dl>
			</div>
	
	
			<div class="bbsCreated_noLine">
				<dl>
					<dt>패스워드</dt>
					<dd>
						<input type="text" name="pwd" value="${dto.pwd }"
						size="35" maxlength="7" class="boxTF">
						&nbsp;(게시물 수정 및 삭제시 필요!!)
					</dd>
				</dl>
			</div>
		
			
		</div>
		<div id="bbsCreated_footer">
			
			<!-- 수정용 -->
			<input type="hidden" name="boardNum" value="${dto.boardNum }">
			<input type="hidden" name="pageNum" value="${dto.pageNum }">
		
			<!-- 댓글용 -->
			<input type="hidden" name="groupNum" value="${dto.groupNum }">
			<input type="hidden" name="orderNo" value="${dto.orderNo }">
			<input type="hidden" name="depth" value="${dto.depth }">
			<input type="hidden" name="parent" value="${dto.parent }">
			
			<!-- 이 창이 입력인지 수정인지 댓글인지 구분하기 위해 필요 -->
			<input type="hidden" name="mode" value="${mode }">
			
			<input type="button" value=" 등록하기 "
			class="btn2" onclick="sendIt();" />
			<input type="reset" value=" 다시입력 " 
			class="btn2" onclick="document.myForm.subject.focus();"/>
			<input type="button" value=" 작성취소 "
			class="btn2" onclick="location.href='<%=cp %>/bbs/list.action';"/>
		</div>
	
	</form>

</div>


</body>
</html>