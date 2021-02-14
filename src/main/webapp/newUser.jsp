<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript">
/* 영문과 숫자만 입력 가능 */
/* function checkNoKr(e) {
 var objTarget = e.srcElement || e.target;
 if(objTarget.type == 'text') {
  var value = objTarget.value;
  if(/[ㄱ-ㅎㅏ-ㅡ가-핳]/.test(value)) {
   alert('한글은 사용하실 수 없읍니다.');
   
   objTarget.value = objTarget.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,""); 
  }
 }
}
function noText(){
	var values = document.form;
	if(values.userId.value==""){
		alert('아이디를 입력해주세요');
		document.getElementById(userId).focus();
	}else{
		
	}
} */


function idcheck01() {
	var re = /^[a-zA-Z0-9]{4,12}$/; 
	var id = document.getElementById("userId").value;
	if(id!=""&&re.test(id)){
		window.name="parentForm";
		window.open("IdCheck.jsp","chkForm","width=500,height=300,resizable=no,scrollbars=no");
	}else if(id==""){
		alert('아이디를 입력 하신 후 중복확인을 눌러주십시오.')
		return false;
	}else if(!re.test(id)){
		alert('아이디는 4~12자의 영문 대소문자와 숫자로만 입력');
		return false;
	}
}
function inputidcheck() {
	document.getElementById("idcheck").value = 0;
}
function validate() {
	var re = /^[a-zA-Z0-9]{4,12}$/; // 아이디와 패스워드가 적합한지 검사할 정규식
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일이 적합한지 검사할 정규식
	
	var id = document.getElementById("userId").value;
	var pw = document.getElementById("userPW").value;
	var pwcheck = document.getElementById("userPWCheck").value;
	var name = document.getElementById("userName").value;
	var cell = document.getElementById("userCell01").value + "-" + document.getElementById("userCell02").value + "-" + document.getElementById("userCell03").value;
	var add01 = document.getElementById("userAdd01").value;
	var add02 = document.getElementById("userAdd02").value;
	var email = document.getElementById("userEmail").value;
	var idcheck = document.getElementById("idcheck").value;
	console.log(cell);
	
	if(!re.test(id)){
		alert('아이디는 4~12자의 영문 대소문자와 숫자로만 입력');
		console.log('아이디 오류');
		return false;
	}
	
	if(idcheck!=1){
		alert("아이디 중복확인을 해주세요.")	
		return false;
	}//안됨
	
	if(!re.test(pw)){
		alert('패스워드는 4~12자의 영문 대소문자와 숫자로만 입력');
		console.log('비밀번호 오류');
		return false;
	}
    

    if(forms.userPW.value != forms.userPWCheck.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        forms.userPWCheck.value = "";
        forms.userPWCheck.focus();
		console.log('비밀번호 불일치 오류');
        return false;
    }//
    
    if(cell.value=="") {
        alert("전화번호를 입력해 주세요");
		console.log('핸드폰번호 오류');
        email.focus();
        return false;
    }
    
    if(add01.value=="") {
        alert("주소를 입력해 주세요");
		console.log('주소 오류');
        email.focus();
        return false;
    }
    if(email.value=="") {
        alert("이메일을 입력해 주세요");
		console.log('이메일 오류');
        email.focus();
        return false;
    }

    if(!re2.test(email)) {
    	alert("적합하지 않은 이메일 형식입니다.");
    	console.log('이메일 형식 오류');
        return false;
    }

    if(forms.userName.value=="") {
        alert("이름을 입력해 주세요");
        forms.userName.focus();
        return false;
    }
    if(forms.userClass[0].checked==false &&
    		forms.userClass[1].checked==false &&
    		forms.userClass[2].checked==false ) {
            alert("회원 구분을 골라주세요");
            return false;
    }if(forms.checkbox1[0].checked==false ||
    		forms.checkbox2[0].checked==false ||
    		forms.checkbox3[0].checked==false ) {
            alert("이용 약관을 모두 동의 하셔야 회원가입이 가능합니다");
            return false;
    }
    document.getElementById('userCell').value = cell;
    alert("회원가입이 완료되었습니다.");
}

</script>
<!-- <style>
   @import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
   body{font-family: 'Nanum Pen Script';}
</style> -->
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
<body>
	<form action="newUser.do" name="forms" id="forms" onsubmit="return validate();">
		<table>
			<tr>
				<td>아이디(영문, 숫자만 입력)</td>
				<td><input type="text" name="userId" id="userId" maxlength="12" onkeydown="inputidcheck()"/> <input type="button" value="중복체크" onclick="idcheck01()"/> <input type="hidden" value="0" id="idcheck" name="idcheck"/></td>
			</tr>
			<tr>
				<td>비밀번호(필수)</td>
				<td><input type="password" name="userPW" id="userPW"/></td>
			</tr>
			<tr>
				<td>비밀번호 확인(필수)</td>
				<td><input type="password" name="userPWCheck" id="userPWCheck"/></td>
			</tr>
			<tr>
				<td>이름(필수)</td>
				<td><input type="text" name="userName" id="userName"/></td>
			</tr>
			<tr>
				<td>휴대폰 번호(필수)</td>
				<td>
					<input type="text" name="userCell01" id="userCell01" maxlength="3"/>-
					<input type="text" name="userCell02" id="userCell02" maxlength="4"/>-
					<input type="text" name="userCell03" id="userCell03" maxlength="4"/>
					<input type="hidden" name="userCell" id="userCell" />
				</td>
			</tr>
			<tr>
				<td>주소(필수)</td>
				<td><input type="text" name="userAdd01" id="userAdd01"/></td>
			</tr>
			<tr>
				<td>상세 주소(생략 가능)</td>
				<td><input type="text" name="userAdd02" id="userAdd02"/></td>
			</tr>
			<tr>
				<td>이메일(필수)</td>
				<td><input type="text" name="userEmail" id="userEmail"/></td>
			</tr>
			<tr>
				<td>회원 구분(필수)</td>
				<td>
					사업자<input type="radio" value=1 name="userClass" id="userClass"/>
					중계/협회<input type="radio" value=2 name="userClass" id="userClass"/>
					통합<input type="radio" value=3 name="userClass" id="userClass"/>
				</td>
			</tr>

			<tr>
				<td>약관 동의 1(필수 동의) <br /></td>
				<td>
					동의함<input type="radio" value=1 name="checkbox1" id="checkbox1"/>
					동의하지않음<input type="radio" value=0 name="checkbox1" id="checkbox1"/>
				</td>
			</tr>
			<tr>
				<td>약관 동의 2(필수 동의) <br /></td>
				<td>
					동의함<input type="radio" value=1 name="checkbox2" id="checkbox2"/>
					동의하지않음<input type="radio" value=0 name="checkbox2" id="checkbox2"/>
				</td>
			</tr>
			<tr>
				<td>약관 동의 3(필수 동의) <br /></td>
				<td>
					동의함<input type="radio" value=1 name="checkbox3" id="checkbox3"/>
					동의하지않음<input type="radio" value=0 name="checkbox3" id="checkbox3"/>
				</td>
			</tr>
		</table>
		<input type="submit" value="회원가입" />
		<input type="button" value="로그인창으로" onClick="location.href='login.jsp'"/>
	</form>
		
</body>


</html>