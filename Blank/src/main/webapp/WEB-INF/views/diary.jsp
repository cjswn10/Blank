<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#div{
		position: absolute;
		left: 30%;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		var mno = document.location.search.substr(5,4);		
		var bno = document.location.search.substr(14,1);		
		
		var listDiary = function () {
			
			$.ajax({
				url: "listDiary.do",	
				data: {"bno":bno,"mno":mno},
				success:function(data){				
					var list = eval("("+data+")");
					$.each(list, function(i, d) {
						//날짜 날씨 제목 그림 사진 글
						var div = $('<div></div>');	
						var img = $('<img></img>').attr({
							src: "resources/upload/" + d.dphoto,
							width: "500",
							height: "500"					
						});
						var a = $('<a href="detailDiary.do?dno='+d.dno+'"></a>')
						var p1 = $('<p></p>').html(d.ddate);
						var p2 = $('<p></p>').html(d.dweather);
						var p3 = $('<p></p>').html(d.dtitle);
						var br = $('<br>');
						var p4 = $('<textarea rows="10" cols="60" readonly="readonly"></textarea>').html(d.dcontent);
						$(a).append(img);
						$(div).append(p1,p2,p3,a,br,p4);
						$('#div').append(div);					
					})				
			}})		
		}
		listDiary();
		
	})
	
</script>
</head>
<body>
	<h2>일기장~</h2>
	<div id="div"></div>
	<a href="insertDiary.do">일기 작성</a>
</body>
</html>