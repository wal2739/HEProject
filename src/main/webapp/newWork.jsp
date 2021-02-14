<%@page import="com.HEProject.he.clientInfo.ClientInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<ClientInfoVO> list = (List)request.getAttribute("cInfo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업 등록</title>
</head>
<script type="text/javascript">
	function test(code) {
		var cliCode = document.getElementById("cliCode"+code).value;	
		var cpName = document.getElementById("cpName"+code).value;		
		var cliMng = document.getElementById("cliMng"+code).value;
		var cliPh = document.getElementById("cliPh"+code).value;
		var rr = document.getElementById("rr"+code).value;
	
		document.getElementById("clientCpName").value = cpName;
		document.getElementById("clientManager").value = cliMng;
		document.getElementById("clientPhone").value = cliPh;
		document.getElementById("relative").value = rr;
		document.getElementById("clientCode").value = cliCode;
	}
	function validate() {
		var re = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일이 적합한지 검사할 정규식
		var chkNum = /^[0-9]+$/;//숫자
		
		var clientCode = document.getElementById("clientCode").value;
		var workField = document.getElementById("workField").value;
		var fieldManager = document.getElementById("fieldManager").value;
		var fieldManagerMail = document.getElementById("fieldManagerMail").value;
		var fieldAdd01 = document.getElementById("fieldAdd01").value;
		var fieldAdd02 = document.getElementById("fieldAdd02").value;
		var workAmount = document.getElementById("workAmount").value;
		var dateWork = document.getElementById("dateWork").value;
		var workRequests = document.getElementById("workRequests").value;
		var relative = document.getElementById("relative").value;
		var rv = document.getElementById("rv").value;
		var rvDirect = document.getElementById("rvDirect").value;
		var workTime01 = document.getElementById("workTime01").value;
		var workTime02 = document.getElementById("workTime02").value;
		var fieldManagerPhone01 = document.getElementById("fieldManagerPhone01").value;
		var fieldManagerPhone02 = document.getElementById("fieldManagerPhone02").value;
		var fieldManagerPhone03 = document.getElementById("fieldManagerPhone03").value;
		var fieldManagerCell01 = document.getElementById("fieldManagerCell01").value;
		var fieldManagerCell02 = document.getElementById("fieldManagerCell02").value;
		var fieldManagerCell03 = document.getElementById("fieldManagerCell03").value;
		
		var workTime = workTime01 + ":" + workTime02;
		var fieldManagerPhone = fieldManagerPhone01 + "-" + fieldManagerPhone02 + "-" + fieldManagerPhone03;
		var fieldManagerCell = fieldManagerCell01 + "-" + fieldManagerCell02 + "-" + fieldManagerCell03;
		
		if(document.getElementById("clientCpName").value==''||document.getElementById("clientManager").value==''||document.getElementById("clientPhone").value==''||document.getElementById("relative").value==''){
			alert('거래처를 선택 하세요.');
			return false;
		}
		if(workField==''){
			alert('현장명을 입력 하세요.');
			document.getElementById("workField").focus();
			return false;
		}
		if(rv==''||rv=='noData'){
			alert('필요 차량을 선택해주세요.');
			document.getElementById("rv").focus();
			return false;
		}else if(rv=='직접입력'){
			if(rvDirect==''){
				alert('필요 차량을 입력 해주세요.');
				document.getElementById("rvDirect").focus();
				return false;
			}
		}
		if(fieldManager==''){
			document.getElementById("fieldManager").focus();
			alert('현장책임자 이름을 입력 하세요.');
			return false;
		}
		if(fieldManagerPhone01==''||fieldManagerPhone02==''||fieldManagerPhone03==''){
			document.getElementById("fieldManagerPhone01").focus();
			alert('현장 책임자 전화번호를 입력 하세요.');
			return false;
		}
		if(fieldManagerCell01==''||fieldManagerCell02==''||fieldManagerCell03==''){
			document.getElementById("fieldManagerCell01").focus();
			alert('현장 책임자 핸드폰 번호를 입력 하세요.');
			return false;
		}
		if(fieldManagerMail!=''){
			if(!re.test(fieldManagerMail)) {
		    	alert("적합하지 않은 이메일 형식입니다.");
		    	document.getElementById("fieldManagerMail").focus();
		        return false;
		    }
		}
		if(fieldAdd01==''){
			document.getElementById("fieldAdd01").focus();
			alert('현장 주소를 입력 하세요.');
			return false;
		}
		if(workAmount==''){
			document.getElementById("workAmount").focus();
			alert('작업 금액을 입력 하세요.');
			return false;
		}
		if(document.getElementById("dateWork").value==''){
			document.getElementById("dateWork").focus();
			alert('작업 날짜를 입력 하세요.');
			return false;
		}
		if(workTime01==''||workTime02==''){
			document.getElementById("workTime01").focus();
			alert('작업 시간을 입력 하세요.');
			return false;
		}
		
	    if(!chkNum.test(fieldManagerPhone01)||!chkNum.test(fieldManagerPhone02)||!chkNum.test(fieldManagerPhone03)){
			alert('전화번호는 숫자만 입력해주세요.');
			document.getElementById("fieldManagerPhone01").value=='';
			document.getElementById("fieldManagerPhone02").value=='';
			document.getElementById("fieldManagerPhone03").value='';
			document.getElementById("fieldManagerPhone01").focus();
			return false;
		}
	    if(!chkNum.test(fieldManagerCell01)||!chkNum.test(fieldManagerCell02)||!chkNum.test(fieldManagerCell03)){
			alert('핸드폰번호는 숫자만 입력해주세요.');
			document.getElementById("fieldManagerCell01").value=='';
			document.getElementById("fieldManagerCell02").value=='';
			document.getElementById("fieldManagerCell03").value='';
			document.getElementById("fieldManagerCell01").focus();
			return false;
		}
	    if(!chkNum.test(workTime01)||!chkNum.test(workTime02)){
			alert('작업 시간은 숫자만 입력해주세요.');
			document.getElementById("workTime01").value=='';
			document.getElementById("workTime02").value=='';
			document.getElementById("workTime01").focus();
			return false;
		}
	    
 	    document.getElementById("workTime").value = workTime;
	    document.getElementById("fieldManagerPhone").value = fieldManagerPhone;
		document.getElementById("fieldManagerCell").value = fieldManagerCell;

	}
	function altClick() {
		if(document.getElementById("clientCpName").value==''||document.getElementById("clientManager").value==''||document.getElementById("clientPhone").value==''||document.getElementById("relative").value==''){
			alert('거래처를 선택 하세요.');
		}
	}
	
	function direct() {
		var langSelect = document.getElementById("rv"); 
		var selectValue = langSelect.options[langSelect.selectedIndex].value;
		if(selectValue=="직접입력"){
			document.getElementById("rvDirect").style.display = "inline";
		}else{
			document.getElementById("rvDirect").style.display = "none";
		}
	}
	
