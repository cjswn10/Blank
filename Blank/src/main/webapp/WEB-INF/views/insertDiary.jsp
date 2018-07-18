<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>일기 등록</h2>
	<hr>
	<form action="insertDiary.do" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="dtitle"><br>
		타입 : <input type="text" name="dtype"><br>
		날씨 : <input type="text" name="dweather"><br>
		파일 : <input type="file" name="upload"><br>
		<input type="submit" value="등록">
	</form>
</body>
</html>