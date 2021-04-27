<%@page import="com.HEProject.he.workDataInfo.WorkDataInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%WorkDataInfoVO vo = (WorkDataInfoVO)request.getAttribute("vo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>증빙 자료</title>
</head>
<style>
	
	#imgDIV{
		height: 500px;
		width: 300px;
	}
	#workDataIMG {
		position: absolute;
		height: 100%;
		width: 100%;
	}
</style>
<body>
	<!-- 추후 사이즈 조정 필요함-->
	<div class="imgDIV" id="imgDIV">
		<input type="image" src="/workDataUpload/<%=vo.getDtName() %>" id="workDataIMG" name="workDataIMG" readonly="readonly"/>
	</div>
	<input type="button" value="닫기" onclick="window.close();"/>
</body>
</html>