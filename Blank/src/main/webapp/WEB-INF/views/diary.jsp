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
		$.ajax({
			url: "listDiary.do",
			success:function(data){				
				var list = eval("("+data+")");
				$.each(list, function(i, d) {
					var div = $('<div></div>');
					$.each(d, function(j, v) {
						var img = $('<img></img>').attr("src", "resources/upload" + v.dfile);
						var p1 = $('<p></p>').html(v.dtitle);
						$(div).append(img, p1);
						$('#div').append(div);
					})
				})
				
		}})
	})
</script>
</head>
<body>
	<h2>일기장~</h2>
	<div id="div"></div>
	<a href="insertDiary.do">일기 추가</a>
</body>
</html>