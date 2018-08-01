<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

.diaryimg{
	position: relative;    
    width: 300px;
    height: 400px;
    float: left;
    background-size: contain;
	background-repeat: no-repeat;
}
.contents{	
	width: 300px;
	height: 400px;
	position: absolute;
	white-space: pre-line;
	background-color: pink;
	opacity: 0.8;
	overflow: hidden;	
}

@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

<!-- 랜딩 컨테이너 작업  -->
.container {
    width: 960px;
    margin: 0 auto;
}

.landing {
    width: 70%;
    height: 600px;
    margin: auto;
    
    background-image: url("../resources/img/mainlogo.jpg");
    
    background-size: cover;
    background-position: center center;
}
.landing > .container {
    padding-top: 200px;
}

.blog {
	position: relative;
 	width: 1400px;
 	margin: 0 auto;
    padding: 100px 0;
}
.dform {

    float: left;
    width: 300px;
    height: 400px;
    margin-right: 30px;
    margin-bottom: 30px;
    cursor: pointer;
}

.dform:last-child {
    margin-right: 0;
    
}

#test
	{
		border: 1px solid black;
		width: 175px;
		height: 150px;
	}

.mainSearchId
{
	position:relative;
	top:30px;
	margin-left: auto;
	margin-right: auto;
	width: 300px;
	height: 100px;
}

</style>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- Jquery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.js"></script>

<link rel="stylesheet" href="../resources/css/blank.css?ver=4">
<script type="text/javascript" src="../resources/js/menu.js" ></script>
<script type="text/javascript">
	$(function () {
		$.ajax({
			url: "mainList.do",
			success:function(data){				
				var list = eval("("+data+")");
				$.each(list, function(i, d) {
					
					var font = $('<font color=" "></font>')					
					var contents = $('<div class="contents"></div>').html(d.dcontent);
					$(font).append(contents);
					
					/*
					var diaryDiv = $('<div class="dform"></div>').attr({
						onclick: "location.href='mainDetailDiary.do?dno="+d.dno+"'"
					})
					*/
					var diaryDiv = $('<div class="dform"></div>');
					
					
					var div = $("<div class='diaryimg'></div>").attr({
						style: "background-image: url('../resources/upload2/"+d.dfile+"')",						
					});
					
					if (d.dfile == null && d.dphoto != null) {
						$(div).attr({
							style: "background-image: url('../resources/upload/"+d.dphoto+"')"
						})
					}else if (d.dfile == null && d.dphoto == null){
						$(div).attr({
							style: "background-image: url('../resources/upload/standard.png')"
						})
					}
					
					//fancybox를 위한 a태그와 div
					var a = $('<a data-fancybox="gallery" data-src="#modal'+ d.dno +'" href="javascript:;"></a>');
					var modalBox = $('<div style="display: none;max-width:800px;" id="modal'+d.dno+'"></div>');
					
					var src = "../resources/upload2/" + d.dfile;
					if(d.dfile == null && d.dphoto != null) {
						src = "../resources/upload/" + d.dphoto;
					} else if (d.dfile == null && d.dphoto == null) {
						src = "../resources/upload/standard.png";
					}
					var filephoto = $("<img></img>").attr({
						src : src,
						width : "400px"
					});

					var dtitle = $("<h5></h5>").html(d.dtitle);
					var ddate = $("<h5></h5>").html(d.ddate);
					var dweather = $("<h5></h5>").html(d.dweather);
					//var writermno = $("<h5></h5>").html(d.mno);
					var dcontent = $("<h5></h5>").html(d.dcontent);
					$(modalBox).append(dtitle, ddate, dweather, filephoto, dcontent);	
					//var others = $('<a href="favoritesDiary.do?mno="'+d.mno+'></a>');
					$("#modal").append(modalBox);
					
					
					
					$(diaryDiv).append(div);
					
					$(a).append(diaryDiv);
					$('#mainList').append(a);
					
					$(diaryDiv).hover(function() {
						$(div).detach();
						$(this).append(contents);
					}, function() {		
						$(this).append(div);
						$(contents).detach();
						$(font).detach();
					})
				})
			}
		})
		$("#test").hide();
		
		$("#id").keyup(function() {
			
			$("#test").empty();
			$.ajax({
				url:"mainSearchId.do",
				data:{"id":this.value},
				success:function(data)
				{
					
					var arr = eval("("+data+")")
					$.each(arr,function(i,v){
						var id = $("<span></span>").html(v.id);
						var br = $("<br>");
						$("#test").append(id,br);
						
						$(id).click(function() {
							$("#id").val(v.id)
							$("#test").hide();	
							//location.href="favoritesDiary.do?fmno="+v.mno+"&id="+v.id+"";
						})
						$("#btnMove").click(function(){
							location.href="favoritesDiary.do?fmno="+v.mno+"&id="+v.id+"";
						})
						
					})
				}
			})
			
			if(this.value != null)
			{
				$("#test").show();	
			}	
			
		})
		
	})
</script>
<title>빈칸을 채우다.</title>
</head>
<body>
<!-- side-menu -->
<section id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	
	<a href="#"><img class="side_icon" src="../resources/img/icon/person.png">${id }님</a>
	<h5>회원정보</h5>
	<a href="pwdCheck.do?id=${id }">Edit</a>
	<a href="logOut.do">logout</a>
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

	<div class="mainSearchId">
	<input type="text" name="id" id="id">
	<button id="btnMove">이동</button>
	<div id="test"></div>
</div>
	
		<div class="landing">
			<div class="container">
	
			</div>
			
		</div>

</div>
	
	
	<div class="container">
		
		   <div class="blog" align="center">
		   		<div class="clearfix" id="mainList">
	
		    	</div>
		   </div> 	    
	</div>
		
		
	<!-- modal들을 넣을 div -->
	<div id="modal"></div>
		


<!-- 푸터입니다.  -->
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