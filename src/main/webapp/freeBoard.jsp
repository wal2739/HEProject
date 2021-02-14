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
<body>
	<h1>자유 게시판</h1>
	<div>
		<%if(list.size()==0){ %>
			<p>게시물이 없습니다.</p>
		<%}else{for(int i = 0 ; i < list.size(); i++){ %>
			
		<%}} %>
	</div>
	<input type="button" value="글 쓰기" onclick="location.href='insertBoardForFree.do'"/>
	<input type="button" value="내 게시물"/>
	<input type="button" value="뒤로가기" onclick="location.href='etcForIndi.do'"/>
	<div>
		<!-- 글 검색 기능 추가 -->
	</div>
</body>
</html>