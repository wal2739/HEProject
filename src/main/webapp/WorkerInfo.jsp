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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/main.js" ></script>
<link rel="stylesheet" href="/css/main.css?ver=15">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
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
		var workerAdd02 = document.getElementById("workerAdd02").value;
		var workerPW = document.getElementById("workerPW").value;
		var workerPWCheck = document.getElementById("workerPWCheck").value;
		var sido1 = document.getElementById("sido1").value;
		var gugun1 = document.getElementById("gugun1").value;
		
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
	    
	    if(sido1==""||gugun1=="") {
	        alert("주소를 입력해 주세요");
	        document.getElementById("sido1").focus();
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
		document.getElementById("workerAdd01").value = sido1 + "/" + gugun1;

	
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
<script>
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

    $("select[name^=sido]").change(function() {
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


    });
</script>
<style>
.mainDiv{
  width: 100%;
  height: 100%;
}

.div1{
  border-bottom: 0.5px solid #d7d7d7;
  height: 70px;
  width: 100%;
  display: inline-block;
}
.div1_textArea{
  padding-left: 100px;
  padding-top: 10px;
  margin-left: 10%;
}
.div2{
  display: inline-block;
  width: 100%;
  height: 700px;  
}
.div2_1 {
  width: 80%;
  height: 30%;
  overflow: hidden;
  margin : 0 auto 0 auto;
}
.div2_1_1 {
  width: 100%;
  height: 50px;  
}
#div2_1_1_h2 {
  display: inline-block;
  margin : 10px;
}
.div2_1_2 {
  width: 100%;
  height: calc(100% - 50px);
}
#inputTB {
  width: 100%;
  height: 80%;
	border: 0.5px solid #d7d7d7;
}
#inputTB td,#inputTB th{
  padding: 0 5% 0 5%;
}
#inputTB th {
	background: #f7f7f5;
	border: 0.5px solid #d7d7d7;
  width: 200px;
}

#inputTB td{
  width: 300px;
	align: center;
	border: 0.5px solid #d7d7d7;
}
.div2_2 {
  width: 80%;
  height: 70%;
  overflow-y: auto;
  overflow-x: hidden;
  margin : 0 auto 0 auto;
  border-top: 0.5px solid black;
}
.div2_2_1 {
  width: 100%;
  height: 100%;
}
.div2_2_2 {
  width: 100%;
  height: calc(100% - 50px);
  padding-left: 3px;
  padding-top: 5px;
  
}

.div3{
  display: inline-block;
  width: 100%;
  height: 200px;

}

#workerInfoTB {
  width: 100%;
  height : calc(100%-5px);
  	border: 0.5px solid #d7d7d7;
  	background: white;
  	
  
}

#workerInfoTB th,#workerInfoTB td {
  display: inline-block;
  height: 30px;
  width: calc(100%/10.27);
  font-size: 12.5px;
  text-align: center;
  
}

#workerInfoTB td {
	align: center;
	border: 0.5px solid #d7d7d7;
}

#workerInfoTB th {
	background: #f7f7f5;
	border: 0.5px solid #d7d7d7;
}
.btn {
	width: 120px;
	height: 30px;
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
  margin-left: 10px;
  margin-top: 3px;
}

.btn:hover {
	background-color: #2EE59D;
	box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	color: #fff;
	transform: translateY(-7px);
}

.btnDiv {
	display: flex;
	align-items: center;
	justify-content: center;
}

