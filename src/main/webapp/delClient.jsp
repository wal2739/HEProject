<%@page import="com.HEProject.he.clientInfo.ClientInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%List<ClientInfoVO> list = (List)request.getAttribute("list"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 삭제</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
function ModifyCliCheck() {
	
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
	
	var boCheck = <%=request.getAttribute("delCliCheck")%>
	console.log(boCheck);
	if(boCheck==null){
	}else if(boCheck==0){
		alert('정상적으로 거래처 삭제가 진행되지 않았습니다. 잠시 후 다시 시도해주세요.');
	}else if(boCheck==1){
		alert('거래처 삭제가 정상적으로 처리 되었습니다.');
	}else{
		alert('정상적인 요청이 아닙니다.');
	}
}
function delCheck() {
    var chk_obj = document.getElementsByName("chkDel");
    var chk_leng = chk_obj.length;
    var checked = 0;
    for (i=0; i < chk_leng; i++) {
        if (chk_obj[i].checked == true) {
            checked += 1;
        }
    }
    if(checked==0){
    	alert('최소 하나 이상 선택 해주세요.');
    	return false;
    }
}

</script>
<style>
	div {
		border: 1px solid black;
		overflow:scroll;
		width:1200px;
		height:200px;
	}
</style>
<body onload="ModifyCliCheck();">
	<h1>거래처 삭제</h1>
	<form action="delClientAct.do">
		<div>
		<%if(list.size()==0){%>
			<p>데이터가 없습니다.</p>
		<%}else{for(int i = 0 ; i < list.size(); i++){%>
			<p><input type="checkbox" name="chkDel" id="chkDel" value="<%=list.get(i).getClientCode()%>"/><%=i+1 %>. 정보</p>
		<%}}%>
		</div>
		<input type="submit" value="삭제" onclick="return delCheck();"/>
	</form>
	<input type="button" value="뒤로가기" onclick="location.href='showClient.do'" />
</body>
</html>