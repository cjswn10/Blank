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
	$(function addList() {
		$.ajax({
			url: "listDiary.do",
			success:function(data){				
				var list = eval("("+data+")");				
				$.each(list, function(i, d) {
					var div = $('<div></div>');					
					var img = $('<img></img>').attr({
						src: "resources/upload/" + d.dfile,
						width: "500",
						height: "500"					
					});
					var p1 = $('<p></p>').html(d.dtitle);
					$(div).append(img, p1);
					$('#div').append(div);
				})				
		}})
		$(window).scroll(function(){
			var sh = $(window).scrollTop() + $(window).height();
			var dh = $(document).height();			
			if(sh + 200 >= dh){				
				addList();
				$(window).scrollTop();
			};		
		})
	})
</script>
</head>
<body>
	<h2>일기장~</h2>
	<div id="div"></div>
	<a href="insertDiary.do">일기 추가</a>
</body>
</html>