<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		position: relative;
		width:400px;
		left: 1100px;
		top: -860px;
	}
	/* id,마이페이지,로그아웃 */
	.ifm
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 25px;
		position: relative;
		width:300px;
		left: 1150px;
		top: -960px;
	}
	.book
	{ 
		position: relative;
		left: 300px;
		top: 100px;
		background-color:pink;
		width: 500px;
		height: 570px;
	}
	.aa
	{
		position: absolute;
		left: 120px;
		top: 100px;
		text-align: center;
		font-size: 20px;
		
	}
	.s1
	{
		position: relative;
		left: 180px;
		top: 500px;
	}
	.false
	{
		position: relative;
		left: 230px;
		top: 500px;
	}
	.containe
	{
		position: relative;
		width: 600px;
		height: 800px;
		top: -30px;
		left: 50px;
	}
	.container
	{
		position: relative;
		top: 50px;
		left: 650px;	
		width: 100%;
	}
	
	.custom-size .colorpicker-saturation 
	{
		width: 250px;
		height: 250px;
	}
 
	.custom-size .colorpicker-hue,
	.custom-size .colorpicker-alpha 
	{
		width: 40px;
		height: 250px;
	}
 
	.custom-size .colorpicker-color,
	.custom-size .colorpicker-color div 
	{
		height: 40px;
	}
	
</style>

<!-- 색상구현 css -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/dist/css/bootstrap-colorpicker.css" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.js"></script>

<!-- 색상구현 자바스크립트 -->
<script src="resources/dist/js/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$('#color-picker-size').colorpicker(
				{
					customClass: 'custom-size',
					sliders: {
					  saturation: {
						maxLeft: 250,
						maxTop: 250
					  },
					  hue: {
						maxTop: 250
					  },
					  alpha: {
						maxTop: 250
					}
				}
				 
			});
		
		$(".false").click(function() {
			re = confirm('작성하신 내용이 삭제될수 있습니다.\n사이트에서 나가시겠습니까?');
			if(re == true)
			{
				location.href="book.do"
			}	
			else
			{
				return;
			}	 
		})
		$(".s1").click(function() {
			alert("일기장이 수정되었습니다.")
		})
	})
</script>
</head>
<body>
	<div class="title">
		<h1>그림 일기</h1>
	</div>
	
	<div class="containe">
		<div class="book">
			<form action="updateBook.do" method="post" id="f">
				<input type="hidden" name="bno" value="${b.bno }">
				<input type="text" name="btitle" class="aa" value="${b.btitle }" height="50" width="30">
				<div class="container">
					<div class="row">
					    <div class="col-md-5">
							<div class="example">
			    				<div class="example-content well">
			        				<div class="example-content-widget">
			          					<input id="color-picker-size" type="text" name="bcolor" value="${b.bcolor }" class="form-control"/>
									</div>
			   					</div>
							</div>
			  			</div>
					</div>
				</div>
				<input class="s1" type="submit" value="수정">
				<a class="false">취소</a>
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