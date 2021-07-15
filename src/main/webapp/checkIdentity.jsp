<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    
	    String loginCheckData="";
		try{
			loginCheckData= (String)session.getAttribute("userId");
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
		int userClass = 9999;
    	String backPath = "";

		if(loginCheckData!=null){
			userClass = (Integer)session.getAttribute("userClass");
			if(userClass==1){
	    		backPath="etcForIndi.do";
	    	}else if(userClass==2){
	    		backPath="etcForAss.do";
	    	}else {
	    		
	    	}
		}
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 확인</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>

<script type="text/javascript">
	function checkPw() {
		var pw = document.getElementById("passWord").value;
		if(pw==""){
			alert('비밀번호를 입력 해주세요.');
			return false;
		}
		location.href='checkIdentityAct.do?passWord='+pw;
	}
	function loadOn() {
		var loginCheckData = '<%=loginCheckData%>';
		loginCheck(loginCheckData);
		
		var pwCheck = <%=request.getAttribute("pwCheck")%>;
		switch (pwCheck) {
		case null:
			break;
		case 0:
			alert('비밀번호가 일치 하지 않습니다.');
			location.href='checkIdentity.do';
			break;
		case 1:
			location.href='myPage.do';
			break;
		default:
			alert('정상적인 요청이 아닙니다.');
			location.href='checkIdentity.do';
			break;
		}
	}
</script>
<body onload="loadOn();">
	<h1>본인 확인</h1>
	<p>본인 확인을 위해 현재 비밀번호를 입력해주세요.</p>
	<input type="password" id="passWord" name="passWord"/><input type="button" value="확인" onclick="return checkPw();"/><br />
	<input type="button" value="뒤로가기" onclick="location.href='<%=backPath%>'"/>
</body>
</html>