<%@page import="com.HEProject.he.usersInfo.UsersInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    	UsersInfoVO vo = (UsersInfoVO)request.getAttribute("vo"); 
	    String classType = "";
	    if(request.getAttribute("boardClassRe").equals("0")){
			classType = "자유 게시판";
	    }else if(request.getAttribute("boardClassRe").equals("1")){
			classType = "개인 사용자 게시판";
		}else if(request.getAttribute("boardClassRe").equals("2")){
			classType = "중계 사용자 게시판";
		}else if(request.getAttribute("boardClassRe").equals("3")){
			classType = "공지 게시판";
		}else {
			classType = "에러 - classType - jsp";
		}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성 - <%=classType %></title>
</head>
<script type="text/javascript">

	function examine() {
		var boardTitle = document.getElementById("boardTitle").value;
		var boardContents = document.getElementById("boardContents").value;
		var uCode = '<%=vo.getUsRn()%>';
		var uName = '<%=vo.getUserName()%>';
		if(boardTitle==''){
			alert('제목을 입력 해주세요.');
			return false;
		}
		if(boardContents==''){
			alert('내용을 입력 해주세요.');
			return false;
		}
		
		location.href="insertBoardForFreeAct.do?boardClass=" + <%=request.getAttribute("boardClassRe")%> + "&boardTitle=" + boardTitle + "&boardContents=" + boardContents + "&usRn=" + uCode + "&userName=" + uName;
	}
	
	function loadOn() {
		/* 추후 게시물 상세보기 페이지로 이동 */var insertBoardSF = <%=request.getAttribute("insertBoardSF")%>
		if(insertBoardSF==null){}else if(insertBoardSF==0){
			alert('게시물이 정상적으로 등록 되지 않았습니다. 다시 시도 해주세요.');
			location.href='eachBoard.do?boardClassNum=<%=request.getAttribute("boardClassRe")%>';
		}else if(insertBoardSF==1){
			alert('게시물이 정상적으로 등록 되었습니다.');
			location.href='eachBoard.do?boardClassNum=<%=request.getAttribute("boardClassRe")%>';
		}else {
			alert('정상적인 요청이 아닙니다.');
			location.href='eachBoard.do?boardClassNum=<%=request.getAttribute("boardClassRe")%>';
		}
		
		
	}

</script>
<body onload="loadOn();">
	<h1>게시물 작성 - <%=classType %></h1>
	<div>
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력 해주세요."/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="boardContents" id="boardContents" cols="30" rows="10" placeholder="내용을 입력 해주세요. 최대 : 400" maxlength="399"></textarea></td>
			</tr>
			<tr>
				<th>게시판 분류</th>
				<td><%=classType %></td>
			</tr>
			<tr>
				<th>글 작성자</th>
				<td><%=vo.getUserName() %></td>
			</tr>
		</table>
		<input type="button" onclick="return examine();" value="작성 완료"/>
		<input type="button" value="뒤로가기" onclick="location.href='eachBoard.do?boardClassNum=<%=request.getAttribute("boardClassRe")%>'"/>
		
	</div>
</body>
</html>