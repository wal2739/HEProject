<%@page import="java.sql.Date"%>
<%@page import="java.util.Random"%>
<%@page import="com.HEProject.he.vehicleInfo.VehicleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%VehicleVO vo = (VehicleVO)request.getAttribute("vehicleInfo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 정보 수정</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script>
	window.onload=function(){
		if(!(document.getElementById("EquipType").value=='사다리'||document.getElementById("EquipType").value=='스카이')){
			document.getElementById("EquipOptionBtn").setAttribute('type','hidden');
			if(!(document.getElementById("EquipType").value=='지게차'||'크레인'||'카고'||'굴삭기'||'화물차')){
				document.getElementById("EquipClassBtn").setAttribute('type','hidden');
			}
		}
		var checkNum = <%=request.getAttribute("modVehicleCheck")%>;
		if(checkNum==2){
			alert('이미 있는 차량 번호 입니다. 다시 입력해주세요.');
		}
		
	}
	function exceptionNON() {
		var a = null;
		var b = ''+ a +'';
		<%
			String EquipNum = "";
			String EquipType = "";
			String EquipOption = "";
			String EquipClass = "";
			Date EquipRD = null;
			Date EquipID = null;
			String loginCheckData = "";
			try{
				loginCheckData = (String)session.getAttribute("userId");
				try{
					EquipNum = vo.getEquipNum();
					EquipType = vo.getEquipType();
					EquipOption = vo.getEquipOption();
					EquipClass = vo.getEquipClass();
					EquipRD = vo.getEquipRD();
					EquipID = vo.getEquipID();
				}catch(NullPointerException e){
					EquipNum = "";
					EquipType = "";
					EquipOption = "";
					EquipClass = "";
					EquipRD = Date.valueOf("2000-01-01");
					EquipID = Date.valueOf("2000-01-01");
					System.err.println("차량 수정 페이지에서 에러 : "+e);
				}
			}catch(NullPointerException e){
				System.err.println("비회원 아이디 에러 : "+e);
			}
		%>
		var checkData01 = '<%=EquipNum%>';
		var checkData02 = '<%=EquipType%>';
		var checkData03 = '<%=EquipOption%>';
		var checkData04 = '<%=EquipClass%>';
		var loginCheckData = <%=loginCheckData%>;
		checkDataAll(checkData01,checkData02,checkData03,checkData04,loginCheckData);
		
	}
</script>
<body onload="exceptionNON();">
	<h1>차량 정보 수정</h1>
	<form action="modifyVehicleAC.do" name="forms" id="forms" onsubmit="checkAll();">
	<hr />
		<table>
	 		<tr>
	 			<td>차량번호</td>
	 			<td>
	 				<input type="text" name="EquipNum" id="EquipNum" value="<%=EquipNum%>"maxlength="8"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>차량 종류</td>
	 			<td>
	 				<input type="text" readonly="readonly" name="EquipType" id="EquipType" value="<%=EquipType %>" required="required"/>
	 				<input type="button" value="차종검색" onclick="EquipType01();"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>상세 분류</td>
	 			<td>
	 				<input type="text" readonly="readonly" name="EquipClass" id="EquipClass" value="<%=EquipClass%>"required="required"/>
	 				<input type="button" id="EquipClassBtn" value="분류검색" onclick="EquipClass01();" />
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>차량 옵션</td>
	 			<td>
	 				<input type="text" readonly="readonly" name="EquipOption" id="EquipOption" value="<%=EquipOption%>"/>
	 				<input type="button" id="EquipOptionBtn" value="옵션검색" onclick="EquipOption01();"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>차량 등록일</td>
	 			<td>
	 				<input type="date" name="EquipRD01" id="EquipRD01" value="<%=EquipRD%>" placeholder="클릭하면 달력이 생성됩니다."/>
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
		 			<input type="date" id="EquipID01" name="EquipID01" value="<%=EquipID%>" placeholder="클릭하면 달력이 생성됩니다." />
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
	<input type="button" value="취소" onClick="location.href='showVehicleInfo.do'"/>
	<hr />
</body>
</html>