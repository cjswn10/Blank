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
	.div{
		border: 1px solid red;
		margin: 50px;
		padding: 10px;		
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
						var div = $('<div ></div>');
						div.addClass('div');
						
						var a = $('<a href="detailDiary.do?dno='+d.dno+'"></a>')
						var br = $('<br>');
						var p = $('<textarea rows="15" cols="50" readonly="readonly"></textarea>').html(d.dcontent);
						
						if (d.dphoto != null) {							
							var img = $('<img></img>').attr({
								src: "resources/upload/" + d.dphoto,
								width: "250",
								height: "250"					
							});
							$(a).append(img);
							$(div).append(a,br,p);
							$('#div').append(div);
						}else {
							$(a).append(p);
							$(div).append(a);
							$('#div').append(div);					
						}								
					})				
			}})		
		}
		listDiary();
		
	})
	
</script>
</head>
<body>
	<h2><a href="book.do">일기장~</a></h2>
	<div id="div"></div>
	<a href="insertDiary.do">일기 작성</a>
</body>
</html>