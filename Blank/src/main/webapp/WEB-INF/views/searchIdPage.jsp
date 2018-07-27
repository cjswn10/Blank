<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빈칸을 채우다.</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	.title h1
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 80px;
		width:300px;
		position: relative;
		top:10px;
		left: 600px;
	}
	.main
	{
		position:relative;
		left:300px;
		top:200px;
		width: 600px;
		height: 500px;
	}
	.phrases
	{
		position: relative;
		top: -100px;
		left: 50px;
	}
	.phrases1
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 40px;
	}
	.phrases2
	{
		position:relative;
		left:50px;
		font-family: 'Nanum Pen Script', serif;
		font-size: 20px;
	}
	.infomation
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 20px;
		position: relative;
		top: 30px;
		left: 200px;
	}
	#searchId
	{
		position: relative;
		top: 50px;
		left: 200px;
	}
	#tb
	{
		font-family: 'Nanum Pen Script', serif;
		position: relative;
		font-size:30px;
		width: 500px;
	}
	#name
	{
		width: 243px;
		height: 30px;
	}
	#phone
	{
		width: 200px;
		height: 30px;
	}
	#dd
	{
		width: 40px;
		height: 30px;
	}
	.glyphicon-search
	{
		font-size: 200%;
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
		$("#searchId").click(function() {
			$.ajax({
				url:"searchId.do",
				data:{"name":$("#name").val(),"phone":$("#phone").val()},
				success:function(data)
				{
					if(data != "")
					{
						var re = confirm("고객님의 아이디는 "+data+" 입니다.")
						if(re)
						{
							location.href="search.do";
						}
						else
						{
							return;
						}
					}
					else
					{
						confirm("고객님의 정보를 확인해주세요.")
					}	
				}
			})
		})
		
	})
</script>
</head>
<body>
	<div class="title">
		<h1>그림 일기</h1>
	</div>
	<div class="main">
		
		<div class="phrases">
			<span class="glyphicon glyphicon-search"></span>
			<span class="phrases1">회원정보에 등록한 이름과 휴대전화 ID 찾기</span><br>
			<span class="phrases2">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야 합니다.</span>
		</div>
		<div class="infomation">
			<table id="tb">
				<tr>
					<td align="center" width="150">이름</td>
					<td width="200">
						<input type="text" name="name" id="name" style="text-align: center;">
					</td>
				</tr>
				<tr>
					<td align="center">휴대전화</td>
					<td>
						<input type="text" id="dd" value="+82">
						<input type="text" name="phone" id="phone" style="text-align: center;">
					</td>
				</tr>
			</table>
			<button id="searchId">확인</button>
		</div>
	</div>
</body>
</html>