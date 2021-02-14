<%@page import="com.HEProject.he.boardInfo.BoardInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%
    	BoardInfoVO vo = (BoardInfoVO)request.getAttribute("vo"); 
    	String classSet = "";
    	switch(vo.getBoardClass()){
    		case 0 :
    			classSet = "자유게시판";
    			break;
    		case 1 :
    			classSet = "개인사용자 게시판";
    			break;
    		case 2 :
    			classSet = "중계 사용자 게시판";
    			break;
    		case 3 :
    			classSet = "공지 게시판";
    			break;
    		default :
    			classSet = "오류 - boardCode,el";
    			break;
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<script type="text/javascript">
	function mdfCheck() {
		var boardTitle = document.getElementById("boardTitle").value;
		var boardContents = document.getElementById("boardContents").value;
		var boardCode = '<%=vo.getBoardCode()%>';
		if(boardTitle==''){
			alert('제목을 입력 해주세요.');
			return false;
		}
		if(boardContents==''){
			alert('내용을 입력 해주세요.');
			return false;
		}
		location.href="modifyBoardAct.do?boardCode=" + boardCode + "&boardTitle=" + boardTitle + "&boardContents=" + boardContents;
	}
	
</script>
<body>
	<h1>게시물 수정</h1>
	<div>
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" id="boardTitle" name="boardTitle" value="<%=vo.getBoardTitle() %>"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="boardContents" id="boardContents" cols="30" rows="10"><%=vo.getBoardContents() %></textarea></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=vo.getUserName() %></td>
			</tr>
			<tr>
				<th>게시판 분류</th>
				<td><%=classSet%></td>
			</tr>														
		</table>
		<input type="button" value="완료" onclick="return mdfCheck();"/>
		<input type="button" value="뒤로가기" onclick="location.href='getBoard.do?boardCode=<%=vo.getBoardCode()%>&statusNum=1'"/>
	</div>
</body>
</html>