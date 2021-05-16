<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인 화면</title>
<%
	String loginCheckData = "";
	Object userClassData = "";
	String checkData = "";
	String boCheckIndex = "";
	String menuInfo[] = new String[4];
	String dropMenuInfo[] = new String[16];
	String dropMenuLink[] = new String[16];
	try {
		loginCheckData = (String) session.getAttribute("userId");
		userClassData = session.getAttribute("userClass");
		if (loginCheckData == null) {
			checkData = "실패";
		} else {
			boCheckIndex = (String) session.getAttribute("boCheckIndex");
			checkData = "성공";
		}
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
	} catch (NumberFormatException e) {
		System.err.println("비회원 userClass int형 변환 에러 : " + e);
	}

	System.out.println(checkData);
%>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/main.js?ver=123"></script>
<link rel="stylesheet" href="/css/main.css">
<script type="text/javascript">
	function loadOn() {
		var checkData = '<%=checkData%>';
		if(checkData=='성공'){
			var loginCheckData = '<%=loginCheckData%>';
		}else if(checkData=='실패'){
			var loginCheckData = null;
		}
		loginCheck(loginCheckData);

	}
	function loadOn02() {
		var boCheckIndex = '<%=boCheckIndex%>';
		boIndexCheck(boCheckIndex);
	}
</script>
<style>
</style>
<body onload="loadOn();">
	<nav class="nav-area">
		<ul>
			<li><a href="main.do">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#"><%=menuInfo[0]%></a>
				<ul>
					<li><a href="<%=dropMenuLink[0]%>"><%=dropMenuInfo[0] %></a></li>
					<li><a href="<%=dropMenuLink[1]%>"><%=dropMenuInfo[1] %></a></li>
					<li><a href="<%=dropMenuLink[2]%>"><%=dropMenuInfo[2] %></a></li>
					<li><a href="<%=dropMenuLink[3]%>"><%=dropMenuInfo[3] %></a></li>

				</ul></li>
			<li><a href="#"><%=menuInfo[1]%></a>
				<ul>
					<li><a href="<%=dropMenuLink[4]%>"><%=dropMenuInfo[4] %></a></li>
					<li><a href="<%=dropMenuLink[5]%>"><%=dropMenuInfo[5] %></a></li>
					<li><a href="<%=dropMenuLink[6]%>"><%=dropMenuInfo[6] %></a></li>
					<li><a href="<%=dropMenuLink[7]%>"><%=dropMenuInfo[7] %></a></li>

				</ul></li>
			<li><a href="#"><%=menuInfo[2]%></a>
				<ul>
					<li><a href="<%=dropMenuLink[8]%>"><%=dropMenuInfo[8] %></a></li>
					<li><a href="<%=dropMenuLink[9]%>"><%=dropMenuInfo[9] %></a></li>
					<li><a href="<%=dropMenuLink[10]%>"><%=dropMenuInfo[10] %></a></li>
					<li><a href="<%=dropMenuLink[11]%>"><%=dropMenuInfo[11] %></a></li>

				</ul></li>
			<li><a href="#"><%=menuInfo[3]%></a>
				<ul>
					<li><a href="<%=dropMenuLink[12]%>"><%=dropMenuInfo[12] %></a></li>
					<li><a href="<%=dropMenuLink[13]%>"><%=dropMenuInfo[13] %></a></li>
					<li><a href="<%=dropMenuLink[14]%>"><%=dropMenuInfo[14] %></a></li>
					<li><a href="<%=dropMenuLink[15]%>"><%=dropMenuInfo[15] %></a></li>

				</ul></li>
			<li><a href="logout">로그아웃</a></li>
			<li><a href="modify">내정보</a></li>
		</ul>
		</ul>
	</nav>
	<main> <!-- 4분할 or 3분할 or 2분할 필요 , 좌측 상단에 로고 영역 표시 필요--> 내용이 들어감
	</main>
	<footer>
		<p>사업자 정보 혹은 콜센터 등등의 정보가 들어감</p>
	</footer>
	<%-- <a href="#">메세지 페이지로</a> --%>

</body>
</html>