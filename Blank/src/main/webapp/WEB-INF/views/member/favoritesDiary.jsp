<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gaegu|Gamja+Flower|Jua|Nanum+Brush+Script|Nanum+Gothic+Coding|Nanum+Myeongjo|Nanum+Pen+Script|Source+Sans+Pro|Stylish|Sunflower:300" rel="stylesheet">

<title>빈칸을 채우다.</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);		
	
	#user_id{
		font-family: 'Nanum Pen Script', serif;
		font-size: 50px;		
	}


	/* 새일기장 만들기 */
	.insertBook
	{
		font-size: 25px;
		position: relative;
		width: 353px;
		border: 1px solid black;
		height:500px;
		left: 450px;
		top: 110px;
	}
	/* 일기장 목록 컨테이너 */
	#main_container
	{
		width: 960px;
		margin: 0 auto;
		
	}
	/* 일기장 목록을 포괄하는 div 화면보다 넘어가면 숨김 */
	#main
	{
		overflow: hidden;
	}
	/* 서브컨테이너의 자식 div들 */
	#main_container > div
	{
		position:relative;
		width: 350px;
		float: left;
		margin: 50px;
		padding: 10px;
		font-size: 30px;
		
	}
	/* plus 아이콘위치 */
	#plus_location
	{
		position: relative;
		top:180px;
		display:table;
		margin-left: auto;
		margin-right: auto;
	}
	/* plus 아이콘 */
	.glyphicon-plus
	{
		font-size: 400%;
		color: black;
	}
	
	.dcontent{
		border: 1px solid black;
		border-radius: 10px;
		width: 353px;
		height: 250px;
	}
	#user_id
	{
		position: relative;
		top: -100px;
		text-align: center;
	}

</style>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/blank.css?ver=1">
<script type="text/javascript" src="../resources/js/menu.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.6.1.min.js"></script>
<script type="text/javascript">
	$(function () {				
		var mno = ${mno}
		var fmno = document.location.search.substr(6,4);
		var fno = document.location.search.substring(15, document.location.search.lastIndexOf("&"));
		var id = document.location.search.substring(document.location.search.lastIndexOf("=")+1)
		$('#user_id').text(id + "님의 일기");
		$('	<img class="favoriteIcon" width="50" height="50" src="../resources/img/nfavorite.png">').appendTo('#user_id');
		
		var listFavoriteDiary = function () {			
						
			$.ajax({
				url: "favoriteDiaryList.do",	
				data: {"fmno":fmno},
				success:function(data){				
					var list = eval("("+data+")");
					$.each(list, function(i, d) {
						//날짜 날씨 제목 그림 사진 글
						var div = $('<div ></div>');
						
						var a = $('<a href="detailFavoriteDiary.do?dno='+d.dno+'"></a>')
						var br = $('<br>');						
						var p = $('<div class="dcontent"></div>').html(d.dcontent);
						$(p).attr({
							style: "font-family:"+d.dfont
						})
            
						if (d.dphoto != null) {							
							var img = $('<img></img>').attr({
								src: "../resources/upload/" + d.dphoto,
								width: "353",
								height: "250"					
							});
							$(a).append(img);
							$(div).append(a,br,p);
							$("#main_container").append(div);
						}else {
							$(a).append(p);
							$(div).append(a);
							$("#main_container").append(div);					

						}		            
					})				
			}})		
		}
	
		
		listFavoriteDiary();		
		
		if (fmno) {
			$('.favoriteIcon').toggle(function () {
				$(this).attr("src", "../resources/img/favorite.png")
				
				$.ajax({
					url: "insertFavorite.do",
					data: {"fmno":fmno, "mno":mno},
					type: "POST",
					success:function(data){
						alert("추가 완료")
					},error: function (data) {
						alert("추가 실패")
					}
				})			
				
			},function(){
				$(this).attr("src", "../resources/img/nfavorite.png")
				
				$.ajax({
					url: "deleteFavorite.do",
					data: {"fno":fno},				
					success:function(){
						alert("삭제 완료")
					}
				})			
			})			
		}else{			
			$('.favoriteIcon').toggle(function () {
				$(this).attr("src", "../resources/img/nfavorite.png")
				
				$.ajax({
					url: "deleteFavorite.do",
					data: {"fno":fno},				
					success:function(){
						alert("삭제 완료")
					}
				})			
				
			},function(){
				$(this).attr("src", "../resources/img/favorite.png")
				
				$.ajax({
					url: "insertFavorite.do",
					data: {"fmno":fmno, "mno":mno},
					type: "POST",
					success:function(){
						alert("추가 완료")
					}
				})			
			}	 		
		)}
	})
	
</script>
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
	    <a href="main.do"><img src="../resources/img/blank_pink.png" class="logo left"></a>
	    <span style="cursor:pointer" onclick="openNav()">&#9776; </span>
	    <ul>
	        <li><a href="book.do">DIARY</a></li>
	        <li><a href="favorite.do">FAVORITES</a></li>
	        <li><a href="myPage.do">MYPAGE</a></li>
	    </ul>
	</nav>

	
	<div class="content" style="margin-top: 180px">
		<div id="user_id">
							
			</div>
		<div id="main">
			<div id="main_container">
				
			</div>
			
		</div>
		
		
		
		
	</div>
	
	
</div>
	
	
	
	
	
	
</body>
</html>