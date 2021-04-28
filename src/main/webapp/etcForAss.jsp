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
<title>기타 - 중계</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function loadOn() {
		var loginCheckData = <%=loginCheckData%>;
		loginCheck(loginCheckData);
	}
</script>
<body onload="loadOn();">
	<h1>기타 - 중계</h1>
	<a href="#">요청 사항 관리 및 공지 등록</a>
	<a href="eachBoard.do?boardClassNum=0">자유 게시판</a>
	<a href="eachBoard.do?boardClassNum=2">중계 사용자 게시판</a>
	<a href="eachBoard.do?boardClassNum=3">공지 게시판</a>
	<a href="checkIdentity.do">내 정보</a>
</body>
</html>