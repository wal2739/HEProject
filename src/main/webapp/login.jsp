<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/login.css">
	<script src="/js/jquery-3.6.0.min.js"></script>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	<section class="login-form">
	    <!--H1로그인은 차후에 로고 대체 예정-->
	    <h1>로그인</h1>
		<form action="login.do" method="post">
			<!--로그인 클래스-->
	      	<div class="int-area">
		        <input type="text" name="userId" id="userId" autocomplete="off" required>
		        <label for="id">ID</label>
		    </div>
		    <!--비밀번호 클래스-->
		    <div class="int-area">
		        <input type="password" name="userPW" id="userPW" autocomplete="off" required>
		        <label for="pw">PW</label>
		    </div>
		    <!--버튼 클래스-->
		    <div class="btn-area">
		    	<button type="submit">LOGIN</button>
		    </div>
			<!-- <table> 
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
			</table> -->
		</form>
		<div class="caption">
	    	<a href="#">아이디 혹은 비밀번호를 잊으셨나요? - 미구현</a>
	    </div>
	    <div class="signin">
	    	<a href="newUser.jsp">회원가입</a>
	    </div>  
    </section>
    <!-- 수정 목록 >> 대리작업자 로그인 태그 생성, 아이디 비밀번호 찾기 폼 생성 -->
</body>
</html>