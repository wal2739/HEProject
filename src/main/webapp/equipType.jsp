<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차종 선택</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function loadOn() {
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
	function closeOnClick(idValue) {
		var idValue = document.getElementById(idValue.getAttribute('id')).getAttribute('id');
		if(idValue=="EquipType09"){
			opener.document.getElementById("EquipType").value = '';
			opener.document.getElementById("EquipType").removeAttribute('readonly');
			opener.document.getElementById("EquipClass").removeAttribute('readonly');
			opener.document.getElementById("EquipOption").removeAttribute('readonly');
			opener.document.getElementById("EquipClassBtn").setAttribute('type','hidden');
			opener.document.getElementById("EquipOptionBtn").setAttribute('type','hidden');
			window.close();
		}else{
			opener.document.getElementById("EquipType").setAttribute('readonly','readonly');
			opener.document.getElementById("EquipClass").setAttribute('readonly','readonly');
			opener.document.getElementById("EquipOption").setAttribute('readonly','readonly');
			opener.document.getElementById("EquipClassBtn").setAttribute('type','button');
			opener.document.getElementById("EquipType").value = document.getElementById(idValue).value;
			if(!(idValue=="EquipType03"||idValue=="EquipType02")){
				opener.document.getElementById("EquipOptionBtn").setAttribute('type','hidden');
				if(idValue=="EquipType09"){}else{
					opener.document.getElementById("EquipOption").value='해당없음';
				}
				window.close();
			}else{
				opener.document.getElementById("EquipOptionBtn").setAttribute('type','button');
				opener.document.getElementById("EquipOption").value='';
				window.close();
			}
		}
		
		
		
	}
</script>
<style>
	input {
		border: 1px solid black;
	}
</style>
<body onload="loadOn();">
	<h1>차종 선택</h1>
	<p>원하는 차종을 클릭해 주세요</p>
	<input type="image" src="/image/jiGae.png" id="EquipType01" value="지게차" onclick="closeOnClick(this);"/>
	<input type="image" src="/image/sadari.jpg" id="EquipType02" value="사다리" onclick="closeOnClick(this);"/>
	<input type="image" src="/image/sky.jpg" id="EquipType03" value="스카이" onclick="closeOnClick(this);"/><br />
	<input type="image" src="/image/crain.jpg" id="EquipType04" value="크레인" onclick="closeOnClick(this);"/>
	<input type="image" src="/image/kago.jpg" id="EquipType05" value="카고" onclick="closeOnClick(this);"/>
	<input type="image" src="/image/gool.jpg" id="EquipType06" value="굴삭기" onclick="closeOnClick(this);"/><br />
	<input type="image" src="/image/hwamul.jpg" id="EquipType08" value="화물차" onclick="closeOnClick(this);"/>
	<input type="image" src="/image/Self.jpg" id="EquipType09" value="직접입력" onclick="closeOnClick(this);"/>
	
</body>
</html>