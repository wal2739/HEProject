<%@page import="com.HEProject.he.workInfo.WorkInfoVO"%>
<%@page import="com.HEProject.he.workInfo.WorkInfo_ST0VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%
    	
		String loginCheckData="";
		try{
			loginCheckData= (String)session.getAttribute("userId");
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
		List<WorkInfoVO> list = null;
		String[] status = null;
		if(loginCheckData!=null){
			list = (List)request.getAttribute("list");
			status = new String[list.size()];
			if(list.size()==0){
	    		
	    	}else{
	    		for(int i = 0; i < list.size(); i++){
	        		if(list.get(i).getSt()==0){
	        			status[i]="미발주";
	        		}else{
	        			status[i]="작업 수락";
	        		}
	        	}
	    	}
			
		}

    	
    	
    %>
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
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function getAllWorkInfo(workCode) {
		window.name="parentForm";
		window.open("getAllWorkInfo.do?wCode="+workCode,"getAllWorkInfo","width=1250,height=500,resizable=no,scrollbars=yes");
	}
	function scsCode() {
		var loginCheckData = <%=loginCheckData%>;
		loginCheck(loginCheckData);
		
		var scsCode = <%=request.getAttribute("newWorkSuccess")%>;
		if(scsCode==null){
		}else if(scsCode==0){
			alert('작업 등록이 정상적으로 처리되지 않았습니다. 다시 시도 해주세요.');
			location.href='workInfo.do';
		}else if(scsCode==1){
			alert('작업이 성공적으로 등록 되었습니다.');
			location.href='workInfo.do';
		}else{
			alert('정상적인 요청이 아닙니다.');
			location.href='workInfo.do';
		}
	}
	function scsMCode() {
		var scsCode = <%=request.getAttribute("modWorkSuccess")%>;
		if(scsCode==null){
		}else if(scsCode==0){
			alert('작업 수정이 정상적으로 처리되지 않았습니다. 다시 시도 해주세요.');
			location.href='workInfo.do';
		}else if(scsCode==1){
			alert('작업이 성공적으로 수정 되었습니다.');
			location.href='workInfo.do';
		}else{
			alert('정상적인 요청이 아닙니다.');
			location.href='workInfo.do';
		}
	}
</script>
<body onload="scsCode();scsMCode();">
	<h1>등록된 작업 목록</h1>
	<h2>상세 보기를 원하시면 작업을 클릭 해주세요.</h2>
	<div>
		<%if(list==null||list.size()==0){%>
			<p>등록된 작업이 없습니다.</p>
		<%}else{for(int i = 0 ; i < list.size(); i++){%>
			<input type="button" value="수정하기" onClick="location.href='modifyWork.do?wCode=<%=list.get(i).getWorkCode()%>'"/><p onclick="getAllWorkInfo('<%=list.get(i).getWorkCode()%>');"><%=i+1 %>. 현장명 : <%=list.get(i).getWorkField() %> | 현장 책임자 : <%=list.get(i).getFieldManager() %> | 현장 주소 : <%=list.get(i).getFieldAdd01() %> | 현장 상세 주소 : <%=list.get(i).getFieldAdd02() %> | 상태 : <%=status[i] %></p>
		<%}} %>
	</div>
	<input type="button" value="삭제 작업 조회" onclick="location.href='cancelWorkList.do'"/>
	<input type="button" value="등록하기" onClick="location.href='newWork.do'"/>
	<input type="button" value="삭제하기" onClick="location.href='cancelWork.do'"/>
	<input type="button" value="돌아가기" onClick="location.href='workMain.do'"/>
</body>
</html>