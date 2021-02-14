<%@page import="com.HEProject.he.orderInfo.OrderInfo_st2VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<OrderInfo_st2VO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주 관리</title>
</head>
<script type="text/javascript">
function getAllWorkInfo(orderCode) {
	window.name="parentForm";
	window.open("getOrderInfo.do?orderCode="+orderCode,"getOrderInfo","width=1250,height=500,resizable=no,scrollbars=yes");
}
</script>
<style>
	div{
		border: 1px black solid;
	}
</style>
<body>
	<h1>발주 관리</h1>
	<h2>발주 리스트</h2>
	<h3>원하시는 발주 내역을 클릭 하시면 상세보기가 가능 합니다.</h3>
	<h4>발주 페이지에서는 수정이 불가능 합니다. 수정을 원하시면 작업 페이지에서 수정해주세요.</h4>
	<div>
		<%if(list.size()==0){ %>
		<p>현재 진행 중 인 발주 목록이 없습니다.</p>
	<%}else{for(int i = 0 ; i <list.size(); i++){ %>
		<p onclick="getAllWorkInfo('<%=list.get(i).getOrderCode()%>');"><%=i+1 %>. 거래처 : <%=list.get(i).getClientCpName() %> | 거래처 전화번호 : <%=list.get(i).getClientPhone() %> | 현장명 : <%=list.get(i).getWorkField() %> | 현장 주소 : <%=list.get(i).getFieldAdd01() %> , <%=list.get(i).getFieldAdd02() %> | 작업자 : <%=list.get(i).getUserName() %></p>
	<%}} %>
	</div>
	<input type="button" value="등록하기" onClick="location.href='newOrder.do'"/>
	<input type="button" value="발주 취소" onClick="location.href='delOrder.do'"/> ( 추후 추가 )
	<input type="button" value="돌아가기" onClick="location.href='workMain.do'"/>
</body>
</html>