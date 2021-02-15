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
<title>게시물 상세보기</title>
</head>
<script type="text/javascript">
	function loadOn() {
		var checkNum = <%=request.getAttribute("MBCheck")%>;
		switch (checkNum) {
		case null:
			break;
		case 0:
			alert('수정 사항이 정상적으로 등록되지 않았습니다.');
			break;
		case 1:
			alert('수정 사항이 정상적으로 등록되었습니다.');
			break;
		case 2:
			alert('글 작성자만 수정이 가능합니다.');
			break;
		default:
			alert('정상적인 요청이 아닙니다.');
			break;
		}
	}
</script>
<body onload="loadOn();">
	<h1>게시물 상세보기</h1>
	<div>
		<table>
			<tr>
				<th>제목</th>
				<td><%=vo.getBoardTitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=vo.getBoardContents() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=vo.getUserName() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=vo.getViews() %></td>
			</tr>
			<tr>
				<th>게시판 분류</th>
				<td><%=classSet%></td>
			</tr>
			<tr>
				<th>작성 날짜</th>
				<td><%=vo.getWriteDate() %></td>
			</tr>
			<tr>
				<th>수정 날짜</th>
				<td><%=vo.getFixDate() %></td>
			</tr>															
		</table>
		<input type="button" value="수정하기" onclick="location.href='checkIdForModify.do?boardCode=<%=vo.getBoardCode()%>'"/>		
		<input type="button" value="뒤로가기" onclick="location.href='eachBoard.do?boardClassNum=<%=vo.getBoardClass()%>'"/>
	</div>
</body>
</html>