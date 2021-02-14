<%@page import="com.HEProject.he.orderInfo.OrderInfoForIndiVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%OrderInfoForIndiVO vo = (OrderInfoForIndiVO)request.getAttribute("vo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주 정보</title>
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
	<h1>발주 상세 보기</h1>
	<table>
		<tr>
			<th>작업 내용</th>
		</tr>
		<tr>
			<th>현장명</th>
			<td><%= vo.getWorkField()%></td>
			<th>작업 날짜</th>
			<td><%= vo.getWorkDate()%></td>
			<th>작업 예상 시간</th>
			<td><%= vo.getWorkTime()%></td>
			<th>작업 수당</th>
			<td><%= vo.getWorkAmount()%> 원</td>
			<th>작업장 주소</th>
			<td><%=vo.getFieldAdd01() %></td>
			<th>작업장 상세 주소</th>
			<td><%= vo.getFieldAdd02()%></td>
			<th>작업 요청 사항</th>
			<td><%= vo.getWorkRequests()%></td>
		</tr>
		<tr>
			<th>필요 차량 번호</th>
			<td><%= vo.getEquipNum()%></td>
			<th>필요 차량 종류</th>
			<td><%= vo.getEquipType()%></td>
			<th>필요 차량 분류</th>
			<td><%= vo.getEquipClass()%></td>
			<th>필요 차량 옵션</th>
			<td><%= vo.getEquipOption()%></td>
		</tr>
		<tr>
			<th>작업 담당자</th>
			<td><%= vo.getFieldManager()%></td>
			<th>담당자 핸드폰</th>
			<td><%= vo.getFieldManagerCell()%></td>
			<th>담당자 전화번호</th>
			<td><%= vo.getFieldManagerPhone()%></td>
			<th>담당자 메일</th>
			<td><%= vo.getFieldManagerMail()%></td>
		</tr>
		
		<tr>
			<th>중계사 및 의뢰사 정보</th>
		</tr>
		<tr>
			<th>중계사 회사명</th>
			<td><%=vo.getCpName() %></td>
			<th>중계사 전화번호</th>
			<td><%=vo.getBoPhone() %></td>
			<th>중계사 핸드폰번호</th>
			<td><%=vo.getUserCell() %></td>
		</tr>
		<tr>
			<th>의뢰 회사명</th>
			<td><%=vo.getClientCpName() %></td>
			<th>의뢰 담당자</th>
			<td><%=vo.getClientManager() %></td>
			<th>의뢰사 전화번호</th>
			<td><%=vo.getClientPhone() %></td>
		</tr>
	</table>
</body>
</html>