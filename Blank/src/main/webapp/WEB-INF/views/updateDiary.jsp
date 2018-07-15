<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>일기 수정</h2>
	<hr>
	<form action="updateDiary.do" method="post">
		<input type="hidden" name="dno" value="${d.dno }">
		제목 : <input type="text" name="dtitle" value="${d.dtitle }"><br>
		타입 : <input type="text" name="dtype" value="${d.dtype }"><br>
		파일 : <input type="text" name="dfile" value="${d.dfile }"><br>
		폰트 : <input type="text" name="dfont" value="${d.dfont }"><br>
		날씨 : <input type="text" name="dweather" value="${d.dweather}"><br>
		<input type="submit" value="수정">
	</form>
</body>
</html>