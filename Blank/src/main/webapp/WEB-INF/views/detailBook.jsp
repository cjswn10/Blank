<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	${b.bno }
	${b.btitle }
	${b.bcolor }
	<a href="updateBook.do?bno=${b.bno }">수정</a>
	<a href="deleteBook.do?bno=${b.bno }">삭제</a>
</body>
</html>