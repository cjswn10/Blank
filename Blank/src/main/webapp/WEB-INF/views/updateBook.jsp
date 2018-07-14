<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updateBook.do" method="post">
		<input type="hidden" name="bno" value="${b.bno }">
		일기장 제목 : <input type="text" name="btitle" value="${b.btitle }"><br>
		일기장 색상 : <input type="text" name="bcolor" value="${b.bcolor }"><br>
		<input type="submit" value="수정">
	</form>
</body>
</html>