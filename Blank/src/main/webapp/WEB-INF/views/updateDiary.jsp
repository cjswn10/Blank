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
		<input type="hidden" name="dno" id="dno" value="${d.dno }">
		<input type="hidden" name="bno" id="bno" value="${d.bno }">
		<input type="hidden" name="mno" id="mno" value="${d.mno }">
		
		제목 : <input type="text" name="dtitle" value="${d.dtitle }"><br>
		날짜 : <input type="text" name="ddate" value="${d.ddate}"><br>
		날씨 : <input type="text" name="dweather" value="${d.dweather}"><br>
		폰트 : <input type="text" name="dfont" value="${d.dfont }"><br>
		타입 : <input type="hidden" name="dtype" value="${d.dtype }"><br>
		그림 : <input type="text" name="dfile" value="${d.dfile }"><br>
		포토 : <input type="file" name="dphoto" value="${d.dphoto}"><br>
		내용 :<br>
		<textarea rows="10" cols="60" name="dcontent">${d.dcontent }</textarea><br>
		<input type="submit" value="수정">
	</form>
</body>
</html>