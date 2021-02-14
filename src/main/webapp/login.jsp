<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
function loginST() {
	var loginST = <%=request.getAttribute("loginST")%>
	if(loginST==null){}
	if(loginST==0){
		alert('아이디와 비밀번호를 확인해주세요.');
	}
	if(loginST==2){
		alert('잘못된 접근입니다.');
	}
}
</script>
<style>
	
</style>
</head>
<body onload="loginST();">
	<h1>로그인</h1>
	<h2>[관리자 계정 : test01]</h2>	<br />
	<h2>[사업자 계정 : test04]</h2>	<br />
	<h2>[중계/협회 계정 : test05]</h2>	<br />
	<h2>[통합 계정 : test02]</h2>	<br />
	<h3>[비밀번호는 아이디와 동일]</h3>	<br />
	<form action="login.do" method="post">
		<table> 
			<tr>
				<th>아이디</th>
				<th><input type="text" name="userId"/></th>
			</tr>
			<tr>
				<th>비밀번호</th>
				<th><input type="password" name="userPW"/></th>
			</tr>
			<tr>
				<th>
					<input id="log" type="submit" value="로그인"/>
					<input type="button" value="회원가입" onClick="location.href='newUser.jsp'"/>
					<a href="workerLogin.jsp">대리작업자 로그인</a>
				</th>
			</tr>
		</table>
	</form>  
</body>
</html>