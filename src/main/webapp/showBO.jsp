<%@page import="com.HEProject.he.usersInfo.UsersInfoVO"%>
<%@page import="com.HEProject.he.boInfo.BOInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
    <%
    	BOInfoVO vo = (BOInfoVO)request.getAttribute("vo"); 
		String loginCheckData="";
		boolean checkPT = true;

	    try{
			vo.getBoNumber();
			checkPT=false;
	    }catch(NullPointerException e){
	    	vo = new BOInfoVO();
			vo.setBoNumber("1");
			vo.setBoName("1");
			vo.setUsRn("1");
			vo.setBoRrn("1");
			vo.setBoPhone("1");
			vo.setBoCell("1");
			vo.setBoMail("1");
			vo.setBoLicense(0);
			vo.setBoAdd01("1");
			vo.setBoAdd02("1");
			vo.setBoAcc(0);
			vo.setBoAccBack("1");
			System.out.println("사업자 정보 등록 널 에러 : " + e);
		}
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
<title>사업자 등록/수정</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function delCheck() {
		var boCheck = <%=request.getAttribute("delCheck")%>
		console.log(boCheck);
		if(boCheck==null){}
		if(boCheck==0){
			alert('사업자 정보가 정상적으로 삭제 되지 않았습니다. 다시 시도해주세요.');
		}
		if(boCheck==1){
			alert('사업자 정보가 정상적으로 삭제 되었습니다.');
	//		return location.href="showBO.do";
		}
		
	}
	function loadOn() {
		var loginCheckData = <%=loginCheckData%>;
		loginCheck(loginCheckData);
		var cpName = '<%=vo.getCpName()%>';
		if(cpName=='없음'){
			document.getElementById('backBTN').setAttribute('onClick',"location.href='RegiForIndividual.do'");
		}else{
			document.getElementById('backBTN').setAttribute('onClick',"location.href='AssForOption.jsp'");
		}
	}
</script><style>
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
	<h1>사업자 등록/수정</h1>
	<h2>등록 된 사업자 정보</h2>
	<%if(checkPT==true){ %>
		<p>현재 등록된 사업자 정보가 없습니다.</p>
		<input type="button" value="등록하기" onClick="location.href='newBO.do'"/>
		<input type="button" value="돌아가기" onClick="location.href='RegiForIndividual.do'"/>
	 <%}else{ %>
	 	<table>
	 		<tr>
	 			<td>사업자 번호</td>
	 			<td><%=vo.getBoNumber() %></td>
	 		</tr>
	 		<tr>
	 			<td>업체명</td>
	 			<td><%=vo.getCpName() %></td>
	 		</tr>
	 		<tr>
	 			<td>사업자명</td>
	 			<td><%=vo.getBoName() %></td>
	 		</tr>
	 		<tr>
	 			<td>업종</td>
	 			<td><%=vo.getTob01() %></td>
	 		</tr>
	 		<tr>
	 			<td>업태</td>
	 			<td><%=vo.getTob02() %></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 주민등록 번호</td>
	 			<td><%=vo.getBoRrn() %></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 전화번호</td>
	 			<td><%=vo.getBoPhone() %></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 핸드폰 번호</td>
	 			<td><%=vo.getBoCell() %></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 이메일</td>
	 			<td><%=vo.getBoMail() %></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 사본 여부</td>
	 			<td><%=vo.getBoLicense() %></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 주소</td>
	 			<td><%=vo.getBoAdd01() %></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 상세 주소</td>
	 			<td><%=vo.getBoAdd02() %></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 계좌</td>
	 			<td><%=vo.getBoAcc() %></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 계좌 은행</td>
	 			<td><%=vo.getBoAccBack() %></td>
	 		</tr>
	 	</table>
	 	<input type="button" value="수정하기" onClick="location.href='modifyBO.do'"/>
	 	<input type="button" value="뒤로가기" name="backBTN" id="backBTN"/>
<!-- 	 	<input type="button" value="삭제하기" onClick="location.href='deleteBO.do'"/> -->
	 <%} %>
</body>
</html>