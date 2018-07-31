<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

.textDiv{	
	background-color: pink;
	background-image: url("../resources/upload/textDiv.png");
	background-size: cover;	
}

.diaryimg{
	position: relative;    
    width: 300px;
    height: 400px;
    float: left;
    background-size: contain;
	background-repeat: no-repeat;
	border-radius: 10px;
}
.content{	
	width: 300px;
	height: 400px;
	position: absolute;
	white-space: pre-line;
}

@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

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
    font-family: 'Nanum Pen Script', serif;
    font-size: 30px;
    text-align: center;
    color: white;
    background-color: #151515;
}

.footer h2{
	font-size: 50px;
	
}

.btn-social {
  display: inline-block;
  height: 50px;
  width: 50px;
  border: 2px solid white;
  border-radius: 100%;
  text-align: center;
  font-size: 20px;
  line-height: 45px;
}


.btn-outline{
color:#fff;
font-size:20px;
border:2px solid #fff;
background:0 0;
transition:all .3s ease-in-out;
margin-top:15px
}
.btn-outline.active,.btn-outline:active,.btn-outline:focus,.btn-outline:hover{
color:#fff;
background:#fff;
border:2px solid #fff;
}



</style>
<link rel="stylesheet" href="../resources/css/base.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		$.ajax({
			url: "mainList.do",
			success:function(data){
				var list = eval("("+data+")");
				$.each(list, function(i, d) {
					var font = $('<font color="black"></font>')					
					var content = $('<div class="content"></div>').html(d.dcontent);
					$(font).append(content);
					var div = $("<div class='diaryimg'></div>").attr({
						style: "background-image: url('../resources/upload/"+d.dphoto+"')"
					});
					var textDiv = $('<div class="textDiv"><div/>')					
					var article = $('<article></article');					
					
					if (d.dphoto == null) {
						$(div).attr({
							style: "background-image: url('../resources/upload/standard.png')"
						})
					}					
					
					$(article).append(div)
					$('.clearfix').append(article);
					
					$(article).hover(function() {
						$(div).detach();
						$(this).append(textDiv);
						$(this).append(content);
					}, function() {		
						$(this).append(div);
						$(textDiv).detach();
						$(content).detach();
						$(font).detach();
					})
				})
			}
		})
	})
</script>
<title>빈칸을 채우다.</title>
</head>
<body>
	<a href="mainjsp" class="main"><img src="../resources/img/mainlogo.png"></a>
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
	<h2>비트와밀당하는 팀 X 빈칸 , 2018</h2>
	<ul class="list-inline">
       <li>
           <img alt="" src="../resources/img/ho.jpg" class="btn-social btn-outline">
           <br>김영호
       </li>
       <li>
           <img alt="" src="../resources/img/adult.jpg" class="btn-social btn-outline">
           <br>변성인
       </li>
       <li>
           <img alt="" src="../resources/img/min.jpg" class="btn-social btn-outline">
           <br>성민규
       </li>
       <li>
           <img alt="" src="../resources/img/lim.jpg" class="btn-social btn-outline">
           <br>임연주
       </li>
       <li>
           <img alt="" src="../resources/img/cha.jpg" class="btn-social btn-outline">
           <br>차건우
       </li>

                            
    </ul>
</footer>

</body>
</html>