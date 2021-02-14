<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 추가</title>
<script type="text/javascript">
function validate() {
	var re = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일이 적합한지 검사할 정규식
	var chkNum = /^[0-9]+$/;//숫자
	var bizNum = document.getElementById("clientBoNumber01").value + document.getElementById("clientBoNumber02").value + document.getElementById("clientBoNumber03").value;

	var checkSum = 0;//사업자 합
	var checkID = [1,3,7,1,3,7,1,3,5];//사업자 체크번호
	
	var boName = document.getElementById("clientCeo").value;//
	var boPhone01 = document.getElementById("clientPhone01").value;
	var boPhone02 = document.getElementById("clientPhone02").value;
	var boPhone03 = document.getElementById("clientPhone03").value;
	var boCell01 = document.getElementById("clientCell01").value;//
	var boCell02 = document.getElementById("clientCell02").value;//
	var boCell03 = document.getElementById("clientCell03").value;//		
	
	var boMail = document.getElementById("clientMail").value;//
	var boAdd01 = document.getElementById("clientAdd01").value;//
	var boAdd02 = document.getElementById("clientAdd02").value;
	var relative = document.getElementById("relative").value ;
	var cpName = document.getElementById("clientCpName").value ;
	var manager = document.getElementById("clientManager").value ;

	
	var boCell = null;
	if(boCell01!=''&&boCell02!=''&&boCell03!=''){
		boCell = boCell01 + "-" + boCell02 + "-" + boCell03;
	}
	var boPhone = boPhone01 + "-" + boPhone02 + "-" + boPhone03;
	
	////////////////////////////////////////사업자 번호 체크//////////////////////////////

	if(cpName=="") {
        alert("거래처 업체명을 입력해 주세요");
        document.getElementById("clientCpName").focus();
        return false;
    }
	
	if(document.getElementById("clientBoNumber01").value==''||document.getElementById("clientBoNumber02").value==''||document.getElementById("clientBoNumber03").value==''){
		alert('사업자 번호를 모두 입력 해주세요.');
		document.getElementById("clientBoNumber01").focus();
		return false;
	}
	if ((bizNum = (bizNum+'').match(/\d{1}/g)).length != 10) { 
	    alert('사업자 등록 번호가 올바르게 입력되었는지 확인해주세요.');
	    return false; 
	}
	for (var i=0; i<9; i++) {
	    checkSum += checkID[i] * Number(bizNum[i]);
	}
	if (10 - ((checkSum + Math.floor(checkID[8] * Number(bizNum[8]) / 10)) % 10) != Number(bizNum[9])) {
	    alert('사업자 등록 번호가 올바르게 입력되었는지 확인해주세요.');
	    return false;
	}
	
	////////////////////////////////////////사업자 번호 체크//////////////////////////////
	
	if(boName=="") {
        alert("거래처 대표를 입력해 주세요");
        document.getElementById("clientCeo").focus();
        return false;
	}
	
	if(manager=="") {
        alert("거래처 담당자를 입력해 주세요");
        document.getElementById("clientManager").focus();
        return false;
	}
   
	if(boPhone01==""||boPhone02==""||boPhone01=="") {
        alert("전화 번호를 입력해 주세요");
        document.getElementById("clientPhone01").focus();
        return false;
    }

	if(boMail!=""){
		if(!re.test(boMail)) {
	    	alert("적합하지 않은 이메일 형식입니다.");
	    	document.getElementById("clientMail").focus();
	        return false;
	    }
	}
 
    if(boAdd01=="") {
        alert("주소를 입력해 주세요");
        document.getElementById("clientAdd01").focus();
        return false;
    }
    
    
    if(!chkNum.test(boPhone01)||!chkNum.test(boPhone02)||!chkNum.test(boPhone03)){
		alert('전화번호는 숫자만 입력해주세요.');
		document.getElementById("clientPhone01").value=='';
		document.getElementById("clientPhone02").value=='';
		document.getElementById("clientPhone03").value='';
		document.getElementById("clientPhone01").focus();
		return false;
	}
    
    if(boCell01!=''||boCell02!=''||boCell03!=''){
    	if(!chkNum.test(boCell01)||!chkNum.test(boCell02)||!chkNum.test(boCell03)){
    		alert('핸드폰번호는 숫자만 입력해주세요.');
    		document.getElementById("clientCell01").value=='';
    		document.getElementById("clientCell02").value=='';
    		document.getElementById("clientCell03").value='';
    		document.getElementById("clientCell01").focus();
    		return false;
    	}
    }
	if(cpName==null){
		alert('거래처명을 입력해주세요.');
    	return false;
    }
    
	document.getElementById("clientCell").value = boCell;
	document.getElementById("clientPhone").value = boPhone;
	console.log('실행됨');

}

