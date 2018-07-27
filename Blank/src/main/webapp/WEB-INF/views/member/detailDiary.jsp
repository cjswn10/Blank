<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gaegu|Gamja+Flower|Jua|Nanum+Brush+Script|Nanum+Gothic+Coding|Nanum+Myeongjo|Nanum+Pen+Script|Source+Sans+Pro|Stylish|Sunflower:300" rel="stylesheet">

<title>빈칸을 채우다.</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		$('#delete').click(function() {
			re = confirm("정말 삭제하시겠습니다?");
			if (re == true) {
				location.href = "deleteDiary.do?dno="+${d.dno }
			}
			if (re == false) {
				location.href = "detailDiary.do?dno="+${d.dno}
			}
		})
	})
</script>
</head>
<body>
	<h2>일기 상세</h2>
	제목 : ${d.dtitle }<br>
	일기날짜 : ${d.ddate }<br>
	날씨 : ${d.dweather }<br>
	타입 : ${d.dweather }<br>
	작성(수정)일 : ${d.wdate}<br>
	<c:if test="${not empty d.dphoto}">	
		<img width="500" height="500" src="../resources/upload/${d.dphoto }"><br>
	</c:if>
	내용 : <br>
	<textarea rows="10" cols="60" readonly="readonly" style="font-family: ${d.dfont}">${d.dcontent}</textarea> <br>
	<hr>
	<a href="updateDiary.do?dno=${d.dno }">수정</a>
	<button id="delete">삭제</button>
	<hr>
	<a href="diary.do?mno=${mno }&bno=${bno}">일기 목록</a>
	<hr>
</body>
</html>
