<%@page import="com.HEProject.he.usersInfo.UsersInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
    <%
	    
		UsersInfoVO vo = (UsersInfoVO)request.getAttribute("userInfo");
    	try{
    		vo.getUserName();
    	}catch(NullPointerException e){
    		vo = new UsersInfoVO();
    		vo.setUserName("1");
    		vo.setUserCell("1-1-1");
    		vo.setUserAdd01("1");
    		vo.setUserAdd02("1");
    		vo.setUserEmail("1");
    		System.out.println("사업자 정보 등록 널 에러 : " + e);
    	}
    	String[] userCellArr = vo.getUserCell().split("-");
    	String userCell01 = userCellArr[0];
    	String loginCheckData="";
		try{
			loginCheckData= (String)session.getAttribute("userId");
		}catch(NullPointerException e){
			System.err.println("비회원 아이디 에러 : "+e);
		}
		
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 정보 등록</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/main.js" ></script>
<link rel="stylesheet" href="/css/main.css?ver=15">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
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
	
	var boMail01 = document.getElementById("boMail01").value;//
	var boMail02 = document.getElementById("boMail02").value;//
	var boAdd02 = document.getElementById("boAdd02").value;
	var boAcc = document.getElementById("boAcc").value;
	var boAccBack = document.getElementById("boAccBack").value;
	var tob01 = document.getElementById("tob01").value;
	var tob02 = document.getElementById("tob02").value;
	var cpName = document.getElementById("cpName").value;
	var sido1 = document.getElementById("sido1").value;
	var gugun1 = document.getElementById("gugun1").value;
	
	
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
    
    if(boMail01=="") {
        alert("이메일을 입력해 주세요");
        document.getElementById("boMail01").focus();
        return false;
    }

    if(boMail02=="") {
        alert("이메일을 입력해 주세요");
        document.getElementById("boMail02").focus();
        return false;
    }
    
    
    if(sido1==""||gugun1=="") {
        alert("주소를 입력해 주세요");
        document.getElementById("sido1").focus();
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
    
    document.getElementById("boRrn").value = boRrn;
	document.getElementById("boCell").value = boCell;
	document.getElementById("boPhone").value = boPhone;
	document.getElementById("boMail").value = boMail01 + "@" + boMail02;
	document.getElementById("boAdd01").value = sido1 + "/" + gugun1;
	
}


	/* function licenseNum(){
		var regNumber = document.getElementById("boNumber").value;
	    regNumber.replace(/([0-9]{3})(0-9{2})([0-9]{5})/,"$1-$2-$3"); 
	    } */
	    
	function checkBoxOn() {
	    	if(document.getElementById("sameInfo").value=='no'){
	    		document.getElementById("boName").value = document.getElementById("userName").value;
	    		<%-- console.log(<%=userCellArr[0]%>);
	    		console.log(<%=userCellArr[1]%>);
	    		console.log(<%=userCellArr[2]%>); --%>

	        	document.getElementById("boCell01").value = '010'; //현재 010이 8로 변환되는 버그가 있음 추후에 수정
	        	document.getElementById("boCell02").value = <%=userCellArr[1]%>;
	        	document.getElementById("boCell03").value = <%=userCellArr[2]%>;
	        	document.getElementById("boMail").value = document.getElementById("userEmail").value;
	        	document.getElementById("boAdd01").value = document.getElementById("userAdd01").value;
	        	document.getElementById("boAdd02").value = document.getElementById("userAdd02").value;
	        	document.getElementById("sameInfo").value = 'yes';
	    	}else{
	    		document.getElementById("boName").value = "";
	    		document.getElementById("boCell01").value = "";
	        	document.getElementById("boCell02").value = "";
	        	document.getElementById("boCell03").value = "";
	        	document.getElementById("boMail").value = "";
	        	document.getElementById("boAdd01").value = "";
	        	document.getElementById("boAdd02").value = "";
	        	document.getElementById("sameInfo").value = 'no';
	    	}
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

	function boCheck() {
		var loginCheckData = '<%=loginCheckData%>';
		loginCheck(loginCheckData);
		
		var boCheck = <%=request.getAttribute("boCheck")%>
		console.log(boCheck);
		if(boCheck==null){}
		if(boCheck==0){
			alert('정상적으로 사업자 번호가 등록되지 않았습니다. 다시 작성해주세요.');
		}
		if(boCheck==1){
			alert('사업자 등록이 정상적으로 처리 되었습니다.');
			return location.href="showBO.do";
		}
		if(boCheck==2){
			alert('이미 등록된 사업자 번호입니다.');
		}
	}
	
	function mailAddCG() {
		var mailAddSelect = document.getElementById('mailAdd');
		var mailAddvalue = mailAddSelect.options[mailAddSelect.selectedIndex].value;
		if(mailAddvalue==1){
			document.getElementById('boMail02').value = '';
			document.getElementById('boMail02').removeAttribute('readonly',''); 
		}else {
			document.getElementById('boMail02').setAttribute('readonly','readonly'); 
			document.getElementById('boMail02').value = mailAddSelect.value;
		}
	}


</script>
<script type="text/javascript">
	// 시/도 jQuery
	// 인터넷에서 가져옴
	$('document').ready(function() {
      var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
        var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
        var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
        var area3 = ["대덕구","동구","서구","유성구","중구"];
        var area4 = ["광산구","남구","동구",     "북구","서구"];
        var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
        var area6 = ["남구","동구","북구","중구","울주군"];
        var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
        var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
        var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
        var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
        var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
        var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
        var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
        var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
        var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
        var area16 = ["서귀포시","제주시","남제주군","북제주군"];

      

      // 시/도 선택 박스 초기화

      $("select[name^=sido]").each(function() {
        $selsido = $(this);
        $.each(eval(area0), function() {
        $selsido.append("<option value='"+this+"'>"+this+"</option>");
        });
        $selsido.next().append("<option value=''>구/군 선택</option>");
      });

      

      // 시/도 선택시 구/군 설정

      $("select[name^=sido]").change(function test() {
        var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
        var $gugun = $(this).next(); // 선택영역 군구 객체
        $("option",$gugun).remove(); // 구군 초기화

        if(area == "area0")
        $gugun.append("<option value=''>구/군 선택</option>");
        else {
        $.each(eval(area), function() {
          $gugun.append("<option value='"+this+"'>"+this+"</option>");
        });
        }
      });
		
      //이하 직접 작성
		
      });
	
	function boName_BoAccName() {
		var boNameVal = document.getElementById('boName').value;
		document.getElementById('boAccName').value = boNameVal;
	}
</script>

<style>
.mainDiv {
	width: 100%;
	height: 100%;
}

.div1 {
	/*   background-color : #fff0f9;
 */
	border-bottom: 0.5px solid #d7d7d7;
	height: 70px;
	width: 100%;
	display: inline-block;
}

.div1_textArea {
	padding-left: 100px;
	padding-top: 10px;
	margin-left: 10%;
}

.div2 {
	display: inline-block;
	width: 100%;
	height: 900px;
}

.div2_1 {
	width: 80%;
	height: 100%;
	overflow: hidden;
	margin-left: 12%;
}

.div2_1_1 {
	height: 800px;
	width: 100%;
	padding: 20px;
	overflow: hidden;
	display: inline-block;
	text-align: center;
}

table {
	margin: 20px;
	margin-bottom: 10px;
	width: 85%;
	display: inline-block;
	text-align: left;
}

th {
	background: #f7f7f5;
	text-align: center;
	border-bottom: 0.5px solid #d7d7d7;
	border-right: 0.1px solid #d7d7d7;
	width: calc(( 100% * 0.85)*0.13);
}

td {
	border-bottom: 0.5px solid #d7d7d7;
	padding: 10px;
	padding-left: 15px;
	width: 55%
}

caption {
	text-align: left;
	margin-bottom: 10px;
	font-size: 30px;
	font-weight: 1000;
}

select {
	width: 100px;
	text-align: center;
	text-align-last: center;
	display: inline-block;
}

.tableInfo_div {
	float: left;
	text-align: left;
	margin-left: 10%;
}

.tableInfo_p {
	color: red;
	font-size: 12px;
	font-weight: 800;
}

.div3 {
	display: inline-block;
	width: 100%;
	height: 200px;
	background-color: #faf3f3;
}

.btn {
	width: 140px;
	height: 45px;
	font-family: 'Roboto', sans-serif;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: #000;
	background-color: #fff;
	border: none;
	border-radius: 45px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
}

.btn:hover {
	background-color: #2EE59D;
	box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	color: #fff;
	transform: translateY(-7px);
}

input {
	width: 50px;
}

.mail_tr input {
	width: 100px;
}

.address02_text input {
	width: 200px;
}

#boAcc {
	width: 200px;
}

