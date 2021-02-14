<%@page import="com.HEProject.he.boInfo.BOInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<BOInfoVO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 중계/협회 목록</title>
</head>
<script type="text/javascript">
function messageCheck() {
	window.open("messageCheck.do?wMsg=1","EquipType","width=1000,height=600,resizable=no,scrollbars=yes");
}
</script>
<style>
	div {
		border: 1px solid black;
		overflow:scroll;
		width:1200px;
		height:200px;
	}
	table {
		border: solid black 1px;
		width: 100%;
	}
	tr, td, th{
		border: solid black 1px;
	}
</style>
<body>
	<h1>등록된 중계/협회 목록 및 수정</h1>
	<div>
		<%if(list.size()==0){ %>
		<p>등록된 중계/협회 목록이 없습니다.</p>
		<%}else{for(int i = 0 ; i < list.size(); i++){ %>
		<p><%=i+1 %>. 업체명 : <%=list.get(i).getCpName() %> 사업자번호 : <%=list.get(i).getBoNumber() %> 대표자명 : <%=list.get(i).getBoName() %> 대표 번호 : <%=list.get(i).getBoPhone() %> 핸드폰번호 : <%=list.get(i).getBoCell() %> 이메일 : <%=list.get(i).getBoMail() %> </p><br />
		<%}}%>
	</div>
	
	
	<input type="button" value="신규 등록" onclick="location.href='showAssList.do'">
	<input type="button" value="그룹 제의 확인" onclick="location.href='getOffer.do'">
	<input type="button" value="그룹 탈퇴" onclick="location.href='delGroup.do'">

	<input type="button" value="뒤로가기" onclick="location.href='RegiForIndividual.do'">
	<input type="button" value="메세지" onclick="messageCheck();"/>
</body>
</html>