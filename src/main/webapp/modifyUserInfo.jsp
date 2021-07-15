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
    	String[] userCell = new String[3];
		if(loginCheckData!=null){
			vo = (UsersInfoVO)request.getAttribute("vo");
			userCell = vo.getUserCell().split("-");
		}
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function validate() {
		var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일이 적합한지 검사할 정규식
		
		var name = document.getElementById("userName").value;
		var cell = document.getElementById("userCell01").value + "-" + document.getElementById("userCell02").value + "-" + document.getElementById("userCell03").value;
		var add01 = document.getElementById("userAdd01").value;
		var add02 = document.getElementById("userAdd02").value;
		var email = document.getElementById("userEmail").value;

		if(forms.userName.value=="") {
	        alert("이름을 입력해 주세요");
	        forms.userName.focus();
	        return false;
	    }
		
		if(document.getElementById("userCell01").value==""||document.getElementById("userCell02").value==""||document.getElementById("userCell03").value=="") {
	        alert("핸드폰 번호를 입력해 주세요");
	        document.getElementById("userCell01").focus();
	        return false;
	    }
	    
	    if(add01=="") {
	    	alert('주소를 입력해주세요.');
			document.getElementById("userAdd01").focus();
	        return false;
	    }
	    if(email=="") {
	        alert("이메일을 입력해 주세요");
	        document.getElementById("userEmail").focus();
	        return false;
	    }
	
	    if(!re2.test(email)) {
	    	alert("적합하지 않은 이메일 형식입니다.");
	        document.getElementById("userEmail").focus();
	        return false;
	    }
	
	    
	    
	    document.getElementById('userCell').value = cell;
	}
	function loadOn() {
		
		var loginCheckData = '<%=loginCheckData%>';
		loginCheck(loginCheckData);
		
		var mdfus = <%=request.getAttribute("MDFUS")%>;
		switch (mdfus) {
		case null:
			break;
		case 0:
			alert('정상적으로 수정되지 않았습니다. 다시 시도해주세요.');
			location.href='modifyUserInfo.do';
			break;
		case 1:
			alert('정상적으로 수정었습니다.');
			location.href='myPage.do';
			break;
		default:
			alert('정상적인 요청이 아닙니다.');
			location.href='modifyUserInfo.do';
			break;
		}
	}
</script>

<style>
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
	<h1>정보 수정</h1>
	<%if(vo==null){ %>
		<p>에러</p>
	<%}else{ %>
		<form action="modifyUserInfoAct.do" name="forms" id="forms" >
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="userName" id="userName" value="<%=vo.getUserName()%>"/></td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td>
						<input type="text" name="userCell01" id="userCell01" maxlength="3" value="<%=userCell[0]%>"/>-
						<input type="text" name="userCell02" id="userCell02" maxlength="4" value="<%=userCell[1]%>"/>-
						<input type="text" name="userCell03" id="userCell03" maxlength="4" value="<%=userCell[2]%>"/>
						<input type="hidden" name="userCell" id="userCell" />
					</td>
				</tr>
				<tr>
					<td>주소(필수)</td>
					<td><input type="text" name="userAdd01" id="userAdd01" value="<%=vo.getUserAdd01()%>"/></td>
				</tr>
				<tr>
					<td>상세 주소</td>
					<td><input type="text" name="userAdd02" id="userAdd02" value="<%=vo.getUserAdd02()%>"/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="userEmail" id="userEmail" value="<%=vo.getUserEmail()%>"/></td>
				</tr>
			</table>
			<input type="submit" value="변경 완료" onclick="return validate();"/>
			<input type="button" value="뒤로 가기" onClick="location.href='myPage.do'"/>
		</form>
	<%} %>
</body>
</html>