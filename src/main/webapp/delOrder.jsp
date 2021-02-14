<%@page import="com.HEProject.he.orderInfo.OrderInfo_st2VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<OrderInfo_st2VO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주 취소</title>
</head>
<script type="text/javascript">
	var preNum = 0;
	function getAllWorkInfo(orderCode,iNum) {
		window.name="parentForm";
		document.getElementById("workInfoList"+preNum).style.display = "none";
		document.getElementById('delBtn'+preNum).disabled = true;
		document.getElementById("workInfoList"+iNum).innerHTML = "<iframe src=\"getOrderInfo.do?orderCode="+orderCode+"\" id=\"workAllInfo\" name=\"workAllInfo\"></iframe><br />";
		document.getElementById("workInfoList"+iNum).style.display = "inline";
		document.getElementById('delBtn'+iNum).disabled = false;
		preNum = iNum;
/* 		$("#workAllInfo").contents().find("#BtnAct");
 */	}
	function delFunc(codeNum) {
		var checkConfirm = confirm('발주를 취소 하시겠습니까?');
		if(checkConfirm==true){
			location.href='delAct.do?orderCode='+codeNum;
		}else {
			alert('취소하셨습니다.');
			return false;
		}
	}
	function loadOn() {
		var delOrderSuccess = <%=request.getAttribute("delOrderSuccess")%>;
		if(delOrderSuccess==null){
			
		}else if(delOrderSuccess==0){
			alert('정상적으로 삭제되지 않았습니다. 다시 시도해주세요.');
		}else if(delOrderSuccess==1){
			alert('정상적으로 삭제되었습니다.');
		}else{
			alert('정상적인 요청이 아닙니다.');
		}
	}
</script>
<style>
	#workAllInfo{
		width: 1500px;
		height: 200px;
	}
	.allDiv{
		border: 1px black solid;
	}
	p{
		display: inline-block;
	}
</style>
<body onload="loadOn();">
	<h1>발주 취소</h1>
	<div id="allDiv" class="allDiv">
		<%if(list.size()==0){ %>
		<p>현재 진행 중 인 발주 목록이 없습니다.</p>
	<%}else{for(int i = 0 ; i <list.size(); i++){ %>
		<p onclick="getAllWorkInfo('<%=list.get(i).getOrderCode()%>',<%=i%>);"><%=i+1 %>. 거래처 : <%=list.get(i).getClientCpName() %> | 거래처 전화번호 : <%=list.get(i).getClientPhone() %> | 현장명 : <%=list.get(i).getWorkField() %> | 현장 주소 : <%=list.get(i).getFieldAdd01() %> , <%=list.get(i).getFieldAdd02() %> | 작업자 : <%=list.get(i).getUserName() %></p><input type="button" id="delBtn<%=i %>" name="delBtn<%=i %>" disabled="disabled" onclick="delFunc('<%=list.get(i).getOrderCode() %>');" value="삭제"/><br />
		<div id="workInfoList<%=i%>" class="workInfoList<%=i%>" style="display: none;"></div>
	<%}} %>
	</div>
	<input type="button" value="뒤로가기" onClick="location.href='workOrderInfo.do'"/>
	
</body>
</html>