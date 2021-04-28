<%@page import="com.HEProject.he.usersInfo.UsersInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    	
	    String loginCheckData="";
		try{
			loginCheckData= (String)session.getAttribute("userId");
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
		UsersInfoVO vo = null;
		String userClass = "";
    	String backPath = "";
		if(loginCheckData!=null){
			vo = (UsersInfoVO)request.getAttribute("vo");
			if(vo.getUserClass()==1){
	    		userClass = "개인";
	    		backPath="etcForIndi.do";
	    	}else if(vo.getUserClass()==2){
	    		userClass = "중계/협회";
	    		backPath="etcForAss.do";
	    	}else if(vo.getUserClass()==3){
	    		userClass = "통합";
	    	}else {
	    		userClass = "userClass 에러 - jsp";
	    	}
		}
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function loadOn() {
		var loginCheckData = <%=loginCheckData%>;
		loginCheck(loginCheckData);
	}
</script>
<body onload="loadOn();">
	<h1>내 정보</h1>
	<p>사업자 정보는 [설정 - 사업자 등록/수정] 에서 변경 가능합니다.</p>
		<%if(vo==null){%>
			<p>에러</p>
		<%}else{%>
			<table>
				<tr>
					<th>아이디</th>
					<td><%=vo.getUserID() %></td>
				</tr>
				<tr>
					<th>비밀번호 변경</th>
					<td><input type="button" value="변경"/>미구현</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=vo.getUserName() %></td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td><%=vo.getUserCell() %></td>
				</tr>
				<tr>
					<th>주소(필수)</th>
					<td><%=vo.getUserAdd01() %></td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td><%=vo.getUserAdd02() %></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><%=vo.getUserEmail() %></td>
				</tr>
				<tr>
					<th>회원 구분</th>
					<td><%=userClass %></td>
				</tr>
			</table>
		<%} %>
		<input type="button" value="정보 수정" onclick="location.href='modifyUserInfo.do'"/>
		<input type="button" value="뒤로 가기" onclick="location.href='<%=backPath%>'"/>
		<input type="button" value="회원 탈퇴 - 미구현" onclick="location.href='#'"/><!-- 제일 마지막 구현 -->
		
</body>
</html>