function CliCheck() {
	
	var boCheck = <%=request.getAttribute("newCliCheck")%>
	console.log(boCheck);
	if(boCheck==null){
		
	}else if(boCheck==0){
		alert('정상적으로 거래처 등록이 진행되지 않았습니다. 다시 작성해주세요.');
	}else if(boCheck==1){
		alert('거래처 등록이 정상적으로 처리 되었습니다.');
		return location.href="showClient.do";
	}else{
		alert('정상적인 요청이 아닙니다.');
	}
}
</script>
<style>
	table, th, td {
	    border: 1px solid black;
	    text-align: center;
	}
	table {
	    border-collapse: collapse;
	    display: inline-block;
	}
</style>
</head>
<body onload="CliCheck();">
	<h1>거래처 추가</h1>
	<form action="newClientAct.do" name="forms" id="forms" >
		<table>
			<tr>
				<td>거래처 명</td>
	 			<td><input type="text" name="clientCpName" id="clientCpName" maxlength="15"/></td>
			</tr>
			<tr>
				<td>거래처 사업자번호</td>
				<td>
	 				<input type="text" name="clientBoNumber01" id="clientBoNumber01" maxlength="3"/>-
	 				<input type="text" name="clientBoNumber02" id="clientBoNumber02" maxlength="2"/>-
	 				<input type="text" name="clientBoNumber03" id="clientBoNumber03" maxlength="5"/>
	 			</td>
			</tr>
			<tr>
				<td>거래처 대표</td>
	 			<td><input type="text" name="clientCeo" id="clientCeo" maxlength="7"/></td>
			</tr>
			<tr>
				<td>거래처 담당자</td>
	 			<td><input type="text" name="clientManager" id="clientManager" maxlength="7"/></td>
			</tr>
			<tr>
				<td>거래처 전화번호</td>
				<td>
	 				<input type="text" name="clientPhone01" id="clientPhone01" maxlength="4"/>-
	 				<input type="text" name="clientPhone02" id="clientPhone02" maxlength="4"/>-
	 				<input type="text" name="clientPhone03" id="clientPhone03" maxlength="4"/>
	 				<input type="hidden" name="clientPhone" id="clientPhone"/>
	 			</td>
			</tr>
			<tr>
				<td>거래처 핸드폰번호(생략가능)</td>
				<td>
	 				<input type="text" name="clientCell01" id="clientCell01" maxlength="3"/>-
	 				<input type="text" name="clientCell02" id="clientCell02" maxlength="4"/>-
	 				<input type="text" name="clientCell03" id="clientCell03" maxlength="4"/>
	 				<input type="hidden" name="clientCell" id="clientCell"/>
	 			</td>
			</tr>
			<tr>
				<td>거래처 이메일(생략가능)</td>
	 			<td><input type="text" name="clientMail" id="clientMail" /></td>
			</tr>
			<tr>
				<td>거래처 주소</td>
	 			<td><input type="text" name="clientAdd01" id="clientAdd01" maxlength="33"/></td>
			</tr>
			<tr>
				<td>거래처 상세주소(생략가능)</td>
	 			<td><input type="text" name="clientAdd02" id="clientAdd02" maxlength="19"/></td>
			</tr>
			<tr>
				<td>비고(생략가능, 최대40자)</td>
	 			<td><input type="text" name="relative" id="relative" maxlength="40"/></td>
			</tr>
		</table>
		<input type="submit" value="등록" onclick="return validate();"/>
	</form>
	<input type="button" value="뒤로가기" onclick="location.href='showClient.do'" />
	
</body>
</html>