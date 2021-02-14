<%@page import="com.HEProject.he.boInfo.BOInfoVO"%>
<%@page import="com.HEProject.he.usersInfo.UsersInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
    <%
		/* UsersInfoVO vo01 = ;
    	BOInfoVO boInfo01 = ; */
    	/*추후 기호(-)을 이용한 split함수로 대체*/
    		
		String loginCheckData="";
		String[] boNumber = null;
		String[] boRRN = null;
		String[] boPhone = null;
		String[] boCell = null;
		UsersInfoVO vo02 = (UsersInfoVO)request.getAttribute("userInfo");
		BOInfoVO boInfo02 = (BOInfoVO)request.getAttribute("boInfo");
		try{
			loginCheckData= (String)session.getAttribute("userId");
			System.out.println("정상 실행 1");
			
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
		System.out.println(vo02);
		System.out.println(boInfo02);
		try{
			vo02.getUserName();
		}catch(NullPointerException e){
			vo02 = new UsersInfoVO();
			vo02.setUserName("1");
			vo02.setUserCell("1");
			vo02.setUserAdd01("1");
			vo02.setUserAdd02("");
			vo02.setUserEmail("1");
			boInfo02 = new BOInfoVO();
			boInfo02.setBoNumber("1");
			boInfo02.setBoName("1");
			boInfo02.setUsRn("1");
			boInfo02.setBoRrn("1");
			boInfo02.setBoPhone("1");
			boInfo02.setBoCell("1");
			boInfo02.setBoMail("1");
			boInfo02.setBoLicense(0);
			boInfo02.setBoAdd01("1");
			boInfo02.setBoAdd02("1");
			boInfo02.setBoAcc(0);
			boInfo02.setBoAccBack("1");
		}
		
		System.out.println("변환후 : "+vo02);
		System.out.println(boInfo02);
		
		try{
			boNumber = boInfo02.getBoNumber().split("-");
			boRRN = boInfo02.getBoRrn().split("-");
			boPhone = boInfo02.getBoPhone().split("-");
			boCell = boInfo02.getBoCell().split("-"); 
	    	System.out.println("정상 실행 2");
		}catch(NullPointerException e){
			boNumber = null;
			boRRN = null;
			boPhone = null;
			boCell = null;
		}
		
		
		
    	
    	
    	/* if(boNumber03.length()==5){
    		
    	}else{
    		for(int i = boNumber03.length() ; i < 5; i++){
    			"0".concat(boNumber03);
    		}
    	} */
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 정보 등록</title>
</head>
<script type="text/javascript" src="/js/main.js" ></script>
<script type="text/javascript">
	function validate() {
		var re = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일이 적합한지 검사할 정규식
		var chkNum = /^[0-9]+$/;//숫자
		var bizNum = document.getElementById("boNumber01").value + document.getElementById("boNumber02").value + document.getElementById("boNumber03").value;
		var boRrn = document.getElementById("boRrn01").value + "-" +document.getElementById("boRrn02").value;//주민등록번호
		
		var boRrn01 = document.getElementById("boRrn01").value;//주민등록번호 앞자리
		var boRrn02 = document.getElementById("boRrn02").value;//주민등록번호 뒷자리
		var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
	    var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열
		var checkSum = 0;
		var checkID = [1,3,7,1,3,7,1,3,5];
		
		var boName = document.getElementById("boName").value;//
		var boPhone01 = document.getElementById("boPhone01").value;
		var boPhone02 = document.getElementById("boPhone02").value;
		var boPhone03 = document.getElementById("boPhone03").value;
		var boCell01 = document.getElementById("boCell01").value;//
		var boCell02 = document.getElementById("boCell02").value;//
		var boCell03 = document.getElementById("boCell03").value;//		
		
		var boMail = document.getElementById("boMail").value;//
		var boAdd01 = document.getElementById("boAdd01").value;//
		var boAdd02 = document.getElementById("boAdd02").value;
		var boAcc = document.getElementById("boAcc").value;
		var boAccBack = document.getElementById("boAccBack").value;
		var tob01 = document.getElementById("tob01").value;
		var tob02 = document.getElementById("tob02").value;
		var cpName = document.getElementById("cpName").value;

		
		
		var boCell = boCell01 + "-" + boCell02 + "-" + boCell03;
		var boPhone = boPhone01 + "-" + boPhone02 + "-" + boPhone03;
		////////////////////////////////////////사업자 번호 체크//////////////////////////////

		if(document.getElementById("boNumber01").value==''||document.getElementById("boNumber02").value==''||document.getElementById("boNumber03").value==''){
			alert('사업자 번호를 모두 입력 해주세요.');
			document.getElementById("boNumber01").focus();
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
	        alert("이름을 입력해 주세요");
	        document.getElementById("boName").focus();
	        return false;
		}
	    if(boRrn01==""||boRrn02==""){
	        alert("주민등록번호를 입력해 주세요");
	        document.getElementById("boRrn01").focus();
	        return false;
	    }
	    ////////////////////주민등록번호 체크/////////////////
	    for (var i=0; i < boRrn01.length; i++) {
	           arrNum1[i] = boRrn01.charAt(i);
	       } // 주민번호 앞자리를 배열에 순서대로 담는다.

	       for (var i=0; i < boRrn02.length; i++) {
	           arrNum2[i] = boRrn02.charAt(i);
	       } // 주민번호 뒷자리를 배열에 순서대로 담는다.

	       var tempSum=0;

	       for (var i=0; i < boRrn01.length; i++) {
	           tempSum += arrNum1[i] * (2+i);
	       } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함

	       for (var i=0; i<boRrn02.length-1; i++) {
	           if(i>=2) {
	               tempSum += arrNum2[i] * i;
	           }
	           else {
	               tempSum += arrNum2[i] * (8+i);
	           }
	       } // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함

	       if((11-(tempSum%11))%10!=arrNum2[6]) {
	           alert("올바른 주민번호가 아닙니다.");
	           boRrn01 = "";
	           boRrn02 = "";
	           document.getElementById("boRrn01").focus();
	           return false;
	       }
		////////////////////주민등록번호 체크/////////////////
		if(boPhone01==""||boPhone02==""||boPhone01=="") {
	        alert("전화 번호를 입력해 주세요");
	        document.getElementById("boPhone").focus();
	        return false;
	    }
		
	    if(boCell01==""||boCell02==""||boCell03=="") {
	        alert("핸드폰 번호를 입력해 주세요");
	        document.getElementById("boCell").focus();
	        return false;
	    }
	    
	    if(boMail=="") {
	        alert("이메일을 입력해 주세요");
	        document.getElementById("boMail").focus();
	        return false;
	    }
	
	    if(!re.test(boMail)) {
	    	alert("적합하지 않은 이메일 형식입니다.");
	    	document.getElementById("boMail").focus();
	        return false;
	    }
	    
	    if(boAdd01=="") {
	        alert("주소를 입력해 주세요");
	        document.getElementById("boAdd01").focus();
	        return false;
	    }
	    
	    if(boAcc=="") {
	        alert("계좌번호를 입력해 주세요");
	        document.getElementById("boAcc").focus();
	        return false;
	    }
	    
	    if(boAccBack=="") {
	        alert("은행을 입력해 주세요");
	        document.getElementById("boAccBack").focus();
	        return false;
	    }
	    
	    if(!chkNum.test(boPhone01)||!chkNum.test(boPhone02)||!chkNum.test(boPhone03)){
			alert('전화번호는 숫자만 입력해주세요.');
			document.getElementById("boPhone01").value=='';
			document.getElementById("boPhone02").value=='';
			document.getElementById("boPhone03").value='';
			document.getElementById("boPhone01").focus();
			return false;
		}
	    
	    if(!chkNum.test(boCell01)||!chkNum.test(boCell02)||!chkNum.test(boCell03)){
			alert('핸드폰번호는 숫자만 입력해주세요.');
			document.getElementById("boCell01").value=='';
			document.getElementById("boCell02").value=='';
			document.getElementById("boCell03").value='';
			document.getElementById("boCell01").focus();
			return false;
		}
	    
	    if(tob01==null){
	    	alert('업종을 입력해주세요.');
	    	return false;
	    }
		if(tob02==null){
			alert('업태을 입력해주세요.');
	    	return false;
	    }
		if(cpName==null){
			alert('업체명을 입력해주세요.');
	    	return false;
	    }
	    
/* 	    document.getElementById("boNumber").value = bizNum;
 */	    document.getElementById("boRrn").value = boRrn;
		document.getElementById("boCell").value = boCell;
		document.getElementById("boPhone").value = boPhone;

	}

	/* function licenseNum(){
		var regNumber = document.getElementById("boNumber").value;
	    regNumber.replace(/([0-9]{3})(0-9{2})([0-9]{5})/,"$1-$2-$3"); 
	    } */
	    
	/* function checkBoxOn() {
	    	if(document.getElementById("sameInfo").value=='no'){
	    		document.getElementById("boName").value = document.getElementById("userName").value;
	        	document.getElementById("boCell").value = document.getElementById("userCell").value;
	        	document.getElementById("boMail").value = document.getElementById("userEmail").value;
	        	document.getElementById("boAdd01").value = document.getElementById("userAdd01").value;
	        	document.getElementById("boAdd02").value = document.getElementById("userAdd02").value;
	        	document.getElementById("sameInfo").value = 'yes';
	    	}else{
	    		document.getElementById("boName").value = "";
	        	document.getElementById("boCell").value = "";
	        	document.getElementById("boMail").value = "";
	        	document.getElementById("boAdd01").value = "";
	        	document.getElementById("boAdd02").value = "";
	        	document.getElementById("sameInfo").value = 'no';
	    	}
	} */
	function boCheck() {
		///////////
		<%
		

		%>
		
		
		//////////
		
		var cpNameVal = '<%=boInfo02.getCpName()%>';
		if(cpNameVal=='없음'){
			document.getElementById('cpName').setAttribute('readonly','readonly');
		}
		var loginCheckData = '<%=loginCheckData%>';
		loginCheck(loginCheckData);
		////		
		var boCheck = <%=request.getAttribute("boCheck")%>
		console.log(boCheck);
		if(boCheck==null){}
		if(boCheck==0){	
			alert('정상적으로 사업자가 수정되지 않았습니다. 다시 작성해주세요.');
		}
		if(boCheck==1){
			alert('사업자정보 수정이 정상적으로 처리 되었습니다.');
			return location.href="showBO.do";
		}
		if(boCheck==2){
			alert('존재하지 않는 사업자 번호입니다.');
		}
		if(boCheck==3){
			alert('확인되지 않은 요청입니다.');
		}
	}

	function loadOn() {
		
		
		
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
<body onload="boCheck();">

	<h1>사업자 정보 등록</h1>
	<h2>현재 사용자 정보</h2>
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="userName" id="userName" readonly="readonly" value="<%=vo02.getUserName() %>"/></td>
		</tr>
		<tr>
			<td>핸드폰 번호</td>
			<td><input type="text" name="userCell" id="userCell" readonly="readonly" value="<%=vo02.getUserCell() %>"/></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="userAdd01" id="userAdd01" readonly="readonly" value="<%=vo02.getUserAdd01() %>"/></td>
		</tr>
		<tr>
			<td>상세 주소</td>
			<td><input type="text" name="userAdd02" id="userAdd02" readonly="readonly" value="<%=vo02.getUserAdd02() %>"/></td>
		</tr>
		<tr>
			<td>메일 주소</td>
			<td><input type="text" name="userEmail" id="userEmail" readonly="readonly" value="<%=vo02.getUserEmail() %>"/></td>
		</tr>
	</table>
	
	<hr />
	
	<h2>사업자 정보 등록</h2>
	<form action="modifyBO.do" method="post" name="forms" id="forms" onsubmit="return validate();">
		<table>
			
	 		<tr>
	 			<td>사업자 번호 [필수]<p>예 : 000-00-00000</p></td>
	 			<td>
	 				<input type="text" name="boNumber01" value="<%=boNumber[0] %>" id="boNumber01" maxlength="3"/>-
	 				<input type="text" name="boNumber02" value="<%=boNumber[1] %>" id="boNumber02" maxlength="2"/>-
	 				<input type="text" name="boNumber03" value="<%=boNumber[2] %>" id="boNumber03" maxlength="5"/>
	 			</td>
	 		</tr>
	 		<tr>
				<td>업체명</td>
				<td><input type="text" value="<%=boInfo02.getCpName()%>" name="cpName" id="cpName" maxlength="15"/></td>
			</tr>
	 		<tr>
	 			<td>사업자명 [필수]</td>
	 			<td><input type="text" value="<%=boInfo02.getBoName() %>" name="boName" id="boName"/></td>
	 		</tr>
	 		<tr>
				<td>업종</td>
				<td><input type="text" value="<%=boInfo02.getTob01() %>" name="tob01" id="tob01" maxlength="10"/></td>
			</tr>
			<tr>
				<td>업태</td>
				<td><input type="text" value="<%=boInfo02.getTob02() %>" name="tob02" id="tob02" maxlength="10"/></td>
			</tr>
	 		<tr>
	 			<td>사업자 주민등록 번호 [필수]</td>
	 			<td><input type="text" value="<%=boRRN[0] %>" name="boRrn01" id="boRrn01" maxlength="6"/>-
	 			<input type="text" value="<%=boRRN[1] %>" name="boRrn02" id="boRrn02" maxlength="7"/>
	 			<input type="hidden" id="boRrn" name="boRrn"/></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 전화번호 [필수] </td>
	 			<td>
	 				<input type="text" value="<%=boPhone[0]%>"name="boPhone01" id="boPhone01"/>-
	 				<input type="text" value="<%=boPhone[1]%>" name="boPhone02" id="boPhone02"/>-
	 				<input type="text" value="<%=boPhone[2]%>" name="boPhone03" id="boPhone03"/>
	 				<input type="hidden" name="boPhone" id="boPhone"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>사업자 핸드폰 번호 [필수]</td>
	 			<td>
	 				<input type="text" value="<%=boCell[0]%>" name="boCell01"id="boCell01"/>-
	 				<input type="text" value="<%=boCell[1]%>" name="boCell02"id="boCell02"/>-
	 				<input type="text" value="<%=boCell[2]%>" name="boCell03"id="boCell03"/>
	 				<input type="hidden" name="boCell" id="boCell"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>사업자 이메일</td>
	 			<td><input type="text" value="<%=boInfo02.getBoMail() %>" name="boMail" id="boMail"/></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 주소 [필수]</td>
	 			<td><input type="text" value="<%=boInfo02.getBoAdd01() %>" name="boAdd01" id="boAdd01"/></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 상세 주소</td>
	 			<td><input type="text" value="<%=boInfo02.getBoAdd02() %>" name="boAdd02" id="boAdd02"/></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 계좌 [필수]</td>
	 			<td><input type="text"value="<%=boInfo02.getBoAcc() %>"  name="boAcc" id="boAcc" placeholder="- 빼고 작성"/></td>
	 		</tr>
	 		<tr>
	 			<td>사업자 계좌 은행 [필수]</td>
	 			<td>
	 				<select name="boAccBack" id="boAccBack">
	 					<option value="국민은행">KB국민은행</option>
	 					<option value="우리은행">우리은행</option>
	 					<option value="신한은행">신한은행</option>
	 					<option value="하나은행">KEB하나은행</option>
	 					<option value="제일은행">SC제일은행</option>
	 					<option value="한국씨티은행">한국씨티은행</option>
	 					<option value="케이뱅크">케이뱅크</option>
	 					<option value="카카오뱅크">카카오뱅크</option>
	 				</select></td>
	 		</tr>
	 	</table>
	 	<input type="submit" value="저장"/>
	 	<input type="button" value="초기화" onClick="allClear()"/>
	 	<input type="button" value="뒤로가기" onClick="location.href='showBO.do'"/>
	</form>
</body>
</html>