</script>
<style>
	table, th, tr, td{
		border: 1px black solid;
		text-align: center;
	}
	/* .clientList {
		border: 1px solid black;
		max-width: 500px;
		overflow:scroll;
		height:200px;
		float : left;
		margin: 20px;
	}
	.clientInput {
		border: 1px solid black;
		float : left;
		margin: 20px;
		width: auto;
	} */
	#rvDirect {
		display: none;
	}
</style>
<body>
	<h1>작업 등록</h1>
	<div class="clientList">
		<table>
			<%if(list.size()==0){ %>
				<p>거래처 정보가 없습니다.</p>
			<%}else{%>
			<caption></caption>
			<thead>
				<tr>
					<th></th>
					<th>번호</th>
					<th>거래처 명</th>
					<th>거래처 담당자</th>
					<th>거래처 전화번호</th>
					<th>비고</th>	
				</tr>
			</thead>
			<tbody>
			<%
				for(int i = 0 ; i < list.size(); i++){%>
				<tr>
					<td><input type="button" value="삽입" name="sctCli" id="sctCli" onclick="test('<%=i%>');"/></td>
					<td><input type="hidden" value="<%= list.get(i).getClientCode()%>" id="cliCode<%=i %>" name="cliCode<%=i %>"/><%=i+1 %></td>
					<td><input type="hidden" value="<%= list.get(i).getClientCpName()%>" id="cpName<%=i %>" name="cpName<%=i %>"/><%= list.get(i).getClientCpName()%></td>
					<td><input type="hidden" value="<%= list.get(i).getClientManager() %>" id="cliMng<%=i %>" name="cliMng<%=i %>"/><%= list.get(i).getClientManager() %></td>
					<td><input type="hidden" value="<%= list.get(i).getClientPhone()%>" id="cliPh<%=i %>" name="cliPh<%=i %>"/><%= list.get(i).getClientPhone()%></td>
					<td><input type="hidden" value="<%= list.get(i).getRelative()%>" id="rr<%=i %>" name="rr<%=i %>"/><%= list.get(i).getRelative()%></td>				
				</tr>
				<%}%>
			</tbody>
			<%} %>
		</table>
	</div>
	<div class="clientInput">
		<form action="newWorkACT.do" id="form" name="form">
			<input type="hidden" name="clientCode" id="clientCode"/>
			<label for="clientCpName">거래처&nbsp;명</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly" name="clientCpName" id="clientCpName" onclick="altClick();"/><br />
			<label for="clientManager">거래처&nbsp;담당자</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly" name="clientManager" id="clientManager" onclick="altClick();"/><br />
			<label for="clientPhone">거래처&nbsp;전화번호</label>&nbsp;<input type="text" readonly="readonly" name="clientPhone" id="clientPhone" onclick="altClick();"/><br />
			<label for="relative">&nbsp;&nbsp;&nbsp;비&nbsp;&nbsp;&nbsp;&nbsp;고&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly" name="relative" id="relative" onclick="altClick();"/><br />
			<hr />
			<table>
				<tr>
					<td>현장명</td>
					<td><input type="text" name="workField" id="workField" maxlength="20"/></td>
				</tr>
				<tr>
					<td>필요 차량</td>
					<td>
						<select name="rv" id="rv" onchange="direct();" >
							<option value="noData">선택 해주세요.</option>
							<option value="지게차">지게차</option>
							<option value="사다리">사다리</option>
							<option value="스카이">스카이</option>
							<option value="크레인">크레인</option>
							<option value="카고">카고</option>
							<option value="굴삭기">굴삭기</option>
							<option value="화물차">화물차</option>
							<option value="직접입력">직접입력</option>
						</select>
						<input type="text" name="rvDirect" id="rvDirect" maxlength="7"/>
					</td>
				</tr>
				<tr>
					<td>현장 책임자</td>
					<td><input type="text" name="fieldManager" id="fieldManager" maxlength="7"/></td>
				</tr>
				<tr>
					<td>현장 책임자 전화번호</td>
					<td>
						<input type="hidden" id="fieldManagerPhone" name="fieldManagerPhone"/><input type="text" name="fieldManagerPhone01" id="fieldManagerPhone01" maxlength="4"/>-<input type="text" name="fieldManagerPhone02" id="fieldManagerPhone02" maxlength="4"/>-<input type="text" name="fieldManagerPhone03" id="fieldManagerPhone03" maxlength="4"/><br />
					</td>
				</tr>
				<tr>
					<td>현장 책임자 핸드폰 번호</td>
					<td>
						<input type="hidden" id="fieldManagerCell" name="fieldManagerCell"/><input type="text" name="fieldManagerCell01" id="fieldManagerCell01" maxlength="3"/>-<input type="text" name="fieldManagerCell02" id="fieldManagerCell02" maxlength="4"/>-<input type="text" name="fieldManagerCell03" id="fieldManagerCell03" maxlength="4"/><br />		
					</td>
				</tr>
				<tr>
					<td>현장 책임자 이메일[선택]</td>
					<td><input type="text" name="fieldManagerMail" id="fieldManagerMail"/><br /></td>
				</tr>
				<tr>
					<td>현장 주소</td>
					<td><input type="text" name="fieldAdd01" id="fieldAdd01" maxlength="33"/><br /></td>
				</tr>
				<tr>
					<td>현장 상세 주소</td>
					<td><input type="text" name="fieldAdd02" id="fieldAdd02" maxlength="19"/><br /></td>
				</tr>
				<tr>
					<td>작업 금액</td>
					<td><input type="text" name="workAmount" id="workAmount" maxlength="10"/><br /></td>
				</tr>
				<tr>
					<td>작업 날짜</td>
					<td><input type="date" name="dateWork" id="dateWork" placeholder="클릭하면 달력이 생성됩니다."/><br /></td>
				</tr>
				<tr>
					<td>작업 시간</td>
					<td><input type="hidden" id="workTime" name="workTime"/><input type="text" name="workTime01" id="workTime01" maxlength="2"/>:<input type="text" name="workTime02" id="workTime02" maxlength="2"/><br /></td>
				</tr>
				<tr>
					<td>작업 요청 사항</td>
					<td><input type="text" name="workRequests" id="workRequests" maxlength="40"/><br /></td>
				</tr>
				<tr>
					<td>비고</td>
					<td><input type="text" name="relative" id="relative" maxlength="40"/><br /></td>
				</tr>

			</table>
			<input type="submit" value="저장" onclick="return validate();"/>
			<input type="button" value="돌아가기" onClick="location.href='workInfo.do'"/>
		</form>
	</div>
	
</body>
</html>