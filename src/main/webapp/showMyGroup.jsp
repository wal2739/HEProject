<%@page import="com.HEProject.he.boInfo.BOInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<BOInfoVO> nowAsslist = (List)request.getAttribute("nowAsslist"); %>
    <%List<BOInfoVO> newAsslist = (List)request.getAttribute("newAsslist"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 중계/협회 목록</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/main.js" ></script>
<link rel="stylesheet" href="/css/main.css?ver=15">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
<script type="text/javascript">
function messageCheck() {
	window.open("messageCheck.do?wMsg=1","EquipType","width=1000,height=600,resizable=no,scrollbars=yes");
}
function loadon() {
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
	
	var resultNum = <%=request.getAttribute("resultNum")%>;
	var checkNum = <%=request.getAttribute("delCheckNum")%>;
	if(resultNum==null&&checkNum==null){
		
	}else {
		if(resultNum==1){
			alert('그룹 신청이 정상적으로 처리되었습니다.');
		}else if(resultNum==0){
			alert('그룹 신청이 정상적으로 처리되지 않았습니다. 다시 시도 해주세요');
		}else if(checkNum==0){
			alert('정상적으로 처리되지 않았습니다.');
		}else if(checkNum==1){
			alert('정상적으로 처리 되었습니다.');
		}else{
			alert('정상적인 요청이 아닙니다.');
		}
		location.href='showMyGroup.do';
	}
	
	
	if(checkNum==2){
		alert('정상적인 요청이 아닙니다.');
	}
	
}
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
  height: 800px;  
}
.div2_1 {
  width: 80%;
  height: 40%;
  overflow: auto;
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
  overflow: auto;
}

.inpuTBDiv {
	width: 100%;
	height: calc(100%-30px);
}
#inputTB {
  width: 100%;
  border: 0.5px solid #d7d7d7;
	font-size: 15px;
	text-align: center;
	background: white;
	
}

#inputTB th {
	background: #f7f7f5;
	border: 0.5px solid #d7d7d7;
  width: 200px;
}

#inputTB td{
  width: 300px;
	border: 0.5px solid #d7d7d7;
}
.div2_2 {
  width: 80%;
  height: 60%;
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
  width: calc(100%/7.137);
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
	border: 0.5px solid black;
	border-radius: 45px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
  margin-left: 10px;
  margin-top: 15px;
}

.btn:hover {
	background-color: #2EE59D;
	box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	color: #fff;
	transform: translateY(-7px);
}

.btnDiv_01 {
	display: flex;
	align-items: center;
	justify-content: center;
	position: absolute;
	top: 35%;
	left: 45%;
}

.btnDiv_02 {
	display: flex;
	align-items: center;
	justify-content: center;
	position: absolute;
	left : 45%;
	top : 90%;
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
<body onload="loadon();">
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
        <div class="div1_textArea"><h2>그룹 등록 및 삭제</h2></div>
      </div>
      <div class="div2">
        <div class="div2_1">
          <div class="div2_1_1">
            <h2 id="div2_1_1_h2">그룹 목록 및 등록</h2>
          </div>
          <div class="div2_1_2">
          <form action="newAci.do" name="forms" id="forms">
            	<table id="inputTB">
		            <tr>
		            	<th></th>
			 			<th>업체명</th>
			 			<th>사업자번호</th>
			 			<th>대표자명</th>
			 			<th>대표 번호</th>
			 			<th>핸드폰번호</th>
			 			<th>이메일</th>
			 		</tr>
					<%if(newAsslist.size()==0){%>
				    <% }else{%>
					<%for(int i = 0 ; i < newAsslist.size(); i++){ %>				
					<tr>
						<td><input type="checkbox" value="<%=newAsslist.get(i).getUsRn() %>" name="chkUsRn" id="chkUsRn"/></td>
						<td><%=newAsslist.get(i).getCpName() %></td>
						<td><%=newAsslist.get(i).getBoNumber() %></td>
						<td><%=newAsslist.get(i).getBoName() %></td>
						<td><%=newAsslist.get(i).getBoPhone() %></td>
						<td><%=newAsslist.get(i).getBoCell() %></td>
						<td><%=newAsslist.get(i).getBoMail() %></td>
					</tr>
					<%}	} %>
					
	            </table>
            <div class="btnDiv_01">
              <input type="submit" class="btn" value="가입 신청" />
            </div>
            </form>
          </div>
          
        </div>
        <div class="div2_2">
          <div class="div2_2_1">
          <form action="delGroupAction.do" onsubmit="return confirm('정말로 탈퇴 하시겠습니까?');">
          
	          <table id="workerInfoTB">
	              <tr>
	                <th></th>
	                <th>업체명</th>
	                <th>사업자번호</th>
	                <th>대표자명</th>
	                <th>대표 번호</th>
	                <th>핸드폰번호</th>
	                <th>이메일</th>
	              </tr>
		<%if(nowAsslist==null||nowAsslist.size()==0){ %>
		<%}else{for(int i = 0 ; i < nowAsslist.size(); i++){ %>
				<tr>
					<td><input type="checkbox" value="<%=nowAsslist.get(i).getUsRn() %>" name="chkUsRn" id="chkUsRn"/></td>
					<td><%=nowAsslist.get(i).getCpName() %></td>
					<td><%=nowAsslist.get(i).getBoNumber() %></td>
					<td><%=nowAsslist.get(i).getBoName() %></td>
					<td><%=nowAsslist.get(i).getBoPhone() %></td>
					<td><%=nowAsslist.get(i).getBoCell() %></td>
					<td><%=nowAsslist.get(i).getBoMail() %></td>
				</tr>
		<%}}%>
	          </table>
	          <div class="btnDiv_02">
              <input type="submit" class="btn" value="삭제" />
            </div>
	      </form>
	          
          </div>
        </div>
      </div>
      <div class="div3">
      </div>
    </div>
  </main>
</body>
</html>