p {
	color: red;
	font-size: 7px;
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
<body onload="deleteCheck();workerCheck();">
	<input type="hidden" id="workerCode" readonly="readonly"/>
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
    <div class="mainDiv">
      <div class="div1">
        <div class="div1_textArea"><h2>대리 작업자 등록/삭제</h2></div>
      </div>
      <div class="div2">
        <div class="div2_1">
          <div class="div2_1_1">
            <h2 id="div2_1_1_h2">대리작업자 등록</h2>
          </div>
          <div class="div2_1_2">
          <form action="newWorker.do" name="forms" id="forms" onsubmit="return validate();">
            <table id="inputTB">
              <tr>
                <th>비밀번호</th>
                <td><input type="text" name="workerPW" id="workerPW" maxlength="10"/></td>
                <th>비밀번호 확인</th>
                <td><input type="text" name="workerPWCheck" id="workerPWCheck" maxlength="10"/></td>
              </tr>
              <tr>
                <th>작업자 성명</th>
                <td><input type="text" name="workerName" id="workerName" maxlength="6"/></td>
                <th>주민등록번호</th>
                <td>
                	<input type="text" name="workerRRN01" id="workerRRN01" maxlength="6" style="width: 70px;"/> -
		 			<input type="text" name="workerRRN02" id="workerRRN02" maxlength="7" style="width: 70px;"/>
		 			<input type="hidden" id="workerRRN" name="workerRRN"/>
		 		</td>
              </tr>
              <tr>
                <th>전화번호</th>
                <td>
		 			<input type="text" name="workerPhone01" id="workerPhone01" maxlength="3" style="width: 30px;"/> -
		 			<input type="text" name="workerPhone02" id="workerPhone02" maxlength="4" style="width: 50px;"/> -
		 			<input type="text" name="workerPhone03" id="workerPhone03" maxlength="4" style="width: 50px;"/>
		 			<input type="hidden" name="workerPhone" id="workerPhone"/>
		 		</td>
                <th>핸드폰번호</th>
                <td>
		 			<input type="text" name="workerCell01" id="workerCell01" maxlength="3" style="width: 30px;"/> -
		 			<input type="text" name="workerCell02" id="workerCell02" maxlength="4" style="width: 50px;"/> -
		 			<input type="text" name="workerCell03" id="workerCell03" maxlength="4" style="width: 50px;"/>
		 			<input type="hidden" name="workerCell" id="workerCell"/>
		 		</td>
              </tr>
              <tr>
                <th>주소</th>
                <td>
                <input type="hidden" name="workerAdd01" id="workerAdd01"/>
                <select name="sido1" id="sido1"></select>
                <select name="gugun1" id="gugun1"></select>
                </td>
                <th>상세 주소</th>
                <td><input type="text" name="workerAdd02" id="workerAdd02"/></td>
              </tr>
            </table>
            <div class="btnDiv">
              <input type="submit" class="btn" value="등록" />
              <input type="button" class="btn" value="초기화" onClick="allClear()"/>
            </div>
            </form>
          </div>
          
        </div>
        <div class="div2_2">
          <div class="div2_2_1">
            <table id="workerInfoTB">
              <tr>
                <th></th>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>작업자 성명</th>
                <th>주민등록번호</th>
                <th>전화번호</th>
                <th>핸드폰번호</th>
                <th>주소</th>
                <th>상세 주소</th>
                <th></th>
              </tr>
              <%if(vo==null){}else{for(int i = 0 ; i < vo.size(); i++){ %>
              <tr>
                <th><b><%=i+1 %></b></th>
                <td><%=vo.get(i).getWorkerCode() %></td>
                <td><%=vo.get(i).getWorkerPW() %></td>
                <td><%=vo.get(i).getWorkerName() %></td>
                <td><%=vo.get(i).getWorkerRRN() %></td>
                <td><%=vo.get(i).getWorkerPhone() %></td>
                <td><%=vo.get(i).getWorkerCell() %></td>
                <td><%=vo.get(i).getWorkerAdd01() %></td>
                <td><%=vo.get(i).getWorkerAdd02() %></td>
                <td><a href="deleteWorker.do?workerCode=<%=vo.get(i).getWorkerCode() %>">삭제</a></td>
              </tr>
              <%}} %>
            </table>
            <p>※ 아이디는 자동 생성됩니다.</p>
            <p>※ 생성된 대리 작업자 정보는 수정이 불가능 합니다. 삭제 후 재등록 해주세요.</p>
          </div>
          
        </div>
      </div>
      <div class="div3">
      </div>
    </div>
  </main>

</body>
</html>