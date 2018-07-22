<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>일기 등록</h2>
	<hr>
	
	<form action="insertDiary.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bno" id="bno" value="${bno }"><br> 
		제목 : <input type="text" name="dtitle"><br>
		타입 : <input type="text" name="dtype"><br>
		파일 : <input type="file" name="upload"><br>
		날씨 : <input type="text" name="dweather"><br>
		포토 : <input type="text" name="dphoto"><br>
		폰트 : <input type="text" name="dfont"><br>
		작성일 : <input type="date" name="dwritedate"><br>
		내용 : <br>
		<textarea rows="10" cols="60" name="dcontent"></textarea><br>
		공개 유무 : <input type="number" name="serect">		
		<input type="submit" value="등록">
	</form>
</body>
</html>