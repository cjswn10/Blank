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
		position: relative;
		left: 500px;
		top: 150px;
		background-color: pink;
		width: 500px;
		height: 570px;
	}
	.aa
	{
		position: absolute;
		left: 140px;
		top: 100px;
		text-align: center;
		font-size: 20px;
		
	}
	.s1
	{
		position: relative;
		left: 200px;
		top: 600px;
	}
	.false
	{
		position: relative;
		left: 250px;
		top: 600px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".false").click(function() {
			re = confirm('사이트에서 나가시겠습니까?');
			if(re == true)
			{
				location.href="listBooka.do"
			}	
			else
			{
				return;
			}	 
		})
		$(".s1").click(function() {
			re = confirm('일기장을 생성하시겠습니까?');
			if(re == true)
			{
				location.href="listBooka.do"
			}	
			else
			{
				return;
			}	 
		})
	})
</script>
</head>
<body>
	<div class="title">
		<h1>그림 일기</h1>
	</div>
	
	<div class="book">
		<form action="insertBook.do" method="post" id="f">
			<input type="hidden" name="id" id="id" value="${id }">
			<input type="hidden" name="mno" id="mno" value="${mno }">
			<input type="text" name="btitle" class="aa" height="50" width="30">
			<input type="hidden" name="bcolor" value="aqua" >
			<input class="s1" type="submit" value="등록">
			<a class="false">취소</a>
		</form>
	</div>
	
	<div class="menu">
		<a href="book.do">일기장</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">즐겨찾기</a>
	</div>
	
	<div class="ifm">
		<a href="">${id }님</a><span>  |  </span><a href="">마이페이지</a><span>  |  </span><a href="">로그아웃</a>
	</div>
</body>
</html>