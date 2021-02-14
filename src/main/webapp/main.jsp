<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
		<%
		String loginCheckData = "";
		Object userClassData = "";
		String checkData="";
		try{
			loginCheckData = (String)session.getAttribute("userId");
			userClassData = session.getAttribute("userClass");
			if(loginCheckData==null){
				checkData="실패";
			}else{
				checkData="성공";
			}
		}catch(NullPointerException e){
			userClassData = "0";
			System.err.println("비회원 아이디 에러 : "+e);
		}catch(NumberFormatException e){
			System.err.println("비회원 userClass int형 변환 에러 : "+e);
		}
		
		System.out.println(checkData);
		%>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function loadOn() {
		var checkData = '<%=checkData%>';
		if(checkData=='성공'){
			var loginCheckData = '<%=loginCheckData%>';
		}else if(checkData=='실패'){
			var loginCheckData = null;
		}
		loginCheck(loginCheckData);
	}
	
</script>
<style>
	
</style>
<body onload="loadOn();">
	<h1>메인 화면</h1>
	<%if(checkData=="실패"){}else if(checkData=="성공"){ %>
	<%if(userClassData.equals(1)){ %><h2>개인 사용자 화면</h2><a href="RegiForIndividual.do">등록</a><br /><a href="workMainForIndi.do">작업</a><br /><a href="#">정산</a><br /><a href="etcForIndi.do">기타</a><%} %>
	<%if(userClassData.equals(2)){ %><h2>중계/협회 사용자 화면</h2><a href="AssForOption.jsp">설정</a><br /><a href="workMain.do">작업</a><br /><a href="#">정산</a><br /><a href="#">기타</a><%} %>
	<%if(userClassData.equals(3)){ %><h2>통합 사용자 화면</h2><a href="#">설정</a><br /><a href="#">등록</a><br /><a href="#">작업</a><br /><a href="#">정산</a><br /><a href="">기타</a><%} %>
	<%if(userClassData.equals(4)){ %><h1>관리자 계정 미구현</h1><%} %>
	<%} %>
	<br /><a href="#">메세지 페이지로</a>
</body>
</html>