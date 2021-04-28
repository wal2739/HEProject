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
<title>작업</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function loadOn() {
		var loginCheckData = <%=loginCheckData%>;
		loginCheck(loginCheckData);
	}
	
</script>
<body onload="loadOn();">
	<h1>작업</h1>
	<a href="workInfo.do">작업 등록/수정</a>
	<a href="workOrderInfo.do">작업자 발주관리</a>
	<a href="#">회원 월 발주 현황</a>
	<a href="#">완료 작업 조회</a>	
	<input type="button" value="뒤로가기" onClick="location.href='main.do'"/>
	
</body>
</html>