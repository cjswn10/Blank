<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

.diaryimg{
	position: relative;    
    background-size: contain;    
    width: 300px;
    height: 400px;
    z-index: 5;
    float: left;
}
.content{	
	position: absolute;
	z-index: 2;
	font-style: white;	
}
.opacity{
	opacity: 0.4;	
}

.clearfix::after {
	content: '';
	display: block;
	clear: both;	
	}
<!-- 랜딩 컨테이너 작업  -->
.container {
    width: 960px;
    margin: 0 auto;
}

.landing {
    width: 70%;
    height: 600px;
    margin: auto;
    
    background-image: url(https://i.ytimg.com/vi/dtxcy6g3zeY/maxresdefault.jpg);
    
    background-size: cover;
    background-position: center center;
}
.landing > .container {
    padding-top: 200px;
}

.blog {
	position: relative;
 	width: 1400px;
 	margin: 0 auto;
    padding: 100px 0;
}
.blog article {
    float: left;
    width: 300px;
    height: 400px;
    margin-right: 30px;
    margin-bottom: 30px;
}

.blog article:last-child {
    margin-right: 0;
    
}

.footer {
    
    text-align: center;
    color: white;
    background-color: black;
}


</style>
<link rel="stylesheet" href="../resources/css/base.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		$.ajax({
			url: "mainList.do",
			success:function(data){
				var list = eval("("+data+")");
				$.each(list, function(i, d) {
					var content = $('<p class="content"></p>').html(d.dcontent);
					var div = $("<div class='diaryimg'></div>").attr({
						style: "background-image: url('../resources/upload/"+d.dphoto+"')"
					});
					var article = $('<article></article');				
					if (d.dphoto == null) {
						$(div).attr({
							style: "background-image: url('../resources/upload/standard.png')"
						})
					}
					
					$(div).hover(function() {
						$(this).addClass('opacity')		
						$(div).append(content);
					}, function() {
						$(this).removeClass('opacity')
						$(content).detach();
					})
					$(article).append(div)
					$('.clearfix').append(div);					
				})
			}
		})
	})
</script>
<title>빈칸을 채우다.</title>
</head>
<body>
	<a href="#" class="main">그림일기</a>

<div class="upper">
<span class="upper_menu">${id }님</span>
<a href="#" class="upper_menu">로그아웃</a>
</div>
<hr>

<div class="menus" align="right">
<a href="book.do" class="main_menu">일기장</a>
<a href="#" class="main_menu">즐겨찾기</a>
<a href="myPage.do" class="main_menu">마이페이지</a>
</div>

<div class="title_favo" align="center">
	main
</div>

<section class="landing">
		<div class="container">

		</div>
		
</section>

<div class="container">
	
	   <div class="blog" align="center">
	   		<div class="clearfix">
	   						    		    		
	    	</div>
	   </div> 	    
</div>
<!-- 푸터입니다.  -->
<footer class="footer">
	<p>비트와밀당하는 팀 X 빈칸 , 2018</p>
</footer>

</body>
</html>