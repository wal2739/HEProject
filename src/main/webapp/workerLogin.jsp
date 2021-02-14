<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대리작업자 로그인</title>
<script type="text/javascript">
	function loginST() {
		var workerLoginST = <%=request.getAttribute("workerLoginST")%>
		if(workerLoginST==null){}
		if(workerLoginST==0){
			alert('아이디와 비밀번호를 확인해주세요.');
		}
	}
</script>
</head>
<body onload="loginST()">
	<h1>대리작업자 로그인</h1>
	
	<form action="workerLogin.do" method="post">
		<table> 
			<tr>
				<th>아이디</th>
				<th><input type="text" name="workerID"/></th>
			</tr>
			<tr>
				<th>비밀번호</th>
				<th><input type="password" name="workerPW"/></th>
			</tr>
			<tr>
				<th>
					<input id="log" type="submit" value="로그인"/>
					<input type="button" value="뒤로가기" onClick="location.href='login.jsp'"/>
					
				</th>
			</tr>
		</table>
	</form>
</body>
</html>