table p {
	color: red;
	font-size: 12px;
	font-weight: 800;
}
</style>
<%
	Object userClassData = session.getAttribute("userClass");
	String menuInfo[] = new String[4];
	String dropMenuInfo[] = new String[16];
	String dropMenuLink[] = new String[16];
	try {
		menuInfo[1] = "작업";
		menuInfo[2] = "정산";
		menuInfo[3] = "기타";
		if (userClassData.equals(0)) {
		} else if (userClassData.equals(1)) {
			menuInfo[0] = "등록";
			dropMenuInfo[0] = "사업자 정보";
			dropMenuInfo[1] = "대리 작업자";
			dropMenuInfo[2] = "차량 정보";
			dropMenuInfo[3] = "그룹 정보";
			dropMenuInfo[4] = "작업 목록";
			dropMenuInfo[5] = "증빙 자료";
			dropMenuInfo[6] = "작업 조회";
			dropMenuInfo[7] = "현황/그래프";
			dropMenuInfo[8] = "정산 조회";
			dropMenuInfo[9] = "자료 조회";
			dropMenuInfo[10] = "재발송";
			dropMenuInfo[11] = "#";
			dropMenuInfo[12] = "그룹 공지";
			dropMenuInfo[13] = "개인 사용자 전용";
			dropMenuInfo[14] = "자유 게시판";
			dropMenuInfo[15] = "공지 사항";
			//////////
			dropMenuLink[0] = "showBO.do";
			dropMenuLink[1] = "WorkerInfo.do";
			dropMenuLink[2] = "showVehicleInfo.do";
			dropMenuLink[3] = "showMyGroup.do";
			dropMenuLink[4] = "workInfoForIndi.do?uClass=indiUsrn";
			dropMenuLink[5] = "workData.do";
			dropMenuLink[6] = "#";
			dropMenuLink[7] = "#";
			dropMenuLink[8] = "#";
			dropMenuLink[9] = "#";
			dropMenuLink[10] = "#";
			dropMenuLink[11] = "#";
			dropMenuLink[12] = "#";
			dropMenuLink[13] = "eachBoard.do?boardClassNum=1";
			dropMenuLink[14] = "eachBoard.do?boardClassNum=0";
			dropMenuLink[15] = "eachBoard.do?boardClassNum=3";
		} else if (userClassData.equals(2)) {
			menuInfo[0] = "설정";
			dropMenuInfo[0] = "사업자 정보";
			dropMenuInfo[1] = "회원 관리";
			dropMenuInfo[2] = "거래처 관리";
			dropMenuInfo[3] = "#";
			dropMenuInfo[4] = "작업 관리";
			dropMenuInfo[5] = "작업 발주";
			dropMenuInfo[6] = "발주 현황";
			dropMenuInfo[7] = "완료 작업";
			dropMenuInfo[8] = "정산 처리/통보";
			dropMenuInfo[9] = "자료 조회";
			dropMenuInfo[10] = "자료 요청";
			dropMenuInfo[11] = "#";
			dropMenuInfo[12] = "그룹 공지";
			dropMenuInfo[13] = "중계 사용자 전용";
			dropMenuInfo[14] = "자유 게시판";
			dropMenuInfo[15] = "공지 사항";
			//////////
			dropMenuLink[0] = "showBO.do";
			dropMenuLink[1] = "showGrouper.do";
			dropMenuLink[2] = "showClient.do";
			dropMenuLink[3] = "#";
			dropMenuLink[4] = "workInfo.do";
			dropMenuLink[5] = "workOrderInfo.do";
			dropMenuLink[6] = "#";
			dropMenuLink[7] = "#";
			dropMenuLink[8] = "#";
			dropMenuLink[9] = "#";
			dropMenuLink[10] = "#";
			dropMenuLink[11] = "#";
			dropMenuLink[12] = "#";
			dropMenuLink[13] = "eachBoard.do?boardClassNum=2";
			dropMenuLink[14] = "eachBoard.do?boardClassNum=0";
			dropMenuLink[15] = "eachBoard.do?boardClassNum=3";
		} else if (userClassData.equals(3)) {

		}
	} catch (NullPointerException e) {
		userClassData = "0";
		System.err.println("비회원 아이디 에러 : " + e);
	}
