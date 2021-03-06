<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빈칸을 채우다.</title>

<link rel="stylesheet" type="text/css" href="resources/css/login.css">

<style type="text/css">

	.main
	{
		position:relative;
		top:100px;
		width: 800px;
		height: 350px;
		text-align: center;

	}
	.phrases
	{
		position: relative;
		top: -100px;
		text-align: center;
	}
	.phrases1
	{
		font-size: 35px;
	}
	.phrases2
	{
		position:relative;
		font-size: 15px;
	}
	.infomation
	{
		font-size: 20px;
		position: relative;
		top: 30px;
		left:100px;
		text-align: center;
	}
	#searchId
	{
		position: relative;
		left:-100px;
		top: 50px;
	}
	#tb
	{
		position: relative;
		font-size:20px;
		width: 500px;
		height: 100px;
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
		
		$("#phone").keyup(function() {
			var textinput = $("#phone").val();
			textinput = textinput.replace(/[^0-9]/g, '');
			var tmp = ""

			if (textinput.length > 3 && textinput.length <= 7) {
				tmp += textinput.substr(0, 3);
				tmp += '-';
				tmp += textinput.substr(3);
				$("#phone").val(tmp);
			} else if (textinput.length > 7) {
				tmp += textinput.substr(0, 3);
				tmp += '-';
				tmp += textinput.substr(3, 4);
				tmp += '-';
				tmp += textinput.substr(7);
				$("#phone").val(tmp);
			}
		});
		
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
<div class="container-login100">
   
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
						<input type="text" name="name" id="name" style="text-align: center;" placeholder="이름">
					</td>
				</tr>
				<tr>
					<td align="center">휴대전화</td>
					<td>
						<input type="text" id="dd" value="+82">
						<input type="text" name="phone" id="phone" maxlength="13" style="text-align: center;" placeholder="휴대전화">
					</td>
				</tr>
			</table>
			<button id="searchId">확인</button>
		</div>
	</div>
</div>	
</body>
</html>