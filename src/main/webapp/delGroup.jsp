<%@page import="com.HEProject.he.boInfo.BOInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<BOInfoVO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 삭제/탈퇴</title>
<style>
	div {
		border: 1px solid black;
		overflow:scroll;
		width:1200px;
		height:200px;
	}
	table {
		border: solid black 1px;
		width: 100%;
	}
	tr, td, th{
		border: solid black 1px;
	}
</style>
<script type="text/javascript">
	function successCheck() {
		var checkNum = <%=request.getAttribute("delCheckNum")%>;
		if(checkNum==null){}
		if(checkNum==0){
			alert('정상적으로 처리되지 않았습니다.');
		}
		if(checkNum==1){
			alert('정상적으로 처리 되었습니다.');
		}
		if(checkNum==2){
			alert('정상적인 요청이 아닙니다.');
		}
	}
</script>
</head>
<body onload="successCheck();">
	<h1>그룹 삭제/탈퇴</h1>

	<form action="delGroupAction.do" onsubmit="return confirm('정말로 탈퇴 하시겠습니까?');">
		<div>
			<%if(list.size()==0){%>
				<p>가입된 그룹 목록이 없습니다.</p>
			  <% }else{%>
			<%for(int i = 0 ; i < list.size(); i++){ %>
				<p><input type="checkbox" value="<%=list.get(i).getUsRn() %>" name="chkUsRn" id="chkUsRn"/> <%=i+1 %>. 업체명 : <%=list.get(i).getCpName() %> 사업자번호 : <%=list.get(i).getBoNumber() %> 대표자명 : <%=list.get(i).getBoName() %> 대표 번호 : <%=list.get(i).getBoPhone() %> 
				핸드폰번호 : <%=list.get(i).getBoCell() %> 이메일 : <%=list.get(i).getBoMail() %> </p>
			<%}	} %>
		</div>
		<input type="submit" value="탈퇴" />
	</form>
	<input type="button" value="뒤로가기" onclick="location.href='showMyGroup.do'">

</body>
</html>