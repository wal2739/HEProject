<%@page import="com.HEProject.he.workInfo.WorkInfo_ST0VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<WorkInfo_ST0VO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 작업 목록</title>
</head>
<style>
	div, p {
		border: 1px solid black;
	}
</style>
<script type="text/javascript">
	function getAllWorkInfo(workCode) {
		window.name="parentForm";
		window.open("getAllWorkInfo.do?wCode="+workCode,"getAllWorkInfo","width=1250,height=500,resizable=no,scrollbars=yes");
	}
	function scsCode() {
		var scsCode = <%=request.getAttribute("newWorkSuccess")%>;
		if(scsCode==null){
		}else if(scsCode==0){
			alert('작업 등록이 정상적으로 처리되지 않았습니다. 다시 시도 해주세요.');
		}else if(scsCode==1){
			alert('작업이 성공적으로 등록 되었습니다.');
		}else{
			alert('정상적인 요청이 아닙니다.');
		}
	}
	function scsMCode() {
		var scsCode = <%=request.getAttribute("modWorkSuccess")%>;
		if(scsCode==null){
		}else if(scsCode==0){
			alert('작업 수정이 정상적으로 처리되지 않았습니다. 다시 시도 해주세요.');
		}else if(scsCode==1){
			alert('작업이 성공적으로 수정 되었습니다.');
		}else{
			alert('정상적인 요청이 아닙니다.');
		}
	}
</script>
<body onload="scsCode();scsMCode();">
	<h1>등록된 작업 목록</h1>
	<h2>상세 보기를 원하시면 작업을 클릭 해주세요.</h2>
	<div>
		<%if(list.size()==0){%>
			<p>등록된 작업이 없습니다.</p>
		<%}else{for(int i = 0 ; i < list.size(); i++){%>
			<input type="button" value="수정하기" onClick="location.href='modifyWork.do?wCode=<%=list.get(i).getWorkCode()%>'"/><p onclick="getAllWorkInfo('<%=list.get(i).getWorkCode()%>');"><%=i+1 %>. 거래처 : <%=list.get(i).getClientCPName() %> | 거래처 전화번호 : <%=list.get(i).getClientPhone() %> | 현장명 : <%=list.get(i).getWorkField() %> | 현장 주소 : <%=list.get(i).getFieldAdd01() %> , <%=list.get(i).getFieldAdd02() %></p>
		<%}} %>
	</div>
	<input type="button" value="등록하기" onClick="location.href='newWork.do'"/>
	<input type="button" value="삭제하기" onClick="location.href='cancelWork.do'"/>
	<input type="button" value="돌아가기" onClick="location.href='workMain.do'"/>
</body>
</html>