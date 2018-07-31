<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gaegu|Gamja+Flower|Jua|Nanum+Brush+Script|Nanum+Gothic+Coding|Nanum+Myeongjo|Nanum+Pen+Script|Source+Sans+Pro|Stylish|Sunflower:300" rel="stylesheet">

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

.selectBook
{
	width: 960px;
	margin: 0 auto;
}

.insertForm{
	border: 1px solid black;
	width: 960px;
	margin: 0 auto;
	text-align: center;
}
/*insert 아이콘*/


.gi-5x{
	font-size: 50px;
	position: relative;
	
	
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
	
	.dcontent{
		border: 1px solid black;
		border-radius: 10px;
		width: 353px;
		height: 250px;
	}
	

	

</style>

<title>빈칸을 채우다.</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../resources/css/blank.css?ver=1">
<script type="text/javascript" src="../resources/js/menu.js" ></script>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		var mno = document.location.search.substr(5,4);		
		var bno = document.location.search.substr(14,1);		
		
		var selectBook = function(){
			$.ajax({
				url:"listBook.do",
				data:{"mno":mno},
				success:function(data)
				{
					var list = eval("("+data+")")
					$.each(list,function(i,b){
						var btitle = $("<option value="+b.bno+"></option>").html(b.btitle);
						$(".btitle").append(btitle);
									
					})
				}
			})
		}
		$(".btitle").change(function(){
			var btitle = $(".btitle").val();
			location.href="diary.do?mno="+mno+"&bno="+btitle+""
		})
		
		var listDiary = function () {
			
			$.ajax({
				url: "listDiary.do",	
				data: {"bno":bno,"mno":mno},
				success:function(data){				
					var list = eval("("+data+")");
					$.each(list, function(i, d) {
						//날짜 날씨 제목 그림 사진 글
						var div = $('<div class="listdiary"></div>');
						
						var a = $('<a href="detailDiary.do?dno='+d.dno+'"></a>')
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
						
						if (d.dfile != null) {							
							var img = $('<img></img>').attr({
								src: "../resources/upload2/" + d.dfile,
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
		selectBook();
		listDiary();
	});
	
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
		<div class="selectBook">
			<select class="btitle">
				<option value="">이동하고싶은 일기장을 선택하세요</option>
			</select>
		</div>
		<div class="insertForm">
			<a href="insertDiary.do"><span class="glyphicon glyphicon-plus gi-5x"></span></a>
		
		</div>
	
		<div id="main">
			<div id="main_container">
				
			</div>
		</div>
		
		
		
		
		<!-- 이렇게 사진만 띄우기 -->
		
		<div>
			<a data-fancybox="gallery" data-src="#modal" href="javascript:;" data-caption="Caption #1"><img width="300" src="../resources/img/adult.jpg"></a>
			<a data-fancybox="gallery" data-src="#modal2" data-caption="Caption #2"><img width="300" src="../resources/img/ho.jpg"></a>
		</div>
		
		
		<!-- 사진&글 -->
	      <div class="card-body">
	        <p>
	          	제목이랑정보나오게 하기
	        </p>
	        <p class="mb-0">
	          <a data-fancybox data-src="#modal" href="javascript:;" class="btn btn-primary">Open demo</a>
	        </p>
	         <div style="display: none;" id="modal">
	          <h2>Hello!</h2>
	          <p>You are awesome!</p>
	       	 </div>
		 </div>
		
		
	</div>
	
	
</div>

</body>
</html>