%>
<body onload="boCheck();">
	<nav class="nav-area">
			<ul>
				<li><a href="main.do">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#"><%=menuInfo[0]%></a>
					<ul>
						<li><a href="<%=dropMenuLink[0]%>"><%=dropMenuInfo[0]%></a></li>
						<li><a href="<%=dropMenuLink[1]%>"><%=dropMenuInfo[1]%></a></li>
						<li><a href="<%=dropMenuLink[2]%>"><%=dropMenuInfo[2]%></a></li>
						<li><a href="<%=dropMenuLink[3]%>"><%=dropMenuInfo[3]%></a></li>
	
					</ul></li>
				<li><a href="#"><%=menuInfo[1]%></a>
					<ul>
						<li><a href="<%=dropMenuLink[4]%>"><%=dropMenuInfo[4]%></a></li>
						<li><a href="<%=dropMenuLink[5]%>"><%=dropMenuInfo[5]%></a></li>
						<li><a href="<%=dropMenuLink[6]%>"><%=dropMenuInfo[6]%></a></li>
						<li><a href="<%=dropMenuLink[7]%>"><%=dropMenuInfo[7]%></a></li>
	
					</ul></li>
				<li><a href="#"><%=menuInfo[2]%></a>
					<ul>
						<li><a href="<%=dropMenuLink[8]%>"><%=dropMenuInfo[8]%></a></li>
						<li><a href="<%=dropMenuLink[9]%>"><%=dropMenuInfo[9]%></a></li>
						<li><a href="<%=dropMenuLink[10]%>"><%=dropMenuInfo[10]%></a></li>
						<li><a href="<%=dropMenuLink[11]%>"><%=dropMenuInfo[11]%></a></li>
	
					</ul></li>
				<li><a href="#"><%=menuInfo[3]%></a>
					<ul>
						<li><a href="<%=dropMenuLink[12]%>"><%=dropMenuInfo[12]%></a></li>
						<li><a href="<%=dropMenuLink[13]%>"><%=dropMenuInfo[13]%></a></li>
						<li><a href="<%=dropMenuLink[14]%>"><%=dropMenuInfo[14]%></a></li>
						<li><a href="<%=dropMenuLink[15]%>"><%=dropMenuInfo[15]%></a></li>
	
					</ul></li>
				<li><a href="logOut.do">로그아웃</a></li>
				<li><a href="checkIdentity.jsp">내정보</a></li>
			</ul>
		</nav>
	<main>
	<form action="createBO.do" name="forms" id="forms" onsubmit="return validate();">    	
    	<div class="mainDiv">
      <div class="div1">
        <div class="div1_textArea"><h2>사업자 정보 수정</h2></div>
      </div>
      <div class="div2">
        <div class="div2_1">
          <div class="div2_1_1">
            <table id="table01" name="table01" class="table01">
              <caption>사업자 정보</caption>
              <tr>
                <th>사업자 번호*</th>
                <td colspan="3">
                  <input type="text" name="boNumber01" id="boNumber01" maxlength="3"/><b>&nbsp;&nbsp;-&nbsp;&nbsp;</b>
                  <input type="text" name="boNumber02" id="boNumber02" maxlength="2"/><b>&nbsp;&nbsp;-&nbsp;&nbsp;</b>
                  <input type="text" name="boNumber03" id="boNumber03" maxlength="5"/>
                </td>
                

              </tr>
              <tr>
                <th>업체명</th>
                <td colspan="1"><input type="text" name="cpName" id="cpName" maxlength="15"/></td>
                <th>사업자명*</th>
                <td><input type="text" name="boName" id="boName" onkeyup="boName_BoAccName();"/></td>
              </tr>
              <tr>
                <th>업종*</th>
                <td><input type="text" name="tob01" id="tob01" maxlength="10"/></td>
                <th>업태*</th>
                <td><input type="text" name="tob02" id="tob02" maxlength="10"/></td>
                
              </tr>
              <tr>
                <th>주민등록번호*</th>
                <td colspan="3">
                  <input type="text" name="boRrn01" id="boRrn01" maxlength="6"/><b>&nbsp;&nbsp;-&nbsp;&nbsp;</b>
                  <input type="password" name="boRrn02" id="boRrn02" maxlength="7"/>
                  <input type="hidden" id="boRrn" name="boRrn"/>
                </td>
              </tr>
              <tr>
                <th>전화번호*</th>
                <td>
			    	<input type="text" maxlength="3" name="boPhone01" id="boPhone01"/>-
	                <input type="text" maxlength="4" name="boPhone02" id="boPhone02"/>-
	                <input type="text"maxlength="4" name="boPhone03" id="boPhone03"/>
	                <input type="hidden" name="boPhone" id="boPhone"/>
			    </td>
			    
                <th>핸드폰번호*</th>
                <td colspan="2">
	                <input type="text" maxlength="3" name="boCell01"id="boCell01"/>-
	                <input type="text" maxlength="4" name="boCell02"id="boCell02"/>-
	                <input type="text" maxlength="4" name="boCell03"id="boCell03"/>
	                <input type="hidden" name="boCell" id="boCell"/>
	             </td>
              </tr>
              
              <tr class="mail_tr">
                <th>이메일</th>
                <td colspan="3">
                  <input type="hidden" name="boMail" id="boMail" />
                  <input type="text" name="boMail01" id="boMail01"><b>&nbsp;@&nbsp;</b>
                  <input type="text" name="boMail02" id="boMail02" readonly="readonly">
                  <select name="mailAdd" id="mailAdd" onchange="mailAddCG();" >
                    <option value="1" selected>직접입력</option>
                    <option value="naver.com">naver.com</option>
                    <option value="hanmail.net">hanmail.net</option>
                    <option value="hotmail.com">hotmail.com</option>
                    <option value="nate.com">nate.com</option>
                    <option value="yahoo.co.kr">yahoo.co.kr</option>
                    <option value="empas.com">empas.com</option>
                    <option value="dreamwiz.com">dreamwiz.com</option>
                    <option value="freechal.com">freechal.com</option>
                    <option value="lycos.co.kr">lycos.co.kr</option>
                    <option value="korea.com">korea.com</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="hanmir.com">hanmir.com</option>
                    <option value="paran.com">paran.com</option>

                  </select>
                </td>
              </tr>
              <tr>		
                <th>주소*</th>
                <td colspan="3">
                  <input type="hidden" name="boAdd01" id="boAdd01"/>
                  <select name="sido1" id="sido1">

                  </select>
                  <select name="gugun1" id="gugun1">

                  </select>
                </td>
              </tr>
              <tr class="address02_text">
                <th>상세주소</th>
                <td colspan="3">
                	<input type="text" name="boAdd02" id="boAdd02"/>
                </td>
              </tr>
              <tr>
                <th>계좌은행*</th>
                <td colspan="3">
                  <select name="boAccBack" id="boAccBack">
                   <option value="#" selected disabled hidden>==선택하세요==</option>
                   <option value="국민은행">KB국민은행</option>
                   <option value="우리은행">우리은행</option>
                   <option value="신한은행">신한은행</option>
                   <option value="하나은행">KEB하나은행</option>
                   <option value="제일은행">SC제일은행</option>
                   <option value="한국씨티은행">한국씨티은행</option>
                   <option value="케이뱅크">케이뱅크</option>
                   <option value="카카오뱅크">카카오뱅크</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>계좌번호*</th>
                <td colspan="3">
                	<input type="text"  name="boAcc" id="boAcc" placeholder="- 빼고 작성" width="200px"/>&nbsp;&nbsp;예금주 : &nbsp;
                	<input type="text" readonly="readonly" id="boAccName"">
                	<p>※ 예금주명은 사업자명과 동일하게 입력되며, 변경이 불가능합니다. 만약 사업자명과 예금주가 다를경우 문의게시판에 문의 부탁드립니다.</p>
                </td>
              </tr>
              
             
            </table>
            <div class="tableInfo_div">
              <p class="tableInfo_p">※ 허위 정보 기재시 제재의 대상이 될 수 있습니다.</p>
              <p class="tableInfo_p">※ * 표시된 입력란은 필수 입력입니다.</p>
              <p class="tableInfo_p">※ 계좌번호는 "-" 제외하고 입력</p>
              <p class="tableInfo_p">※ 상세 주소에는 건물 동/호수 까지 입력</p>
            </div>
            <div class="btnDiv">
				<input type="submit" class="btn" value="등록하기" />
			</div>
          </div>
        </div>
      </div>
    </form>
    </div>
      <div class="div3">
        <p>하단 내용</p>
      </div>
    
  </main>
</body>
</html>