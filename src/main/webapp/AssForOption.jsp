<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설정 - 협회</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function loadon() {
		<%
		String loginCheckData="";
		try{
			loginCheckData= (String)session.getAttribute("userId");
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
		%>
		var loginCheckData = <%=loginCheckData%>;
		loginCheck(loginCheckData);
	}
</script>
<body onload="loadon()">
	<h1>설정</h1>
	<a href="showBO.do">사업자 등록/수정</a><br />
	<a href="showGrouper.do">회원 관리</a><br />
	<a href="showClient.do">거래처 관리</a>
	<input type="button" value="뒤로가기" onClick="location.href='main.do'"/>
</body>
</html>