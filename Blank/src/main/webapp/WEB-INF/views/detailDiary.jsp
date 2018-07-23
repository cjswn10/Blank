<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<img width="500" height="500" src="resources/upload/${d.dphoto }"><br>
	내용 : ${d.dcontent}<br>
	<hr>
	<a href="updateDiary.do?dno=${d.dno }">수정</a>
	<button id="delete">삭제</button>
	<hr>
	<a href="diary.do">일기 목록</a>
	<hr>
</body>
</html>
