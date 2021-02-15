<%@page import="com.HEProject.he.workInfo.WorkInfo_ST0VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%WorkInfo_ST0VO vo = (WorkInfo_ST0VO)request.getAttribute("vo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업 정보 st0</title>
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
	<h1>작업 정보</h1>
	<div>
		<table>
			<tr>
				<th>현장명</th>
				<td><%=vo.getWorkField() %></td>
				<th>필요 차량</th>
				<td><%=vo.getRv() %></td>
				<th>중계자</th>
				<td><%=vo.getBoName() %></td>
				<th>중계자 사업자 상 회사 명</th>
				<td><%=vo.getCpName() %></td>
			</tr>
			<tr>
				<th>거래처 명</th>
				<td><%=vo.getClientCPName() %></td>
				<th>거래처 담당자</th>
				<td><%=vo.getClientManager() %></td>
				<th>거래처 전화번호</th>
				<td><%=vo.getClientPhone() %></td>
			</tr>
			<tr>
				<th>현장 책임자</th>
				<td><%= vo.getFieldManager()%></td>
				<th>현장 책임자 전화번호</th>
				<td><%= vo.getFieldManagerPhone()%></td>
				<th>현장 책임자 핸드폰</th>
				<td><%= vo.getFieldManagerCell()%></td>
				<th>현장 책임자 메일 주소</th>
				<td><%= vo.getFieldManagerMail()%></td>
			</tr>
			<tr>
				<th>현장 주소</th>
				<td><%= vo.getFieldAdd01()%></td>
				<th>현장 상세 주소</th>
				<td><%= vo.getFieldAdd02()%></td>
			</tr>
			<tr>
				<th>작업 날짜</th>
				<td><%= vo.getWorkDate() %></td>
				<th>작업 시간</th>
				<td><%= vo.getWorkTime() %></td>
				<th>작업 수당</th>
				<td><%= vo.getWorkAmount()%></td>
				<th>요청 사항</th>
				<td><%= vo.getWorkRequests()%></td>
			</tr>
			<tr>
				<th>비고</th>
				<td><%=vo.getRelative() %></td>
			</tr>
		</table>
	</div>
</body>
</html>