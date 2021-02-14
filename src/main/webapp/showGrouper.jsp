<%@page import="com.HEProject.he.usersInfo.UsersInfoVO"%>
<%@page import="java.util.List"%>
<%@page import="com.HEProject.he.groupAssInfo.GroupAssInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<UsersInfoVO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<script type="text/javascript">
	function messageCheck() {
		window.open("messageCheck.do?wMsg=1","EquipType","width=1000,height=600,resizable=no,scrollbars=yes");
	}
</script>
<style>
	#userList{
		overflow:scroll;
		width:500px;
		height:250px;
		border: 1px solid black;
	}
</style>
<body>
	<h1>현재 등록된 회원 목록</h1>
	<div id="userList">
		<%if(list==null){%>
			<p>현재 등록된 회원 정보가 없습니다.</p>
		<%}else{ 
			for(int i=0;i<list.size();i++){
		%>
			<p><%=i+1 %>. 이름 : <%= list.get(i).getUserName()%> 아이디 : <%=list.get(i).getUserID() %> 전화번호 : <%=list.get(i).getUserCell() %></p>
			<hr />
		<%}}%>
	</div>
	<input type="button" value="회원 수정/삭제" onclick="location.href='delGrouper.do'"/>
	<input type="button" value="회원 찾기/추가" onclick="location.href='searchGrouper.do'"/>
	<input type="button" value="가입 신청 확인" onclick="location.href='getAci.do'"/>
	<input type="button" value="뒤로가기" onclick="location.href='AssForOption.jsp'" />
	<input type="button" value="메세지" onclick="messageCheck();"/>
	
</body>
</html>