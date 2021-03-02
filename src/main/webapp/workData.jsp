<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>증빙 자료 등록</title>
</head>
<body>
	<h1>증빙 자료 등록</h1>
	<form action="testUpload.do" method="post" enctype="multipart/form-data">
		<input type="file" name="uploadFile"/>
		<input type="submit" value="테스트 등록"/>
	</form>
</body>
</html>