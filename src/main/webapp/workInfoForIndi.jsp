<%@page import="com.HEProject.he.workInfo.WorkInfo_ST1VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<WorkInfo_ST1VO> list = (List)request.getAttribute("list");%>
    <%
    	String[] status = new String[list.size()];
    	if(list.size()==0){
    		
    	}else{
    		for(int i = 0; i < list.size(); i++){
        		if(list.get(i).getSt()==1){
        			status[i]="대기중";
        		}else if(list.get(i).getSt()==2){
        			status[i]="작업 완료";
        		}else {
        			status[i]="에러 - jsp";
        		}
        	}
    	}
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업 정보 및 발주 정보</title>
</head>
<script type="text/javascript">
	function getAllWorkInfo(workCode) {
		window.name="parentForm";
		window.open("getAllWorkInfo.do?wCode="+workCode,"getAllWorkInfo","width=1250,height=500,resizable=no,scrollbars=yes");
	}
	function cfmWork(wCode){
		window.open("workESCheck.do?wCode=" + wCode,"workESCheck","width=1250,height=500,resizable=no,scrollbars=yes");	
	}
</script>
<style>
	p {
		display: inline;
	}
</style>
<body>
	<h2>작업 정보 및 발주 정보</h2>
	<!-- 현재 작업 정보 리스트 -->
	<div>
		<%if(list.size()==0){%>
			<p>등록된 작업이 없습니다.</p>
		<%}else{for(int i = 0 ; i < list.size(); i++){%>
			<p onclick="getAllWorkInfo('<%=list.get(i).getWorkCode()%>');"><%=i+1 %>. 현장명 : <%=list.get(i).getWorkField() %> | 현장 책임자 : <%=list.get(i).getFieldManager() %> | 현장 주소 : <%=list.get(i).getFieldAdd01() %> | 현장 상세 주소 : <%=list.get(i).getFieldAdd02() %> | 상태 : <%=status[i] %> </p><input type="button" value="작업 완료" onclick="cfmWork('<%=list.get(i).getWorkCode()%>')"/><br />
		<%}} %>
	</div>
	<input type="button" value="취소된 작업" onclick="location.href='cancelWorkListForIndi.do'"/>
	<input type="button" value="작업 의뢰 확인" onclick="location.href='orderInfoForIndi.do'"/>
	<input type="button" value="뒤로가기" onClick="location.href='workMainForIndi.do'"/>
</body>
</html>

