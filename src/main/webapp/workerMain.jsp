<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
	<% 
		String loginCheckData="";
		try{
			loginCheckData= (String)session.getAttribute("workerCode");
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
	%>
<html>
<head>
<meta charset="UTF-8">
<title>대리작업자 메인</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function loadOn() {
		var loginCheckData = <%=loginCheckData%>;
		loginCheck(loginCheckData);
	}
</script>
<body onload="loadOn();">
	<h1>대리작업자 메인</h1>
	미구현
</body>
</html>