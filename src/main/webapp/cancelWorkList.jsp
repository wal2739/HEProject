<%@page import="java.util.List"%>
<%@page import="com.HEProject.he.workInfo.WorkInfo_ST0VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
	    String loginCheckData="";
		try{
			loginCheckData= (String)session.getAttribute("userId");
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
		List<WorkInfo_ST0VO> list = null;
		if(loginCheckData!=null){
			list = (List)request.getAttribute("list");
		}
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소 작업 목록</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	var globalNum = 0;
	function getWorkInfo(iNum, code) {
		document.getElementById("getWorkInfoDIV" + globalNum).innerHTML = "";
		document.getElementById("getWorkInfoDIV" + globalNum).style.display = "inline";
		document.getElementById("getWorkInfoDIV" + iNum).innerHTML = "<iframe src=\"getAllWorkInfo_ST3.do?workCode="+code+"\" id=\"iframeToWorker\" name=\"iframeToWorker\"></iframe>";
		document.getElementById("getWorkInfoDIV" + iNum).style.display = "inline";
		globalNum = iNum ;
	}
	
	function loadOn() {
		var loginCheckData = <%=loginCheckData%>;
		loginCheck(loginCheckData);
	}
</script>
<style>
	#iframeToWorker {
		width: 1500px;
		height: 300px;
	}
	.workList{
		border: 1px solid black;
		background: #dcdcdc;
		overflow: hidden;
		width: 1500px;
		height: 600px;
	}
	.workListAll{
		border: 1px solid black;
		width: 1500px;
		height: 600px;
		overflow: scroll;
	}
</style>
<body onload="loadOn();">
	<h1>취소 작업 목록</h1>
	<div class="workListAll" id="workListAll">
		<p id="workMsg"><b>조회 할 작업을 선택해주세요.</b></p>
		<div class="workList" id="workList">
			<%if(list==null||list.size()==0){%>
				<p>등록된 작업이 없습니다.</p>
			<%}else{for(int i = 0 ; i < list.size(); i++){%>
				<p onclick="getWorkInfo(<%=i%>,'<%=list.get(i).getWorkCode()%>')">
					<%=i+1 %>. 거래처 : <%=list.get(i).getClientCPName() %> | 거래처 전화번호 : <%=list.get(i).getClientPhone() %> | 현장명 : <%=list.get(i).getWorkField() %> | 현장 주소 : <%=list.get(i).getFieldAdd01() %> , <%=list.get(i).getFieldAdd02() %>
				</p>
				<div id="getWorkInfoDIV<%=i %>" class="getWorkInfoDIV" style="display: none;"></div>
				<hr />
			<%}} %>		
		</div>
	</div>
	<input type="button" value="뒤로가기" onclick="location.href='workInfo.do'"/>
</body>
</html>