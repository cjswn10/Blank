<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<h2>일기 목록</h2>
	<hr>
	<table border="1" width="100%">
		<tr>
			<td>제목</td>
			<td>날짜</td>			
		</tr>
		<c:forEach var="d" items="${list }">
			<tr>
				<td>
				<a href="detailDiary.do?dno=${d.dno }"> ${d.dtitle }</a>
				</td>
				<td>${d.ddate }</td>			
			</tr>		
		</c:forEach>
	</table>
	<a href="insertDiary.do">일기 등록</a>
</body>
</html>