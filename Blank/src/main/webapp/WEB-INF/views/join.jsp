<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$.ajax("/checkId.do", function() {
		data: 
		
	})
	
	$("#pwd2").click(function() {
		setInterval(function() {
			if($("#pwd").val() != $("#pwd2").val()){
				$("#checkPwd").html("비밀번호를 확인해주세요");
			}else{
				$("#checkPwd").html("");
			}
		}, 100);
		
	});
	
	$("#joinBtn").click(function() {
		location.href = "join.do";
	});
	

})
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="#" method="post">
	아이디 : <input type="text" name="id" id="id"> <button id="checkId"></button><br>
	비밀번호 : <input type="password" name="pwd" id="pwd"><br>
	비밀번호 확인: <input type="password" id="pwd2">
	<span id="checkPwd"></span><br>
	이름 : <input type="text" name="name"><br>
	이메일 : <input type="email" name="email"><br>
	연락처 : <input type="text" name="phone"><br>
	<button type="submit" id="joinBtn" class="btn btn-default">가입</button>
</form>

</body>
</html>