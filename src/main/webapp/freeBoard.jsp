<%-- 
		@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[사용 안함]@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
<%@page import="java.util.List"%>
<%@page import="com.HEProject.he.boardInfo.BoardInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%List<BoardInfoVO> list = (List)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
</head>
<style>
	table {
		border: 1px black solid;
	}
	tr {
		border: 1px black solid;
	}
	th, td{
		border : 1px black solid;
		text-align: center;
	}
</style>
<body>
	<h1>자유 게시판</h1>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<%if(list.size()==0){ %>
				<tr>
					<td><p>게시글이 없습니다.</p></td>
				</tr>
			<%}else{for(int i = 0 ; i < list.size(); i++){ %>
				<tr>
					<td><%=i+1 %></td>
					<td><a href="getBoard.do?boardCode=<%=list.get(i).getBoardCode()%>&statusNum=1"><%=list.get(i).getBoardTitle() %></a></td>
					<td><%=list.get(i).getUserName() %></td>
					<td><%=list.get(i).getWriteDate() %></td>
					<td><%=list.get(i).getViews() %></td>
				</tr>
			<%}} %>
		</table>
	</div>
	<input type="button" value="글 쓰기" onclick="location.href='insertBoardForFree.do?boardClass=0'"/>
	<input type="button" value="내 게시물"/>
	<input type="button" value="뒤로가기" onclick="location.href='etcForIndi.do'"/>
	<div>
		<!-- 글 검색 기능 추가 -->
	</div>
</body>
</html> --%>