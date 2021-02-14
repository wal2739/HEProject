<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 등록</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function loadOn() {
		var newVehicleCheck = <%=request.getAttribute("newVehicleCheck")%>;
		if(newVehicleCheck==null){}
		if(newVehicleCheck==2){
			alert('이미 등록된 차량 번호입니다. 다시 등록해주세요.')
		}
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
	}
</script>
</head>
<body onload="loadOn();">
	<h1>차량 등록 화면</h1>
	<form action="newVehicle.do" name="forms" id="forms" onsubmit="checkAll();">
	<hr />
		<table>
	 		<tr>
	 			<td>차량번호</td>
	 			<td>
	 				<input type="text" name="EquipNum" id="EquipNum" maxlength="8"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>차량 종류</td>
	 			<td>
	 				<input type="text" readonly="readonly" name="EquipType" id="EquipType" required="required"/>
	 				<input type="button" value="차종검색" onclick="EquipType01();"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>상세 분류</td>
	 			<td>
	 				<input type="text" readonly="readonly" name="EquipClass" id="EquipClass" required="required"/>
	 				<input type="button" id="EquipClassBtn" value="분류검색" onclick="EquipClass01();" />
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>차량 옵션</td>
	 			<td>
	 				<input type="text" readonly="readonly" name="EquipOption" id="EquipOption"/>
	 				<input type="button" id="EquipOptionBtn" value="옵션검색" onclick="EquipOption01();"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>차량 등록일</td>
	 			<td>
	 				<input type="date" name="EquipRD01" id="EquipRD01" placeholder="클릭하면 달력이 생성됩니다."/>
	 				<!-- <script>
				        $(function () {
				            $("#EquipRD01").datepicker();
				        });
				    </script> -->
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>차량 검사일</td>
	 			<td>
		 			<input type="date" id="EquipID01" name="EquipID01" placeholder="클릭하면 달력이 생성됩니다." />
		 			<!-- <script>
				        $(function () {
				            $("#EquipID01").datepicker();
				        });
				    </script>	 -->
			    </td>
			    
	 		</tr>	 		
	 	</table>
	 	<input type="submit" value="저장"/>
	 	<hr />
	 	
	</form>
	<input type="button" value="초기화" onClick="allClear()"/>
	<input type="button" value="뒤로가기" onClick="location.href='showVehicleInfo.do'"/>
	<hr />

</body>
</html>