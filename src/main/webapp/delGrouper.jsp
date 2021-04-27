<%@page import="com.HEProject.he.usersInfo.UsersInfoVO"%>
<%@page import="com.HEProject.he.boInfo.BOInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<UsersInfoVO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제</title>
</head>
<style>
	#userList{
		overflow:scroll;
		width:500px;
		height:250px;
		border: 1px solid black;
	}
</style>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function delCheck() {
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
		
		var checkNum = <%=request.getAttribute("delGrouperCheckNum")%>;
		if(checkNum==null){
			
		}else if(checkNum==0){
			alert('정상적으로 처리되지 않았습니다.');
		}else if(checkNum==1){
			alert('정상적으로 처리 되었습니다.');
		}else{
			alert('정상적인 요청이 아닙니다.');
		}
	}
</script>
<body onload="delCheck();">
	<h1>회원 삭제</h1>
	<form action="delGrouperAct.do" onsubmit="return confirm('정말로 제명 하시겠습니까?');">
		<div id="userList">
			<%if(list==null){%>
				<p>현재 등록된 회원이 없습니다.</p>
			<%}else{ 
				for(int i=0;i<list.size();i++){
			%>
				<p><input type="checkbox" value="<%=list.get(i).getUsRn() %>" name="chkUsRn" id="chkUsRn"/><%=i+1 %>. 이름 : <%= list.get(i).getUserName()%> 아이디 : <%=list.get(i).getUserID() %> 전화번호 : <%=list.get(i).getUserCell() %></p>
				<hr />
			<%}}%>
		</div>
		<input type="submit" value="제명"/>
	</form>
	<input type="button" value="뒤로가기" onclick="location.href='showGrouper.do'" />
	
</body>
</html>