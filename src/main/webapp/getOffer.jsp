<%@page import="com.HEProject.he.boInfo.BOInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<BOInfoVO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 제의 승락/거절</title>
</head>
<style>
div {
	border: 1px solid black;
	overflow:scroll;
	width:1200px;
	height:200px;
}
</style>
<script type="text/javascript">
	function MOcheck() {
		var moCheck = <%=request.getAttribute("MO")%>
		console.log(moCheck);
		if(moCheck==null){}
		if(moCheck==0){
			alert('정상적으로 처리되지 않았습니다.');
			return location.href="showBO.do";
		}
		if(moCheck==1){
			alert('정상적으로 처리되었습니다.');
		}
		if(moCheck==2){
			alert('정상적이지 않은 요청입니다.');
		}
	}
</script>
<body onload="MOcheck();">
	<h1>그룹 제의 승락/거절</h1>
	<div>
		<%if(list.size()==0){ %>
		<p>들어온 그룹 제의가 없습니다.</p>
		<%}else{for(int i = 0 ; i < list.size(); i++){ %>
		<p><%=i+1 %>. 업체명 : <%=list.get(i).getCpName() %> | 사업자번호 : <%=list.get(i).getBoNumber() %> | 대표자명 : <%=list.get(i).getBoName() %> | 대표 번호 : <%=list.get(i).getBoPhone() %> | 이메일 : <%=list.get(i).getBoMail() %> |&nbsp;&nbsp;  <input type="button" value="승락" onclick="location.href='modifyOffer.do?boNumber=<%=list.get(i).getBoNumber() %>&state=1'"/>&nbsp;&nbsp; <input type="button" value="거절" onclick="location.href='modifyOffer.do?boNumber=<%=list.get(i).getBoNumber() %>&state=2'"/> </p><br />
		<%}}%>
	</div>
	<input type="button" value="뒤로가기" onclick="location.href='showMyGroup.do'">
</body>
</html>