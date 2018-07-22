<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	}
	.sub
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
		left: 30px;
	}
	.container
	{
		position: relative;
		width: 600px;
		height: 600px;
		top: -30px;
		left: 50px;
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
<script type="text/javascript">
	$(function() {
		
		setTimeout(function () {
			$("#d").html("");
		},5000);
		
	})
</script>
</head>
<body>
	<div class="title">
		<h1>그림 일기</h1>
	</div>
	
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
				<input type="submit" value="확인" class="sub">
			</form>
		</div>
	</div>
	
	
	<div class="menu">
		<a href="book.do">일기장</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">즐겨찾기</a>
	</div>
	
	<div class="ifm">
		<a href="#">${id }님</a><span>  |  </span><a href="myPage.do">마이페이지</a><span>  |  </span><a href="logOut.do">로그아웃</a>
	</div>
</body>
</html>