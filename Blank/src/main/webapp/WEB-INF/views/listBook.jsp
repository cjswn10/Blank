<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="80%">
		<tr>
			<td>일기장번호</td>
			<td>일기장제목</td>
			<td>일기장색상</td>
		</tr>
		<c:forEach var="b" items="${list }">
			<tr>
				<td>${b.bno }</td>
				<td><a href="detailBook.do?bno=${b.bno }">${b.btitle }</a></td>
				<td>${b.bcolor }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="insertBook.do">일기장등록</a>
</body>
</html>