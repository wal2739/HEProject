<%@page import="com.HEProject.he.vehicleInfo.VehicleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    	List<VehicleVO> list = (List)request.getAttribute("vehicleInfo");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 등록 현황</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function delCheck(rowNum) {
		var equipNum = document.getElementById('equipNum'+rowNum).value;
		var oneCheck =confirm("차량 정보는 한번 삭제하시면 같은 차량 번호로 다시 등록 하실 수 없습니다. 정말 삭제 하시겠습니까 ?");
		if(oneCheck==true){
			var twoCheck =confirm("정말 삭제 하시겠습니까 ? (확인을 누르시면 삭제가 완료됩니다.)");
			if(twoCheck==true){
				location.href='deleteVehicle.do?EquipNum=' + equipNum;
			}else{
				alert('삭제가 취소 되었습니다.');
			}
		}else{
			alert('삭제가 취소 되었습니다.');			
		}
		
	}
	function modCheck(rowNum) {
		var checkId = 'equipNum' + rowNum;
		var equipNum = document.getElementById(checkId).value;
		var oneCheck =confirm("[차량번호 : "+ equipNum +"] 해당 차량 정보를 수정하시겠습니까?");
		if(oneCheck==true){
			location.href='modifyVehicle.do?EquipNum=' + equipNum + '&EquipNumSv=' + equipNum;
		}else{
			alert('수정이 취소 되었습니다.');			
		}
		
	}
	function loadCheck() {
		var newVehicleCheck = <%=request.getAttribute("newVehicleCheck")%>;
		var modVehicleCheck = <%=request.getAttribute("modVehicleCheck")%>;
		var delVehicleCheck = <%=request.getAttribute("delVehicleCheck")%>;
		if(newVehicleCheck==null){}
		if(newVehicleCheck==1){
			alert('차량정보가 정상적으로 등록되었습니다.');
		}
		if(newVehicleCheck==0){
			alert('차량정보가 정상적으로 등록되지 않았습니다. 다시 시도 해주세요.');
		}
		if(modVehicleCheck==null){}
		if(modVehicleCheck==1){
			alert('차량정보가 정상적으로 수정 되었습니다.');
		}
		if(modVehicleCheck==0){
			alert('차량정보가 정상적으로 수정되지 않았습니다. 다시 시도 해주세요.');
		}
		if(delVehicleCheck==null){}
		if(delVehicleCheck==1){
			alert('차량정보가 정상적으로 삭제 되었습니다.');
		}
		if(delVehicleCheck==0){
			alert('차량정보가 정상적으로 삭제 되지 않았습니다. 다시 시도 해주세요.');
		}
		<%
		String loginCheckData="";
		try{
			loginCheckData= (String)session.getAttribute("userId");
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
		%>
		var loginCheckData = '<%=loginCheckData%>';
		loginCheck(loginCheckData);
		
	}
</script>
<style>
table{
	padding: 10px;
	border: 
}
tr, td {
	border: black solid 1px;
	border-bottom: black solid 2px;
	padding: 2px;
}
</style>
<body onload="loadCheck();">
	<h1>차량 등록 현황</h1>
	<input type="button" value="차량등록" onClick="location.href='vehicleInfo.do'"/>
	<input type="button" value="뒤로가기" onClick="location.href='RegiForIndividual.do'"/>
	<div>
	<hr /><%if(list.size()==0){ %>
			<p>현재 등록된 차량이 없습니다.</p>
		<%}else {for(int i = 0 ; i < list.size(); i++){ %>
			<table>
				<tr>
					<td>차량번호</td>
					<td>
						<input type="hidden" id="equipNum<%=i %>" value="<%=list.get(i).getEquipNum() %>"/><%=list.get(i).getEquipNum() %>
					</td>
				</tr>
				<tr>
					<td>차량종류</td>
					<td><%=list.get(i).getEquipType() %></td>
				</tr>
				<tr>
					<td>상세분류</td>
					<td><%=list.get(i).getEquipClass() %></td>
				</tr>
				<tr>
					<td>차량옵션</td>
					<td><%=list.get(i).getEquipOption() %></td>
				</tr>
				<tr>
					<td>차량등록일</td>
					<td><%=list.get(i).getEquipRD() %></td>
				</tr>
				<tr>
					<td>차량검사일</td>
					<td><%=list.get(i).getEquipID() %></td>
				</tr>
				<tr>
					<td>수정</td>
					<td><input type="button" value="수정" onClick="modCheck(<%=i%>);"/></td>
				</tr>
				<tr>
					<td>삭제</td>
					<td><input type="button" value="삭제" onClick="delCheck(<%=i%>);"/></td>
				</tr>
			</table>
			<hr />
		<%}
		}%>
	</div>
	<hr />
	

</body>
</html>