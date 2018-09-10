<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.content{
	text-align: center;
}
#diary{
	font-size: 20px;
}

#diary_title{
	font-size: 40px;
}

</style>
<title>빈칸을 채우다.</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="../resources/css/blank.css?ver=10">
<script type="text/javascript" src="../resources/js/menu.js?ver=1" ></script>
<script type="text/javascript">
		
</script>
</head>
<body>
<section id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	
	<a href="#"><img class="side_icon" src="../resources/img/icon/person.png">${id }님</a>
	<h5>회원정보</h5>
	<a href="pwdCheck.do?id=${id }">Edit</a>
	<a href="logOut.do?id=${id }">logout</a>
	<br>
	<h5>고객센터</h5>
	<a href="qNa.do">Contact</a>
	<br>
	<div class="side_icon_set">
		<a href="https://github.com/cjswn10/Blank"><img class="side_icon" alt="G" src="../resources/img/icon/git.png"></a>
		<a href="http://sc.bitcamp.co.kr/index.php?main_page=faq&action=use"><img class="side_icon" alt="B" src="../resources/img/icon/bit.png"></a>
	</div>
	
</section>

<div id="wrapper">

	<!-- main-menu -->
	<nav class="clearfix">
	    <a href="main.do"><img src="../resources/img/blank.png" class="logo left"></a>
	    <span style="cursor:pointer" onclick="openNav()">&#9776; </span>
	    <ul>
	        <li><a href="book.do">DIARY</a></li>
	        <li><a href="favorite.do">FAVORITES</a></li>
	        <li><a href="myPage.do">MYPAGE</a></li>
	    </ul>
	</nav>

	
	<div class="content" style="margin-top: 180px">
		<div class="row">
		  <div class="col-md-2" id="diary">일기날짜:</div>
		  <div class="col-md-2" id="diary">${d.ddate }</div>
		  <div class="col-md-2" id="diary">날씨:</div>
		  <div class="col-md-2" id="diary">${d.dweather }</div>
		  <div class="col-md-2" id="diary">작성(수정)일:</div>
		  <div class="col-md-2" id="diary">${d.wdate }</div>
		</div>
		
		<div class="row">
		  <div class="col-md-2" id="diary_title">제목:</div>
		  <div class="col-md-8" id="diary_title">${d.dtitle }</div>
		 
		</div>
		
		<c:if test="${not empty d.dfile}">	
			<img width="500" height="500" src="../resources/upload2/${d.dfile }"><br>
		</c:if>
		<c:if test="${not empty d.dphoto}">	
			<img width="500" height="500" src="../resources/upload/${d.dphoto }"><br>
		</c:if>
		<div class="row">
		  	<div class="col-md-2" id="diary">내용:</div>
		</div>
			<textarea class = form-control rows="10" cols="60" readonly="readonly" style="font-family: ${d.dfont}">${d.dcontent}</textarea> <br>
			<hr>
		
	</div>
</div>

<footer class="footer">
	<h3>비트와밀당하는 팀 X 빈칸 , 2018</h3>
	<ul class="list-inline">
       <li>
           <img alt="" src="../resources/img/ho.jpg" class="btn-social btn-outline">
           <br><h5>김영호</h5>
       </li>
       <li>
           <img alt="" src="../resources/img/adult.jpg" class="btn-social btn-outline">
           <br><h5>변성인</h5>
       </li>
       <li>
           <img alt="" src="../resources/img/min.jpg" class="btn-social btn-outline">
           <br><h5>성민규</h5>
       </li>
       <li>
           <img alt="" src="../resources/img/lim.jpg" class="btn-social btn-outline">
           <br><h5>임연주</h5>
       </li>
       <li>
           <img alt="" src="../resources/img/cha.jpg" class="btn-social btn-outline">
           <br><h5>차건우</h5>
       </li>
    </ul>
</footer>


	
	
		
</body>
</html>
