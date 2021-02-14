<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
	    String loginCheckData="";
		String checkData="";
		try{
			loginCheckData= (String)session.getAttribute("usRn");
			if(loginCheckData==null){
				checkData="실패";
			}else{
				checkData="성공";
			}
			System.out.println(checkData);
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 확인</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script>
	
	
	var time = 31;
	var sec = "";
	var wintimer;
	clearTimeout(wintimer);
	wintimer= setTimeout("closewin()",30000);//천분의 1초 단위로 초를 지정합니다
	var timerFunc = setInterval(function() {
		sec=time%60;
		   document.getElementById("timeSet").innerHTML=sec +"초 뒤 자동으로 창이 닫힙니다.";
		   console.log(sec);
		   console.log()
		   time--;
		}, 1000);

	function closewin() {
	    window.close();
	}
	function workerCode() {
		var checkData = '<%=checkData%>';
		console.log(checkData);
		if(checkData=='성공'){
			var loginCheckData = '<%=loginCheckData%>';
		}else if(checkData=='실패'){
			var loginCheckData = null;
		}
		console.log(loginCheckData);
		var checkNum=loginChecknBreak(loginCheckData)*1;
		if(checkNum==0){
			return location.href='login.jsp';
		}
		document.getElementById("workerCode").value = opener.document.getElementById("workerCode").value;

	}
</script>
<style>
#timeset{
	
}
</style>
<body onload="workerCode()">
	<h1>아이디 확인</h1>
	<p>대리작업자 아이디 : <input type="text" id="workerCode" readonly="readonly"/></p>
	<p id="timeSet" style="color: red;"></p>
	<p> 아이디는 대리작업자 목록에서 아이디를 다시 확인하실 수 있습니다.</p>
	<input type="button" value="닫기" onclick="closewin();"/>
</body>
</html>