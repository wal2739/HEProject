<%@page import="com.HEProject.he.orderInfo.OrderInfoForIndiVO"%>
<%@page import="com.HEProject.he.orderInfo.impl.OrderInfoForIndiRowMapper"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<OrderInfoForIndiVO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업 의뢰 정보</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	var globalNum = 0;
	function getOrderInfo(codeNum, iNum) {
		document.getElementById("orderInfo"+globalNum).style.display = "none";
		document.getElementById("orderInfo"+globalNum).innerHTML = "";
		document.getElementById("btnP"+globalNum).style.display = "none";
		document.getElementById("orderInfo"+iNum).style.display = "inline-block";
		document.getElementById("btnP"+iNum).style.display = "inline";
		document.getElementById("orderInfo"+iNum).innerHTML = "<iframe src=\"orderInfo.do?orderCode="+codeNum+"\" id=\"iframeToOrder\" name=\"iframeToOrder\"></iframe>";
		globalNum = iNum;
	}
	function sOrd(iNum,codeNum) {
		var confirmTF;
		if(iNum==0){
			confirmTF = confirm('거절하시겠습니까?');
			switch (confirmTF) {
			case true:
				location.href='modifyOrder.do?orderCode='+codeNum+'&appStatus='+'0';
				break;
			case false:
				alert('취소 하셨습니다.');
				return false;
				break;
			default:
				alert('정상적인 요청이 아닙니다.');
				break;
			}
		}else{
			confirmTF = confirm('수락하시겠습니까?');
			switch (confirmTF) {
			case true:
				location.href='modifyOrder.do?orderCode='+codeNum+'&appStatus='+'1';
				break;
			case false:
				alert('취소 하셨습니다.');
				return false;
				break;
			default:
				alert('정상적인 요청이 아닙니다.');
				break;
			}
		}
		
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
		
		var orderMDF=<%=request.getAttribute("orderMDF")%>;
		if(orderMDF==null){
			
		}else if(orderMDF==0){
			alert('작업을 거절 했습니다.');
			location.href='orderInfoForIndi.do';
		}else if(orderMDF==1){
			alert('작업을 수락 했습니다.');
			location.href='orderInfoForIndi.do';
		}else if(orderMDF==2){
			alert('작업 정보가 정상적으로 업데이트 되지 않았습니다. 다시 시도 해주세요.');
			location.href='orderInfoForIndi.do';
		}else {
			alert('비정상적인 요청 입니다.');
		}
	}
</script>
<style>
	.orderList{
		border: 1px solid black;
	}
	.orderInfo{
		display: none;
	}
	#iframeToOrder {
		width: 1500px;
		height: 200px;
	}
</style>
<body onload="loadOn();">
	<h1>작업 의뢰 정보</h1>
	<p>상세보기를 원하시면 클릭해주세요.</p>
	
	<div id="orderList" class="orderList">
		<%if(list.size()==0){ %>
			<p>작업 의뢰가 없습니다.</p>
		<%}else{for(int i = 0 ; i < list.size(); i++){ %>
			<p onclick="getOrderInfo('<%=list.get(i).getOrderCode()%>',<%=i%>);"><%=i+1 %>. 중계자 : <%=list.get(i).getCpName() %> | 작업 의뢰자 : <%=list.get(i).getClientCpName() %> | 필요 차량 : <%=list.get(i).getEquipType() %> | 작업 날짜 : <%=list.get(i).getWorkDate() %> | </p><p id="btnP<%=i%>" style="display: none;"><input type="button" value="수락" onclick="return sOrd(1,'<%=list.get(i).getOrderCode()%>');"/> | <input type="button" value="거절" onclick="return sOrd(0,'<%=list.get(i).getOrderCode()%>');"/></p>
			<div id="orderInfo<%=i %>" class="orderInfo<%=i %>"><!-- 작업 의뢰 정보가 들어 와야 함 --></div>
		<%}} %>
	</div>
	<input type="button" value="뒤로가기" onclick="location.href='workInfoForIndi.do?uClass=indiUsrn'"/>
</body>
</html>