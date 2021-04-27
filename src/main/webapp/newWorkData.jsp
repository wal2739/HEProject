<%@page import="com.HEProject.he.workInfo.WorkInfo_ST0VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<WorkInfo_ST0VO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>증빙자료 등록</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function sltWork(workCode) {
		document.getElementById("workList").innerHTML = "<form action=\"WorkDataUpload.do\" method=\"post\" enctype=\"multipart/form-data\"><input type=\"file\" name=\"uploadFile\" accept=\"image/jpef,image/png,image/jpg\"/><input type=\"hidden\" id=\"workCode\" name=\"workCode\"/><input type=\"submit\" value=\"등록\"/></form>";
		document.getElementById("workCode").value = workCode;
		console.log(document.getElementById("workCode").value);
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
		
		var uploadChk = <%=request.getAttribute("uploadChk")%>;
		switch (uploadChk) {
		case null:
			break;
		case 0:
			alert('증빙자료가 정상적으로 등록되지 않았습니다. 다시 시도해주세요.');
			break;
		case 1:
			alert('증빙자료가 정상적으로 등록었습니다. ');
			opener.parent.location=='workData.do';
			window.close();
			break;
		default:
			break;
		}
	}
</script>
<body onload="loadOn();">
	<h1>증빙 자료 등록</h1>
	<p>증빙 자료를 등록할 작업을 선택해주세요.</p>
	<div class="workList" id="workList">
			<%if(list.size()==0){%>
				<p>등록된 작업이 없습니다.</p>
			<%}else{for(int i = 0 ; i < list.size(); i++){%>
				<p onclick="sltWork('<%=list.get(i).getWorkCode()%>')">
					<%=i+1 %>. 거래처 : <%=list.get(i).getClientCPName() %> | 거래처 전화번호 : <%=list.get(i).getClientPhone() %> | 현장명 : <%=list.get(i).getWorkField() %> | 현장 주소 : <%=list.get(i).getFieldAdd01() %> , <%=list.get(i).getFieldAdd02() %>
					</p>
				<hr />
			<%}} %>		
			
	</div>
	<input type="button" value="취소" onclick="window.close();"/>
</body>
</html>