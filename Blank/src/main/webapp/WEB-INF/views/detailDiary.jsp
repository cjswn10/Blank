<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>일기 상세</h2>
	제목 : ${d.dtitle }<br>
	날짜 : ${d.ddate }<br>
	날씨 : ${d.dweather }<br>
	<hr>
	<a href="updateDiary.do?dno=${d.dno }">수정</a>
	<a href="deleteDiary.do?dno=${d.dno }">삭제</a>
	<hr>
	<a href="listDiary.do">일기 목록</a>
	<hr>
</body>
</html>
