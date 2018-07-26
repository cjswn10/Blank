<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	
	/*로고 표시 */
	.title
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 80px;
		position: relative;
		width: 160px;
		height:100px;
		left: 40px;
		top: -10px;
	}
	
	/* 일기장,즐겨찾기 */
	.menu
	{ 
		font-family: 'Nanum Pen Script', serif;
		font-size: 40px;
		float: right;
		position: relative;
		width:30%;
		top: -50px;
		left: -3%;
		/*left: 1100px;
		top: -60px;*/
	}
	/* id,마이페이지,로그아웃 */
	.ifm
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 25px;
		float: right;
		position: relative;
		width:30%;
		top:-100px;
		left: 30%;
		/*left: 1150px;
		top: -160px;*/
	}
	
	.main{
		font-family: 'Nanum Pen Script', serif;
		position: relative;
		border: none;
		left:40%;
		top: 200px;
		
	}
	
	.main h2{
		font-size: 50px;
	}
	
	.main #list li{
		font-size: 30px;
		list-style-type: none;
	}
	
	.main #list li img{
		width:3%;
		height: 3%;
	}
	
	#list #plus_location{
	
		font-size: 20px;
	}


	
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var listFavorite = function() {
			$.ajax({
			url:"listFavorite.do",
			data:{"mno":$("#mno").val()},
			success:function(data)
			{
				
				var list = eval("("+data+")");
				$.each(list,function(i,f){
					var img = $("<img src='../resources/img/favoriteicon.png'>")
					var a = $("<a href='favoritesBook.do?mno='"+f.mno+"></a>").html(f.id+"님");
					var li = $("<li></li>")
					var removeimg = $("<a href='deleteFavorite.do?fno="+f.fno+"' class='glyphicon glyphicon-remove' id='plus_location'></a>");
					
					$(li).append(img,a,removeimg);
					$("#list").append(li);
				});
			}});
		};
		listFavorite();
	});
</script>
</head>
<body style="background-image: url('https://png.pngtree.com/thumb_back/fw800/back_pic/03/74/41/5757bc295499924.jpg');">

	<input type="hidden" name="mno" id="mno" value="${mno}">
	<div class="title">
		<h1>그림 일기</h1>
	</div>
	
	
	
	<div class="menu">
		<a href="book.do">일기장</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="favorite.do">즐겨찾기</a>
	</div>
	
	<div class="ifm">
		<a href="#">${id }님</a><span>  |  </span><a href="myPage.do">마이페이지</a><span>  |  </span><a href="logOut.do">로그아웃</a>
	</div>
	
	<div class="main" >
		<h2>즐겨 찾기</h2>
		<ul id="list">
			
		</ul>
		
	</div>
	
	
	
</body>
</html>