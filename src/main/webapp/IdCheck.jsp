<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
</head>
<script type="text/javascript">
	function parentVal() {
		var userId = opener.document.getElementById("userId").value;
		
		document.getElementById("userId").value = userId;
	}
	
	function useId() {
		opener.document.getElementById("idcheck").value=1;
		opener.document.getElementById("userId").value=document.getElementById("userId").value;
		
		self.close();
	}
	function notUseId() {
		opener.document.getElementById("idcheck").value=0;
		opener.document.getElementById("userId").value=document.getElementById("userId").value;
		self.close();
	}
</script>
<body onload="parentVal();">
	<h1>아이디 중복체크</h1>
	<form action="IdCheck.do">
		<input type="hidden" id="userId" name="userId" maxlength="12"/>
		
	<p id="msg"></p>
	<%if(request.getAttribute("idCheck")==null){ %>
	<input type="submit" value="중복 확인"/>
	</form>
	<%}else if(request.getAttribute("idCheck").equals(1)){ %>
		<p>사용 가능한 아이디입니다.</p>
		<input type="button" value="사용하기" onclick="useId();"/>
	<%}else if(request.getAttribute("idCheck").equals(0)){ %>
		<p>사용 불가능한 아이디입니다. 아이디를 다시 입력 해주세요.</p>
		<input type="button" value="돌아가기" onclick="notUseId();"/>
	<%}else{}%>
</body>
</html>