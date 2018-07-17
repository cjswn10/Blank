<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.title
	{
		font-size: 30px;
		position: absolute;
		width: 160px;
		height:100px;
		left: 40px;
		top: -10px;
	}
	.menu
	{ 
		font-size: 30px;
		position: absolute;
		left: 1100px;
		top: 60px;
	}
	.ifm
	{
		font-size: 18px;
		position: absolute;
		left: 1150px;
		top: 20px;
	}
	.book
	{
		position: absolute;
		left: 500px;
		top: 150px;
		background-color: pink;
		width: 500px;
		height: 600px;
	}
	.aa
	{
		position: absolute;
		left: 140px;
		top: 100px;
		text-align: center;
		font-size: 20px;
		
	}
</style>
</head>
<body>
	<div class="title">
		<h1>그림 일기</h1>
	</div>
	
	<div class="book">
		<input type="text" class="aa" height="50" width="30">
	</div>
	
	<div class="menu">
		<a href="listBook.do">일기장</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">즐겨찾기</a>
	</div>
	
	<div class="ifm">
		<a href="">성민규님</a><span>  |  </span><a href="">마이페이지</a><span>  |  </span><a href="">로그아웃</a>
	</div>
</body>
</html>