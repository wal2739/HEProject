<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
		String loginCheckData="";
		try{
			loginCheckData= (String)session.getAttribute("userId");
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 - 기타</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function loadOn() {
		var loginCheckData = <%=loginCheckData%>;
		loginCheck(loginCheckData);
	}
	
</script>
<body onload="loadOn();">
	<h1>개인 - 기타</h1>
	<a href="#">중계/협회 공지/알림</a>
	<a href="eachBoard.do?boardClassNum=1">개인 사용자 게시판</a>
	<a href="eachBoard.do?boardClassNum=0">자유 게시판</a>
	<a href="eachBoard.do?boardClassNum=3">공지 게시판</a>
	<a href="checkIdentity.do">내 정보</a>
	<input type="button" value="뒤로가기" onclick="location.href='main.do'"/>
</body>
</html>