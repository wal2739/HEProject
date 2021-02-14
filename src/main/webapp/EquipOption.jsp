<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 옵션</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function loadOn() {
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
	}
	function closeOnClick(idValue) {
		var idValue = document.getElementById(idValue.getAttribute('id')).getAttribute('id');
		opener.document.getElementById("EquipOption").value = document.getElementById(idValue).value;
		window.close();
	}
</script>
<body onload="loadOn();">
	<h1>차량 옵션</h1>
	<p>원하시는 옵션을 선택해주세요.</p>
	<input type="image" src="/image/inverter.jpg" id="inverter" value="인버터" onclick="closeOnClick(this)"/>
	<input type="image" src="/image/refraction.jpg" id="refraction" value="굴절" onclick="closeOnClick(this)"/>
	<input type="image" src="/image/won.jpg" id="won" value="원찌" onclick="closeOnClick(this)"/>
	<input type="image" src="/image/dan.jpg" id="dan" value="단축" onclick="closeOnClick(this)"/>
	
</body>
</html>