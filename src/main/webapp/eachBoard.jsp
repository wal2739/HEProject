<%@page import="com.HEProject.he.boardInfo.BoardInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    	List<BoardInfoVO> list = (List)request.getAttribute("list");
    	String classType = "";
    	if(request.getAttribute("classType").equals(0)){
    		classType = "자유 게시판";
    	}else if(request.getAttribute("classType").equals(1)){
    		classType = "개인 사용자 게시판";
    	}else if(request.getAttribute("classType").equals(2)){
    		classType = "중계 사용자 게시판";
    	}else {
    		classType = "에러 - classType - jsp";
    	}
    	int userClass = (Integer)request.getAttribute("nuserClass");
    	String backPath = "";
    	if(userClass==1){
    		backPath = "etcForIndi.do";
    	}else if(userClass==2){
    		backPath = "etcForAss.do";
    	}else {
    		backPath = "#";
    		System.out.println("backPathErr - jsp");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=classType %></title>
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
	<h1><%=classType %></h1>
	<div>
		
			
			<%if(list.size()==0){ %>
				<p>게시글이 없습니다.</p>
			<%}else{%>
			<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<%for(int i = 0 ; i < list.size(); i++){ %>
				<tr>
					<td><%=i+1 %></td>
					<td><a href="getBoard.do?boardCode=<%=list.get(i).getBoardCode()%>&statusNum=1"><%=list.get(i).getBoardTitle() %></a></td>
					<td><%=list.get(i).getUserName() %></td>
					<td><%=list.get(i).getWriteDate() %></td>
					<td><%=list.get(i).getViews() %></td>
				</tr>
			<%}%>
			</table>
			<%} %>
		
	</div>
	<input type="button" value="글 쓰기" onclick="location.href='insertBoardForFree.do?boardClass=<%=request.getAttribute("classType")%>'"/>
	<input type="button" value="내 게시물"/>
	<input type="button" value="뒤로가기" onclick="location.href='<%=backPath%>'"/>
	<div>
		<!-- 글 검색 기능 추가 -->
	</div>
</body>
</html>