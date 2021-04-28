<%@page import="com.HEProject.he.workInfo.WorkInfoVO"%>
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
<title>작업 취소</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	var jNum = 0;
	function showWorkInfo(iNum, st, workCode) {
		document.getElementById("cancelBtn"+jNum).style.display = "none";
		document.getElementById("showWork"+jNum).style.display = "none";
		document.getElementById("showWork"+jNum).style.overflow = "hidden";
		document.getElementById("showWork"+jNum).innerHTML = "";
		if(st==0){
			document.getElementById("showWork"+iNum).innerHTML = "<iframe src=\"showWorkInfo_st0.do?workCode="+workCode+"\" id=\"iframeToWork\" name=\"iframeToWork\"></iframe>";
		}else {
			document.getElementById("showWork"+iNum).innerHTML = "<iframe src=\"showWorkInfo_st1.do?workCode="+workCode+"\" id=\"iframeToWork\" name=\"iframeToWork\"></iframe>";
		}
		document.getElementById("cancelBtn"+iNum).style.display = "inline";
		document.getElementById("showWork"+iNum).style.display = "inline";
		document.getElementById("showWork"+iNum).style.overflow = "scroll";
		jNum = iNum;
	}
	function cancelAct(workCode) {
		var confirmRs = confirm("정말 취소하시겠습니까?");
		if(confirmRs==true){
			location.href="cancelWorkAct.do?workCode="+workCode;
		}else {
			return false;
		}
	}
	function loadOn() {
		var loginCheckData = <%=loginCheckData%>;
		loginCheck(loginCheckData);
		
		var cancelTF = <%=request.getAttribute("cancelTF")%>;
		switch (cancelTF) {
		case null:
			break;
		case 0:
			alert('삭제가 정상적으로 이루어지지 않았습니다. 다시 시도해주세요.');
			location.href="cancelWork.do";
			break;
		case 1:
			alert('정상적으로 삭제되었습니다.');
			location.href="cancelWork.do";
			break;	
		default:
			alert('정상적인 요청이 아닙니다.');
			location.href="cancelWork.do";
			break;
		}
	}
</script>
<style>
	#iframeToWork {
		width: 1000px;
		height: 200px;
	}
	.workList{
		border: 1px solid black;
		background: #dcdcdc;
		width: 1500px;
		height: 200px;
	}
	.workListAll{
		border: 1px solid black;
		width: 1500px;
		height: 200px;
		overflow: scroll;
	}
	/* p{
		display: inline-block;
	} */
</style>
<body onload="loadOn();">
	<h1>작업 취소</h1>
	<h3>상세보기를 원하시면 작업을 클릭해주세요.</h3>
	<div id="workListAll" class="workListAll">
		<%if(list==null||list.size()==0){%>
			<p>취소 가능한 작업 목록이 없습니다.</p>
		<%}else{for(int i = 0 ; i < list.size(); i++){%>
			<p onclick="showWorkInfo(<%=i%>,<%=list.get(i).getSt()%>,'<%=list.get(i).getWorkCode()%>');"><%=i+1 %>. 현장명 : <%=list.get(i).getWorkField() %> | 현장 책임자 : <%=list.get(i).getFieldManager() %> | 현장 주소 : <%=list.get(i).getFieldAdd01() %> | 현장 상세 주소 : <%=list.get(i).getFieldAdd02() %> | 상태 : <%=status[i] %> <input type="button" id="cancelBtn<%=i %>" name="cancelBtn<%=i %>" value="작업 취소" style="display: none;" onclick="return cancelAct('<%=list.get(i).getWorkCode()%>');"/></p>
			<div id="showWork<%=i %>" class="showWork<%=i %>" style="display: none;"></div>
		<%}} %>
	</div>
	<input type="button" value="뒤로가기" onclick="location.href='workInfo.do'"/>
	
</body>
</html>