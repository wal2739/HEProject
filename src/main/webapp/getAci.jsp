<%@page import="com.HEProject.he.boInfo.BOInfoVO"%>
<%@page import="com.HEProject.he.usersInfo.SearchInfoVO"%>
<%@page import="com.HEProject.he.groupAssInfo.GroupAssInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    	List<BOInfoVO> gList = (List)request.getAttribute("gList");
		List<SearchInfoVO> sList = (List)request.getAttribute("sList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 신청 현황</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function checkModify() {
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
		
		var checkNum = <%=request.getAttribute("modifyAciCheck")%>;
		if(checkNum==null){
			
		}else if(checkNum==0){
			alert('정상적으로 처리되지 않았습니다. 다시 시도해주세요.');
		}else if(checkNum==1){
			alert('정상적으로 처리되었습니다.');
		}else {
			alert('유효하지 않은 요청입니다.');
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
<body onload="checkModify();">
	<h1>가입 신청 현황</h1>
	<div>
		<%
		if(gList.size()==0){%>
		<p>가입 신청이 없습니다.</p>
		<%}		
		for(int i = 0 ; i < gList.size(); i++){%>
			<p>
				<%=i+1 %>. 이름 : <%=gList.get(i).getBoName() %> | 전화 번호 : <%=gList.get(i).getBoPhone() %> | 이메일 : <%=gList.get(i).getBoMail() %> |
				<%for(int j = 0 ; j < sList.size(); j++){
					if(gList.get(i).getUsRn().equals(sList.get(j).getUsRn())){%>
						 차량 <%=j+1 %> : <%=sList.get(j).getEquipType() %> , <%=sList.get(j).getEquipClass() %> , <%=sList.get(j).getEquipOption() %> | 
					<%}}%> 
				&nbsp;&nbsp;<input type="button" value="승락" onclick="location.href='modifyAci.do?usRn=<%=gList.get(i).getUsRn() %>&state=1'"/>
				&nbsp;&nbsp;<input type="button" value="거절" onclick="location.href='modifyAci.do?usRn=<%=gList.get(i).getUsRn() %>&state=2'"/> 
			</p><br />
		<%} %>
	</div>
	<input type="button" value="뒤로가기" onclick="location.href='showGrouper.do'" />
</body>
</html>