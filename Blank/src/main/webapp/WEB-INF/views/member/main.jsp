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
.blog article {

    float: left;
    width: 300px;
    height: 400px;
    margin-right: 30px;
    margin-bottom: 30px;
    cursor: pointer;
}

.blog article:last-child {
    margin-right: 0;
    
}

.btn-social {
  display: inline-block;
  height: 50px;
  width: 50px;
  border: 2px solid white;
  border-radius: 100%;
  text-align: center;
  font-size: 20px;
  line-height: 45px;
}


.btn-outline{
color:#fff;
font-size:20px;
border:2px solid #fff;
background:0 0;
transition:all .3s ease-in-out;
margin-top:15px
}
.btn-outline.active,.btn-outline:active,.btn-outline:focus,.btn-outline:hover{
color:#fff;
background:#fff;
border:2px solid #fff;
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


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="../resources/css/blank.css?ver=2">
<script type="text/javascript" src="../resources/js/menu.js" ></script>
<script type="text/javascript">
	$(function () {
		$.ajax({
			url: "mainList.do",
			success:function(data){				
				var list = eval("("+data+")");
				$.each(list, function(i, d) {
					var font = $('<font color="black"></font>')					
					var content = $('<div class="contents"></div>').html(d.dcontent);
					$(font).append(content);
					var div = $("<div class='diaryimg'></div>").attr({
						style: "background-image: url('../resources/upload2/"+d.dfile+"')",						
					});
					
					var article = $('<article></article').attr({
						onclick: "location.href='mainDetailDiary.do?dno="+d.dno+"'"
					})
					
					if (d.dphoto != null) {
						$(div).attr({
							style: "background-image: url('../resources/upload/"+d.dphoto+"')"
						})
					}else if (d.dfile == null && d.dphoto == null){
						$(div).attr({
							style: "background-image: url('../resources/upload/standard.png')"
						})
					}		
					$(article).append(div);
					$('#mainList').append(article);
					
					$(article).hover(function() {
						$(div).detach();
						$(this).append(content);
					}, function() {		
						$(this).append(div);
						$(content).detach();
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
						var id = $("<sapn></span>").html(v.id);
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
	    <a href="main.do"><img src="../resources/img/blank_black.png" class="logo left"></a>
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
		
		




	


<!-- 푸터입니다.  -->
<footer class="footer">
	<h2>비트와밀당하는 팀 X 빈칸 , 2018</h2>
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