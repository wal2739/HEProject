<%@page import="com.HEProject.he.workInfo.WorkInfo_ST0VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<WorkInfo_ST0VO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>증빙 자료 등록</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">

	function newWorkData() {
		window.name="parentForm";
		window.open("newWorkData.do","newWorkData","width=1250,height=500,resizable=no,scrollbars=yes");
	}
	
	function showWorkData(workCode) {
		window.name="parentForm";
		window.open("workDataIMG.do?workCode="+workCode,"workDataIMG","width=1250,height=500,resizable=no,scrollbars=yes");
	}
	
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
</script>
<body onload="loadOn();">
	<h1>증빙 자료 등록 완료 목록</h1>
	<div class="workList" id="workList">
			<%if(list.size()==0){%>
				<p>등록된 자료가 없습니다.</p>
			<%}else{for(int i = 0 ; i < list.size(); i++){%>
				<a onclick="showWorkData('<%=list.get(i).getWorkCode()%>')">
					<%=i+1 %>. 거래처 : <%=list.get(i).getClientCPName() %> | 거래처 전화번호 : <%=list.get(i).getClientPhone() %> | 현장명 : <%=list.get(i).getWorkField() %> | 현장 주소 : <%=list.get(i).getFieldAdd01() %> , <%=list.get(i).getFieldAdd02() %>
				</a>
				<hr />
			<%}} %>		
			
	</div>
	<input type="button" value="뒤로가기" onclick="location.href='workMainForIndi.do'"/>
	<input type="button" value="증빙 자료 등록하기" onclick="newWorkData();"/>
</body>
</html>