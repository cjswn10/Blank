<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	<!-- 새일기장 생성 a태그   -->
	.book_writer
	{
		font-size: 25px;
		position: absolute;
		width: 300px;
		height:100px;
		left: 60px;
		top: 300px;
	}
	<!-- 로고 표시 -->
	.title
	{ 
		font-size: 30px;
		position: absolute;
		width: 160px;
		height:100px;
		left: 40px;
		top: -10px;
	}
	<!-- 일기장,즐겨찾기 -->
	.menu
	{
		font-size: 30px;
		position: absolute;
		left: 1100px;
		top: 60px;
	}
	<!-- id,마이페이지,로그아웃 -->
	.ifm
	{
		font-size: 18px;
		position: absolute;
		left: 1150px;
		top: 20px;
	}
	<!-- 새일기장 만들기 -->
	.insertBook
	{
		font-size: 25px;
		position: relative;
		width: 450px;
		border: 1px solid black;
		height:500px;
		left: 350px;
		top: 200px;
	}
	<!-- 새일기장 만들기2 -->
	.insertBook2
	{
		font-size: 25px;
		position: relative;
		width: 450px;
		border: 1px solid black;
		height:500px;
		left: 930px;
		top: -300px;
	}
	<!-- remove 아이콘위치 -->
	#remove-location
	{
		position: relative;
		left: 395px;
		top: -85px;
		
	}
	<!-- plus 아이콘위치 -->
	#plus-location
	{
		position: relative;
		top:170px;
		display:table;
		margin-left: auto;
		margin-right: auto;
	}
	<!-- plus 아이콘 -->
	.glyphicon-plus
	{
		font-size: 400%;
		color: black;
	}
	<!-- remove 아이콘 -->
	.glyphicon-remove
	{
		font-size: 250%;
		color: black;
	}
	<!-- 일기장 목록 컨테이너 -->
	#main_container
	{
		position: absolute;
		top: 800px;
		left: 250px;
		width: 1200px;
		height: 1200px;
	}
	<!-- 일기장 목록 서브컨테이너 -->
	#sub_container
	{
		margin: 10px;
		padding: 10px;
		width: 1200px;
		height: 900px;
	}
	<!-- 일기장 목록을 포괄하는 div 화면보다 넘어가면 숨김 -->
	#main
	{
		overflow: hidden;
	}
	<!-- 일기장 목록 div 생성위치를 왼쪽으로부터 생성 -->
	#main > div
	{
		float: left;
	}
	<!-- 서브컨테이너의 자식 div들 -->
	#sub_container > div
	{
		position:relative;
		left: 20px;
		top: -20px;
		width: 450px;
		height: 500px;
		float: left;
		margin: 65px;
		padding: 40px;
		background-color: yellow;
	}
	<!-- 일기장 제목 -->
	.btitle
	{
		position:relative;
		display:table;
		font-size: 20px;
		top:30px;
		margin-left: auto;
		margin-right: auto;
		
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
		
		//일기장 목록 불러오기위한 기능 
		var listBook = function() {
			$.ajax({
				url:"listBook.do",
				success:function(data)
				{
					var list = eval("("+data+")");
					$.each(list,function(i,d){
						
						//일기장 목록 div
						var div = $("<div></div>");
						
						//일기장 제목
						var title = $("<span class='btitle'></span>").html(d.btitle);
						
						//일기장 삭제a태그
						var a = $("<a></a>")
						
						//remove 아이콘을 누르면 발생하여 선택한 일기장 삭제
						$(a).click(function() {
							re = confirm('정말로 삭제 하시겠습니까?');
							if(re == true)
							{
								location.href="deleteBook.do?bno="+d.bno;
							}	
							else
							{
								return;
							}	
						})
						
						//일기장 삭제 아이콘
						var remove = $("<span class='glyphicon glyphicon-remove' id='remove-location'></span>")
						
						//일기장 삭제a태그에 삭제아이콘 추가
						$(a).append(remove)
						
						//일기장 목록에 제목,삭제a태그 추가
						$(div).append(title,a)

						//일기장 서브컨테이너에 추가
						$("#sub_container").append(div)
					});
					
				}
			});
		}
		//일기장 목록 불러오기
		listBook();
		
	})

</script>
</head>
<body>
	<div class="title">
		<h1>그림 일기</h1>
	</div>
	<div id="main">
		<table id="main_container">
			<tr>
				<td>
					<table id="sub_container">
					</table>
				</td>
			</tr>
		</table>
	</div>

		  <div class="insertBook"><a href="insertBook.do"><span class="glyphicon glyphicon-plus" id="plus-location"></span></a></div>
		  <div class="insertBook2"><a href="insertBook.do"><span class="glyphicon glyphicon-plus" id="plus-location"></span></a></div>

	<div class="book_writer">
		<a href="insertBook.do">새 일기장</a>
	</div>
	
	<div class="menu">
		<a href="listBooka.do">일기장</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">즐겨찾기</a>
	</div>
	
	<div class="ifm">
		<a href="">성민규님</a><span>  |  </span><a href="">마이페이지</a><span>  |  </span><a href="">로그아웃</a>
	</div>
</body>
</html>