<%@page import="com.HEProject.he.workInfo.WorkerInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<WorkerInfoVO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주 사용자</title>
</head>
<style>
	.workerList{
		border: 1px solid black;
		background: #dcdcdc;
		overflow: scroll;
		width: 1500px;
		height: 200px;
	}
</style>
<script type="text/javascript">
	function changeWorker(iNum) {
		document.getElementById("usRn").value = document.getElementById("usRn" + iNum).value;
		document.getElementById("userName").value = document.getElementById("userName" + iNum).value ;
		document.getElementById("userCell").value = document.getElementById("userCell" + iNum).value;
		document.getElementById("equipType").value = document.getElementById("equipType" + iNum).value;
		document.getElementById("equipClass").value = document.getElementById("equipClass" + iNum).value;
		document.getElementById("equipOption").value = document.getElementById("equipOption" + iNum).value;
		document.getElementById("eqRn").value = document.getElementById("eqRn" + iNum).value;
		parent.changeWorkerAct();
	}
</script>
<body>
	<div class="workerList" id="workerList">
		<%if(list.size()==0){ %>
		<p>수행 가능한 사용자가 없습니다.</p>
		<%}else{for(int i = 0 ; i < list.size(); i++){ %>
		<p onclick="changeWorker(<%=i%>);"><input type="hidden" id="eqRn<%=i %>" readonly="readonly" value="<%=list.get(i).getEqRn() %>"/><input type="hidden" id="usRn<%=i %>" readonly="readonly" value="<%=list.get(i).getUsRn()%>"/><%=i+1 %>. 이름 : <input type="text" readonly="readonly" id="userName<%=i %>" value="<%=list.get(i).getUserName() %>"/> | 연락처 : <input type="text" readonly="readonly" id="userCell<%=i %>" value="<%=list.get(i).getUserCell() %>"/> | 차량 종류 : <input type="text" readonly="readonly" id="equipType<%=i %>" value="<%=list.get(i).getEquipType() %>"/> | 차량 분류 : <input type="text" readonly="readonly" id="equipClass<%=i %>" value="<%=list.get(i).getEquipClass() %>"/> | 차량 옵션 : <input type="text" id="equipOption<%=i %>" readonly="readonly" value="<%=list.get(i).getEquipOption() %>"/> </p>
		<hr />
		<%}} %>
		<input type="hidden" id="usRn" name="usRn"/>
		<input type="hidden" id="userName" name="userName"/>
		<input type="hidden" id="userCell" name="userCell"/>
		<input type="hidden" id="equipType" name="equipType"/>
		<input type="hidden" id="equipClass" name="equipClass"/>
		<input type="hidden" id="equipOption" name="equipOption"/>
		<input type="hidden" id="eqRn" name="eqRn"/>
	</div>
</body>
</html>