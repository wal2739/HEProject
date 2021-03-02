<%@page import="com.HEProject.he.workInfo.WorkInfo_ST0VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%WorkInfo_ST0VO vo = (WorkInfo_ST0VO)request.getAttribute("vo"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업 상세 정보</title>
</head>
<script type="text/javascript">
	function esCheck(checkVar) {
		if(checkVar==1){
			document.getElementById('et').removeAttribute('readonly');
			document.getElementById('aa').removeAttribute('readonly');
			document.getElementById('et').value='';
			document.getElementById('aa').value='';
		}else {
			document.getElementById('et').setAttribute('readonly', 'readonly');
			document.getElementById('aa').setAttribute('readonly', 'readonly');
			document.getElementById('et').value='0';
			document.getElementById('aa').value='0';
		}

	}
	function finishWork(workCode) {
		var checkTorF = document.getElementById('esTrue').checked;
		var es = 0;
		if(checkTorF==true){
			if(document.getElementById('et').value==''){
				alert('연장 시간을 입력해주세요.');
				document.getElementById('et').focus();
				return false;
			}else if(document.getElementById('aa').value==''){
				alert('추가 수당을 입력해주세요.');
				document.getElementById('aa').focus();
				return false;
			}
			es = 1;
		}else {
			es = 0;
		}
		var et = document.getElementById('et').value;
		var aa = document.getElementById('aa').value;
		var cfmCheck = confirm('작업을 완료 하시겠습니까?');
		if(cfmCheck==true){
			location.href='workESAct.do?workCode=' + workCode + '&es=' + es + '&et=' + et + '&aa=' + aa;
		}else{
			return false;
		}
	}
	function loadOn() {
		var newAworkRst = <%=request.getAttribute("newAworkRst")%>;
		switch (newAworkRst) {
		case null:
			break;
		case 0:
			alert('작업 완료 등록이 정상적으로 실행되지 않았습니다. 다시 시도해주세요.');
			opener.parent.location='workInfoForIndi.do?uClass=indiUsrn';
			window.close();
			break;
		case 1:
			var cfmData = confirm('작업 완료가 정상적으로 등록 되었습니다. 증빙 자료 페이지로 바로 이동 하시겠습니까 ?');
			switch (cfmData) {
			case true:
				opener.parent.location='workData.do';
				window.close();
				break;
			case false:
				alert('완료 작업 페이지로 이동합니다.');
				opener.parent.location='finishedWorkList.do';
				window.close();
				break;
			}
			break;
		default:
			break;
		}
	}
</script>
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
<body onload="loadOn();">
	<h1>작업 상세 정보</h1>
	<div>
		<table>
			<tr>
				<th>현장명</th>
				<td><%=vo.getWorkField() %></td>
				<th>필요 차량</th>
				<td><%=vo.getRv() %></td>
				<th>중계자</th>
				<td><%=vo.getBoName() %></td>
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
		<table>
			<tr>
				<th>작업 연장 유무</th>
				<td>
					<input type="radio" id="esTrue" name="es" checked="checked" onchange="esCheck(1);"/><label for="esTrue">연장 있음</label>
					<input type="radio" id="esFalse" name="es" onchange="esCheck(0);"/><label for="esFalse">연장 없음</label>
				</td>
			</tr>
			<tr>
				<th>연장 시간</th>
				<td><input type="number" id="et" name="et"/>시간</td>
			</tr>
			<tr>
				<th>추가 수당</th>
				<td><input type="number" id="aa" name="aa"/>원</td>
			</tr>
		</table>
		<input type="button" value="취소" onclick="window.close();"/>
		<input type="button" value="완료" onclick="return finishWork('<%=vo.getWorkCode()%>');"/>
	</div>
</body>
</html>