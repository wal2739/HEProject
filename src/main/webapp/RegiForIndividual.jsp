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
<title>등록 - 개인</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function loadOn() {
		var loginCheckData = '<%=loginCheckData%>';
		loginCheck(loginCheckData);
	}
</script>
<style>
	table, th, td {
	    border: 1px solid black;
	    text-align: center;
	}
	table {
	    border-collapse: collapse;
	    display: inline-block;
	}
</style>
<body onload="loadOn();">
	<h1>등록 관리</h1>
	<a href="showBO.do">사업자 등록/수정</a>	<br />
	<a href="WorkerInfo.do">대리 작업자 등록/수정</a>	<br />
	<a href="showVehicleInfo.do">차량등록/수정</a>	<br />
	<a href="showMyGroup.do">중계/협회 등록&수정</a>	<br />
	<input type="button" value="뒤로가기" onClick="location.href='main.do'"/>
	
</body>
</html>