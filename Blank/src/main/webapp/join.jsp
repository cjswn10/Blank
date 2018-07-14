<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS 및  js -->
	<title>빈칸을 채우다.</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="resources\img/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!--===============================================================================================-->


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
   
   $("#pwd2").click(function() {
      setInterval(function() {
         if($("#pwd").val() != $("#pwd2").val()){
            $("#pwdcheck").html("비밀번호를 확인해주세요");
         }else{
            $("#pwdcheck").html("");
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
<div class="container-login100">
	
	<form action="jonin.do" method="post">
	<h2>회원가입 </h2>
	<div class="form-group">
	    <label>아이디 </label>
	    <input type="text" class="form-control" name="id" id="id" placeholder="아이디">
	</div>
	<div class="form-group">
	    <label>비밀번호 </label>
	    <input type="password" class="form-control" name="pwd" id="pwd" placeholder="암호">
    </div>
    <div class="form-group">
	    <label>비밀번호확인 </label>
	    <input type="password" class="form-control" id="pwd2" placeholder="암호확인">
    </div>
    <div class="form-group">
	    <label>이름  </label>
	    <input type="text" class="form-control" name="name" placeholder="이름">
    </div>
    <div class="form-group">
	    <label>이메일 </label>
	    <input type="email" class="form-control" name="email" placeholder="이메일">
    </div>
    <div class="form-group">
	    <label>연락처 </label>
	    <input type="text" class="form-control" name="phone" placeholder="연락처">
    </div>
	
	   <button type="submit" id="joinBtn" class="btn btn-default">가입</button>
	</form>
</div>
</body>
</html>