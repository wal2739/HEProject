<%@page import="com.HEProject.he.usersInfo.SearchInfoVO"%>
<%@page import="com.HEProject.he.usersInfo.UsersInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<SearchInfoVO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 찾기/추가</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	
	function changeEquipInfo() {
		var equipInfo = document.getElementById("equipInfo");
	    var selectValue = equipInfo.options[equipInfo.selectedIndex].value;	    
		if(selectValue=="noEq"){
			alert('차량을 선택 하세요.');
		}else{
			location.href='searchGrouper.do?eqType=' + selectValue;
		}
	}
	/* function checkedFunc(indexNum) {
		console.log(document.getElementById("chkBox" + indexNum).value);
	} */
	function successFun() {
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
		
		var resultNum = <%=request.getAttribute("resultNum")%>;
		if(resultNum==null){
			
		}else if(resultNum==1){
			alert('그룹 가입 제의가 정상적으로 처리되었습니다.');
		}else if(resultNum==0){
			alert('그룹 가입 제의가 정상적으로 처리되지 않았습니다. 다시 시도 해주세요');
		}else{
			alert('정상적인 요청이 아닙니다.');
		}
	}
</script>
<body onload="successFun();">
	<h1>회원 찾기/추가</h1>
	<select name="equipInfo" id="equipInfo" onchange="changeEquipInfo()">
	    <option value="noEq" selected="selected">차량 선택</option>
	    <option value="크레인">크레인</option>
	    <option value="덤프">덤프</option>
	    <option value="굴삭기">굴삭기</option>
	    <option value="화물차">화물차</option>
	    <option value="지게차">지게차</option>
	    <option value="카고">카고</option>
	    <option value="사다리">사다리</option>
	    <option value="스카이">스카이</option>
	    <option value="기타">기타</option>
	</select>
	<form action="sendOffer.do">
		<table>
			<%if(list==null){ %>
				<tr>
					<td>
						<p>차량 옵션을 선택해주세요.</p>
					</td>
				</tr>
			<%}else{ 
				  if(list.size()==0){%>
				  	<tr>
						<td>
							<p>해당 차량을 보유한 사용자가 없습니다.</p>
						</td>
					</tr>
				  <% }else{%>
				<%for(int i = 0 ; i < list.size(); i++){ %>
					<tr>
						<td><input type="checkbox" value="<%=list.get(i).getUsRn() %>" name="chkUsRn" id="chkUsRn"/></td>
						<td>이름 : <%=list.get(i).getUserName() %></td>
						<td>차량 종류 : <%=list.get(i).getEquipType() %></td>
						<td>차량 분류 : <%=list.get(i).getEquipClass() %></td>
						<td>차량 옵션 : <%=list.get(i).getEquipOption() %></td>
					</tr>
				<%}	} %>
			<%} %>
		</table>
		<input type="submit" value="가입 권유"/>
	</form>
		<input type="button" value="뒤로가기" onclick="location.href='showGrouper.do'" />
	
</body>
</html>	