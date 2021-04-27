<%@page import="com.HEProject.he.clientInfo.ClientInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%List<ClientInfoVO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 정보</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
function ModifyCliCheck() {
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
	
	var boCheck = <%=request.getAttribute("modCliCheck")%>
	console.log(boCheck);
	if(boCheck==null){
		
	}else if(boCheck==0){
		alert('정상적으로 거래처 등록이 진행되지 않았습니다. 잠시 후 다시 시도해주세요.');
		return location.href="showClient.do";		
	}else if(boCheck==1){
		alert('거래처 등록이 정상적으로 처리 되었습니다.');
		return location.href="showClient.do";		
	}else{
		alert('정상적인 요청이 아닙니다.');
		return location.href="showClient.do";
	}
}
</script>
<style>
	div {
		border: 1px solid black;
		overflow:scroll;
		width:1200px;
		height:200px;
	}
</style>
<body onload="ModifyCliCheck();">
	<h1>거래처 정보</h1>
	<div>
	<%if(list.size()==0){%>
		<p>데이터가 없습니다.</p>
	<%}else{for(int i = 0 ; i < list.size(); i++){%>
		<p><%=i+1 %>. 정보 	<input type="button" value="수정" onclick="location.href='modifyClient.do?clientCode=<%=list.get(i).getClientCode() %>'" /></p>
	<%}}%>
	</div>
	<input type="button" value="추가" onclick="location.href='newClient.do'" />
	<input type="button" value="삭제" onclick="location.href='delClient.do'" />
	<input type="button" value="뒤로가기" onclick="location.href='AssForOption.jsp'" />
</body>
</html>