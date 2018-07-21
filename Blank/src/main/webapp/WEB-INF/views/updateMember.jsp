<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		position: absolute;
		width: 160px;
		height:100px;
		left: 40px;
		top: -10px;
	}
	.menu
	{ 
		font-family: 'Nanum Pen Script', serif;
		font-size: 40px;
		position: absolute;
		left: 1100px;
		top: 60px;
	}
	.ifm
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 25px;
		position: absolute;
		left: 1150px;
		top: 20px;
	}
	.f
	{
		position: relative;
		left: 600px;
		top: 220px;
	}
	.sub
	{
		font-family: 'Nanum Pen Script', serif;
		position: relative;
		font-size: 20px;
		top: 50px;
		left: 100px;
	}
	.s1
	{
		font-family: 'Nanum Pen Script', serif;
		position: relative;
		font-size: 20px;
		top: 50px;
		left: 200px;
	}
	.check
	{
		font-family: 'Nanum Pen Script', serif;
		position: relative;
		font-size: 50px;
		top: 230px;
		left: 350px;
	}
	.my
	{
		font-family: 'Nanum Pen Script', serif;
		position:relative;
		left:265px;
		top:-50px;
		font-size: 70px;
	}
	#tb
	{
		font-family: 'Nanum Pen Script', serif;
		position: relative;
		font-size:30px;
		width: 500px;
		height: 500px;
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
		
		$(".sub").click(function() {
			alert("회원정보가 수정 되었습니다.")
		})
		
		$(".s1").click(function() {
			re = confirm("작성하신 내용은 저장되지 않습니다.\n수정을 취소 하시겠습니까?")
			if(re)
			{
				location.href="myPage.do";
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
	
	<div class="check">
		<span class="my">회원정보 수정</span><br>
	</div>
	
	
	<div class="main">
		<form action="updateMember.do" method="post" class="f">
			<table id="tb">
				<tr>
					<td>아이디</td>
					<td>
						<input type="hidden" name="mno" id="mno" value="${mno }">
						<input type="text" name="id" id="id" value="${id }">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="pwd" id="pwd">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="name" id="name" value="${m.name }">
					</td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td>
						<input type="tel" name="phone" id="phone" value="${m.phone }">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="email" name="email" id="email" value="${m.email }">
					</td>
				</tr>
			</table>
				<input type="submit" value="수정" class="sub">
				<a class="s1">취소</a>
		</form>
	</div>
	
	
	
	
	
	<div class="menu">
		<a href="book.do">일기장</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">즐겨찾기</a>
	</div>
	
	<div class="ifm">
		<a href="">${id }님</a><span>  |  </span><a href="myPage.do">마이페이지</a><span>  |  </span><a href="">로그아웃</a>
	</div>
</body>
</html>