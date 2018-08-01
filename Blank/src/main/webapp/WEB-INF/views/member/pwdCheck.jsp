<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빈칸을 채우다.</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
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
	.menu
	{ 
		font-family: 'Nanum Pen Script', serif;
		font-size: 40px;
		width:400px;
		position: relative;
		left: 1100px;
		top: -660px;	
	}
	.ifm
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 25px;
		position: relative;
		width: 300px;
		left: 1150px;
		top: -760px;
		
	}
	.main
	{
		position: relative;
		width:350px;
		height:300px;
		left: 300px;
		top: 200px;
	}
	.pwd
	{
		font-family: 'Nanum Pen Script', serif;
		position: relative;
		font-size: 30px;
		left: -10px;
	}
	#sub
	{
		font-family: 'Nanum Pen Script', serif;
		position: relative;
		font-size: 20px;
		top: 70px;
		left: 180px;
	}
	.check
	{
		font-family: 'Nanum Pen Script', serif;
		position: relative;
		font-size: 50px;
		width:1000px;
		top: 130px;
		left: 130px;
	}
	.my
	{
		font-family: 'Nanum Pen Script', serif;
		position:relative;
		left:290px;
		top:-50px;
		font-size: 70px;
	}
	#pwd
	{
		position: relative;
		font-size:16px;
		width:250px;
		top: -5px;
		left: 10px;
	}
	.container
	{
		width: :960px;
	}
	#d
	{
		font-family: 'Nanum Pen Script', serif;
		font-size:30px;
		position: relative;
		top:220px;
		left:430px;
		width:300px;
	}

	
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/blank.css?">
<script type="text/javascript" src="../resources/js/menu.js" ></script>
<script type="text/javascript">
	$(function() {
		
		setTimeout(function () {
			$("#d").html("");
		},5000);
		
	})
</script>
</head>
<body>

	
	<!-- side-menu -->
<section id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	
	<a href="#"><img class="side_icon" src="../resources/img/icon/person.png">${id }님</a>
	<h5>회원정보</h5>
	<a href="pwdCheck.do?id=${id }">Edit</a>
	<a href="logOut.do">logout</a>
	<br>
	<h5>고객센터</h5>
	<a href="qNa.do">Contact</a>
	<br>
	<div class="side_icon_set">
		<a href="https://github.com/cjswn10/Blank"><img class="side_icon" alt="G" src="../resources/img/icon/git.png"></a>
		<a href="http://sc.bitcamp.co.kr/index.php?main_page=faq&action=use"><img class="side_icon" alt="B" src="../resources/img/icon/bit.png"></a>
	</div>
	
</section>

<div id="wrapper">

	<!-- main-menu -->
	<nav class="clearfix">
	    <a href="main.do"><img src="../resources/img/blank.png" class="logo left"></a>
	    <span style="cursor:pointer" onclick="openNav()">&#9776; </span>
	    <ul>
	        <li><a href="book.do">DIARY</a></li>
	        <li><a href="favorite.do">FAVORITES</a></li>
	        <li><a href="myPage.do">MYPAGE</a></li>
	    </ul>
	</nav>

	
	<div class="content" style="margin-top: 180px">
		<div class="container">
		<div class="check">
			<span class="my">본인확인</span><br>
			<span>고객님의 소중한 개인정보보호를 위해서 본인확인을 진행합니다.</span>
		</div>
		
		<div id="d"><font color="red">${msg }</font></div>
		
		<div class="main">
			<form action="pwdCheck.do" method="post" class="f">
				<input type="hidden" name="id" id="id" value="${id }"><br>
				<input type="hidden" name="mno" id="mno" value="${mno }"><br>
				<label class="pwd">비밀번호 : </label><input type="password" name="pwd" id="pwd"><br>
				<input class="btn btn-default" type="submit" value="확인" id="sub">
			</form>
		</div>
	</div>
	</div>
</div>

	
	
	
</body>
</html>