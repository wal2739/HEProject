<%@page import="com.HEProject.he.orderInfo.OrderInfo_st2VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%OrderInfo_st2VO vo = (OrderInfo_st2VO)request.getAttribute("vo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주 상세 정보</title>
</head>
<style>
	th {
		border: 1px solid black;
		background-color: #dcdcdc;
	}
	td {
		border: 1px solid black;
		background-color: white;
	}
	table {
		border: 1px solid black;
		background-color: #f0f8ff;
	}
</style>
<body>
	<h1>발주 상세 정보</h1>
	<div>
		<div>
			<h3>작업 정보</h3>
			<table>
				<tr>
					<th>현장명</th>
					<td><%=vo.getWorkField() %></td>
				</tr>
				<tr>
					<th>거래처 명</th>
					<td><%=vo.getClientCpName() %></td>
					<th>거래처 담당자</th>
					<td><%=vo.getClientManager() %></td>
					<th>거래처 전화번호</th>
					<td><%=vo.getClientPhone() %></td>
				</tr>
				<tr>
					<th>현장 책임자</th>
					<td><%=vo.getFieldManager() %></td>
					<th>현장 책임자 전화번호</th>
					<td><%=vo.getFieldManagerPhone() %></td>
					<th>현장 책임자 핸드폰</th>
					<td><%=vo.getFieldManagerCell() %></td>
					<th>현장 책임자 메일 주소</th>
					<td><%=vo.getFieldManagerMail() %></td>
				</tr>
				<tr>
					<th>현장 주소</th>
					<td><%=vo.getFieldAdd01() %></td>
					<th>현장 상세 주소</th>
					<td><%=vo.getFieldAdd02() %></td>
				</tr>
				<tr>
					<th>작업 날짜</th>
					<td><%=vo.getWorkDate() %></td>
					<th>작업 시간</th>
					<td><%=vo.getWorkTime() %></td>
					<th>작업 수당</th>
					<td><%=vo.getWorkAmount() %></td>
					<th>요청 사항</th>
					<td><%=vo.getWorkRequests() %></td>
				</tr>
				<tr>
					<th>비고</th>
					<td><%=vo.getRelative() %></td>
				</tr>
			</table>
		</div>
		<div>
			<h3>작업자 정보</h3>
			<table>
				<tr>
					<th>작업자 이름</th>
					<td><%=vo.getUserName() %></td>
					<th>작업자 아이디</th>
					<td><%=vo.getUserId() %></td>
					<th>작업자 연락처</th>
					<td><%=vo.getUserCell() %></td>
				</tr>
				<tr>
					<th>장비 종류 </th>
					<td><%=vo.getEquipType() %></td>
					<th>장비 분류</th>
					<td><%=vo.getEquipClass() %></td>
					<th>장비 옵션</th>
					<td><%=vo.getEquipOption() %></td>
				</tr>
			</table>
		</div>
	</div>
	<input type="button" id="BtnAct" name="BtnAct" onclick="window.close();" value="닫기"/>
</body>
</html>