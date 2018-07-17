<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.book_writer
	{
		font-size: 25px;
		position: absolute;
		width: 300px;
		height:100px;
		left: 60px;
		top: 300px;
	}
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
	.list
	{
		font-size: 25px;
		position: absolute;
		width: 300px;
		border: 1px solid black;
		height:400px;
		left: 450px;
		top: 200px;
	}
	.list1
	{
		font-size: 25px;
		position: absolute;
		width: 300px;
		background-color:yellow;
		height:400px;
		left: 1000px;
		top: 200px;
	}
	.list2
	{
		font-size: 25px;
		position: absolute;
		width: 300px;
		background-color:red;
		height:400px;
		left: 450px;
		top: 700px;
	}
	.list3
	{
		font-size: 25px;
		position: absolute;
		width: 300px;
		background-color:pink;
		height:400px;
		left: 1000px;
		top: 700px;
	}
	#a
	{
		position: absolute;
		left: 280px;
		top: 0px;
		
	}
	#b
	{
		position: absolute;
		left: 280px;
		top: 0px;
		
	}
	#c
	{
		position: absolute;
		left: 280px;
		top: 0px;
		
	}
	#d
	{
		position: absolute;
		left: 280px;
		top: 0px;
		
	}
	#e
	{
		position: absolute;
		left: 120px;
		top: 150px;
	}
	.glyphicon-plus
	{
		font-size: 300%;
		color: black;
	}
	.glyphicon-remove
	{
		font-size: 150%;
		color: black;
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
		$.ajax({
			url:"listBook.do",
			success:function(data)
			{
				var list = eval("("+data+")");
				$.each(list,function(i,d){
					
				});
				
			}
		});
		
	})
	function pro(url)
	{
		re = confirm("정말로 삭제 할껍니까?");
		if(re == true)
		{
			location.href=url;
		}
	}
</script>
</head>
<body>
	<div class="title">
		<h1>그림 일기</h1>
	</div>
	
	<div class="list"><a href="insertBook.do"><span class="glyphicon glyphicon-plus" id="e"></span></a></div>
	<div class="list1"><a href="#" onclick="pro('deleteBook.do?bno=${b.bno}');"><span class="glyphicon glyphicon-remove" id="b"></span></a></div>
	<div class="list2"><a href="#" onclick="pro('deleteBook.do?bno=${b.bno}');"><span class="glyphicon glyphicon-remove" id="c"></span></a></div>
	<div class="list3"><a href="#" onclick="pro('deleteBook.do?bno=${b.bno}');"><span class="glyphicon glyphicon-remove" id="d"></span></a></div>
	
	<div class="book_writer">
		<a href="insertBook.do">새 일기장</a>
	</div>
	
	<div class="menu">
		<a href="">일기장</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">즐겨찾기</a>
	</div>
	
	<div class="ifm">
		<a href="">성민규님</a><span>  |  </span><a href="">마이페이지</a><span>  |  </span><a href="">로그아웃</a>
	</div>
</body>
</html>