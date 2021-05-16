<%@page import="java.util.ArrayList"%>
<%@page import="com.HEProject.he.workersInfo.WorkersInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    	List<WorkersInfoVO> vo = (List)request.getAttribute("wokersInfo"); 
    	
    	/* try{
			vo.get(1).getWorkerCode();
		}catch(NullPointerException e){
			checkToF = true;
			System.out.println("사업자 정보 등록 널 에러 : " + e);
		} */
		String loginCheckData="";
    	String checkData="";
		String boCheckIndex = "";
		try{
			loginCheckData= (String)session.getAttribute("usRn");
			if(loginCheckData==null){
				checkData="실패";
			}else{
				boCheckIndex = (String)session.getAttribute("boCheckIndex");
				checkData="성공";
			}
			System.out.println(checkData);
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대리작업자 등록 화면</title>
</head>
<script type="text/javascript" src="/js/main.js?ver=1" ></script>
<script type="text/javascript">
	function validate() {
		var chkNum = /^[0-9]+$/;
		var workerRRN01 = document.getElementById("workerRRN01").value;//주민등록번호 앞자리
		var workerRRN02 = document.getElementById("workerRRN02").value;//주민등록번호 뒷자리
		var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
	    var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열
		var checkSum = 0;
		var checkID = [1,3,7,1,3,7,1,3,5];
		
		var workerName = document.getElementById("workerName").value;//
		var workerCell01 = document.getElementById("workerCell01").value;
		var workerCell02 = document.getElementById("workerCell02").value;
		var workerCell03 = document.getElementById("workerCell03").value;
		var workerPhone01 = document.getElementById("workerPhone01").value;//
		var workerPhone02 = document.getElementById("workerPhone02").value;//
		var workerPhone03 = document.getElementById("workerPhone03").value;//		
		var workerAdd01 = document.getElementById("workerAdd01").value;//
		var workerAdd02 = document.getElementById("workerAdd02").value;
		var workerPW = document.getElementById("workerPW").value;
		var workerPWCheck = document.getElementById("workerPWCheck").value;
	
		
		var workerCell = workerCell01 + "-" + workerCell02 + "-" + workerCell03;
		var workerPhone = workerPhone01 + "-" + workerPhone02 + "-" + workerPhone03;
		var workerRRN = workerRRN01 + "-" + workerRRN02;
		
		if(!chkNum.test(workerPhone01)||!chkNum.test(workerPhone02)||!chkNum.test(workerPhone03)){
			alert('전화번호는 숫자만 입력해주세요.');
			document.getElementById("workerPhone01").value=='';
			document.getElementById("workerPhone02").value=='';
			document.getElementById("workerPhone03").value='';
			document.getElementById("workerPhone01").focus();
			return false;
		}
		
		if(document.getElementById("workerName").value=="") {
	        alert("이름을 입력해 주세요");
	        document.getElementById("workerName").focus();
	        return false;
		}
	    if(workerRRN01==""||workerRRN02==""){
	        alert("주민등록번호를 입력해 주세요");
	        document.getElementById("workerRRN01").focus();
	        return false;
	    }
	    ////////////////////주민등록번호 체크/////////////////
	    for (var i=0; i < workerRRN01.length; i++) {
	           arrNum1[i] = workerRRN01.charAt(i);
	       } // 주민번호 앞자리를 배열에 순서대로 담는다.
	
	       for (var i=0; i < workerRRN02.length; i++) {
	           arrNum2[i] = workerRRN02.charAt(i);
	       } // 주민번호 뒷자리를 배열에 순서대로 담는다.
	
	       var tempSum=0;
	
	       for (var i=0; i < workerRRN01.length; i++) {
	           tempSum += arrNum1[i] * (2+i);
	       } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함
	
	       for (var i=0; i<workerRRN02.length-1; i++) {
	           if(i>=2) {
	               tempSum += arrNum2[i] * i;
	           }
	           else {
	               tempSum += arrNum2[i] * (8+i);
	           }
	       } // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함
	
	       if((11-(tempSum%11))%10!=arrNum2[6]) {
	           alert("올바른 주민번호가 아닙니다.");
	           workerRRN01 = "";
	           workerRRN02 = "";
	           document.getElementById("workerRRN01").focus();
	           return false;
	       }
		////////////////////주민등록번호 체크/////////////////
		if(workerPhone01==""||workerPhone02==""||workerPhone03=="") {
	        alert("전화 번호를 입력해 주세요");
	        document.getElementById("workerPhone01").focus();
	        return false;
	    }
		
	    if(workerCell01==""||workerCell02==""||workerCell03=="") {
	        alert("핸드폰 번호를 입력해 주세요");
	        document.getElementById("workerCell01").focus();
	        return false;
	    }
	    
	    if(workerAdd01=="") {
	        alert("주소를 입력해 주세요");
	        document.getElementById("workerAdd01").focus();
	        return false;
	    }
	    
	    if(workerPW=="") {
	        alert("비밀번호를 입력해 주세요");
	        document.getElementById("workerPW").focus();
	        return false;
	    }
	    
	    if(workerPW!=workerPWCheck){
	    	alert("비밀번호가 다릅니다.");
	        document.getElementById("workerPWCheck").focus();
	        document.getElementById("workerPW")=="";
	        document.getElementById("workerPWCheck")=="";
	        return false;
	    }
	    
	    document.getElementById("workerCell").value = workerCell;
		document.getElementById("workerPhone").value = workerPhone;
		document.getElementById("workerRRN").value = workerRRN;
	
	}
	
	function allClear(){
		 var frm = document.getElementById('forms');
		    var em = frm.elements;
		    frm.reset();
		    for (var i = 0; i < em.length; i++) {
		        if (em[i].type == 'text') em[i].value = '';
		        if (em[i].type == 'checkbox') em[i].checked = false;
		        if (em[i].type == 'radio') em[i].checked = false;
		        if (em[i].type == 'select-one') em[i].options[0].selected = true;
		        if (em[i].type == 'textarea') em[i].value = '';
		    }
	}
	function workerCheck() {
		var workerCheck = '<%=request.getAttribute("workerCheck")%>';
		console.log(workerCheck);
		if(workerCheck==null){}
		if(workerCheck==0){
			alert('대리작업자 등록이 정상적으로 이루어지지 않았습니다. 다시 시도해주세요.');
		}
		if(workerCheck==1){
			var workerCode = '<%=request.getAttribute("workerCode")%>';
			document.getElementById("workerCode").value = workerCode;
			
			var openDialog = function(uri, name, options, closeCallback) {
		    var win = window.open(uri, name, options);
		    var interval = window.setInterval(function() {
			        try {
			            if (win == null || win.closed) {
			                window.clearInterval(interval);
			                closeCallback(win);
			            }
			        }
			        catch (e) {
			        }
			    }, 1000);
			    return win;
			};
			var uri = 'workerCode.jsp';
			var popupName = '아이디확인';
			var options = 'width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes';
			
			openDialog(uri, popupName, options, function(win) {
			    location.href="WorkerInfo.do";
			});
		}
	}
	function deleteCheck() {
		var checkData = '<%=checkData%>';
		console.log(checkData);
		if(checkData=='성공'){
			var loginCheckData = '<%=loginCheckData%>';
		}else if(checkData=='실패'){
			var loginCheckData = null;
		}
		console.log(loginCheckData);
		var checkNum=loginChecknBreak(loginCheckData)*1;
		if(checkNum==0){
			return location.href='login.jsp';
		}
		
		var boCheckIndex = '<%=boCheckIndex%>';
		boIndexCheck(boCheckIndex);
		if(boCheckIndex!='none'){
			
			var deleteCheck = <%=request.getAttribute("deleteCheck")%>
			if(deleteCheck==null){}
			if(deleteCheck==0){
				alert('대리작업자 삭제가 정상적으로 이루어지지 않았습니다. 다시 시도해주세요.');
			}
			if(deleteCheck==1){
				alert('대리작업자 삭제가 완료되었습니다.');
				location.href="WorkerInfo.do";
			}
			
		}
	}

</script>
<style>
	.newWorker,nowWorker {
		float: left;
		border: 1px solid black;
	}
	.Worker {
		border : 1px solid black;
	}
</style>
<body onload="deleteCheck();workerCheck();">
	<h1>대리작업자 등록</h1>
	<input type="hidden" id="workerCode" readonly="readonly"/>
	<div class="newWorker">
		<h2>현재 등록된 대리작업자 정보</h2>
		<%if(vo==null){}else{for(int i = 0 ; i < vo.size(); i++){ %>
			<div class="Worker">
			<table>
				<tr>
					<td>아이디</td>
					<td><%=vo.get(i).getWorkerCode() %></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><%=vo.get(i).getWorkerPW() %></td>
				</tr>
				<tr>
					<td>작업자 성명</td>
					<td><%=vo.get(i).getWorkerName() %></td>
				</tr>
				<tr>
					<td>주민등록번호</td>
					<td><%=vo.get(i).getWorkerRRN() %></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><%=vo.get(i).getWorkerPhone() %></td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><%=vo.get(i).getWorkerCell() %></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><%=vo.get(i).getWorkerAdd01() %></td>
				</tr>
				<tr>
					<td>상세 주소</td>
					<td><%=vo.get(i).getWorkerAdd02() %></td>
				</tr>
				<tr>
					<td><a href="deleteWorker.do?workerCode=<%=vo.get(i).getWorkerCode() %>">삭제</a></td>
				</tr>
			</table>
		</div>
		<%}}%>
	</div>
	
	<div class="newWorker">
		<form action="newWorker.do" name="forms" id="forms" onsubmit="return validate();">
			<table>
				<tr>
					<td>작업자 성명</td>
					<td><input type="text" name="workerName" id="workerName" maxlength="6"/></td>
				</tr>
				<tr>
					<td>작업자 주민등록번호</td>
					<td><input type="text" name="workerRRN01" id="workerRRN01" maxlength="6"/> -
		 			<input type="text" name="workerRRN02" id="workerRRN02" maxlength="7"/>
		 			<input type="hidden" id="workerRRN" name="workerRRN"/></td>
				</tr>
				<tr>
					<td>작업자 핸드폰번호</td>
					<td>
		 				<input type="text" name="workerCell01" id="workerCell01" maxlength="3"/> -
		 				<input type="text" name="workerCell02" id="workerCell02" maxlength="4"/> -
		 				<input type="text" name="workerCell03" id="workerCell03" maxlength="4"/>
		 				<input type="hidden" name="workerCell" id="workerCell"/>
		 			</td>
				</tr>
				<tr>
					<td>작업자 전화번호</td>
					<td>
		 				<input type="text" name="workerPhone01" id="workerPhone01" maxlength="3"/> -
		 				<input type="text" name="workerPhone02" id="workerPhone02" maxlength="4"/> -
		 				<input type="text" name="workerPhone03" id="workerPhone03" maxlength="4"/>
		 				<input type="hidden" name="workerPhone" id="workerPhone"/>
		 			</td>
				</tr>
				<tr>
					<td>작업자 주소</td>
					<td><input type="text" name="workerAdd01" id="workerAdd01"/></td>
				</tr>
				<tr>
					<td>작업자 상세주소</td>
					<td><input type="text" name="workerAdd02" id="workerAdd02"/></td>
				</tr>
				<tr>
					<td>작업자 비밀번호 (최대 10자리)</td>
					<td><input type="text" name="workerPW" id="workerPW" maxlength="10"/></td>
				</tr>
				<tr>
					<td>작업자 비밀번호 확인</td>
					<td><input type="text" name="workerPWCheck" id="workerPWCheck" maxlength="10"/></td>
				</tr>
			</table>
			<input type="submit" value="확인"/>
			<input type="button" value="초기화" onClick="allClear()"/>
			<input type="button" value="뒤로" onClick="location.href='RegiForIndividual.jsp'"/>
		</form>
	</div>
</body>
</html>