<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gaegu|Gamja+Flower|Jua|Nanum+Brush+Script|Nanum+Gothic+Coding|Nanum+Myeongjo|Nanum+Pen+Script|Source+Sans+Pro|Stylish|Sunflower:300" rel="stylesheet">

<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

	/*로고 표시 */
	.title
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 80px;
		position: relative;
		width: 160px;
		height:100px;
		left: 40px;
		top: -10px;
	}
	/* 일기장,즐겨찾기 */
	.menu
	{ 
		font-family: 'Nanum Pen Script', serif;
		font-size: 40px;
		position: relative;
		width:300px;
		left: 1100px;
		top: -560px;
	}
	/* id,마이페이지,로그아웃 */
	.ifm
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 25px;
		position: relative;
		width:350px;
		left: 1150px;
		top: -660px;
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
		position: absolute;
		top: 780px;
		left: 250px;
		width: 1200px;
		height: 1200px;
		
	}
	/* 일기장 목록 서브컨테이너 */
	#sub_container
	{
		margin: 10px;
		padding: 10px;
		width: 1200px;
		height: 900px;
	}
	/* 일기장 목록을 포괄하는 div 화면보다 넘어가면 숨김 */
	#main
	{
		overflow: hidden;
	}
	/* 일기장 목록 div 생성위치를 왼쪽으로부터 생성*/
	#main > div
	{
		float: left;
	}
	/* 서브컨테이너의 자식 div들 */
	#sub_container > div
	{
		position:relative;
		left: 50px;
		top: -50px;
		width: 350px;
		height: 500px;
		float: left;
		margin: 100px;
		padding: 40px;
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

</style>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		var mno = document.location.search.substr(5,4);		
		var bno = document.location.search.substr(14,1);		
		
		var listDiary = function () {
			
			$.ajax({
				url: "listDiary.do",	
				data: {"bno":bno,"mno":mno},
				success:function(data){				
					var list = eval("("+data+")");
					$.each(list, function(i, d) {
						//날짜 날씨 제목 그림 사진 글
						var div = $('<div ></div>');
						
						var a = $('<a href="detailDiary.do?dno='+d.dno+'"></a>')
						var br = $('<br>');

						var p = $('<textarea rows="8" cols="30" readonly="readonly"></textarea>').html(d.dcontent);
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
							$("#sub_container").append(div);
						}else {
							$(a).append(p);
							$(div).append(a);
							$("#sub_container").append(div);					

						}		            
					})				
			}})		
		}
		listDiary();
		
	})
	
</script>
</head>
<body>
	<div class="title">
		<h1>그림 일기</h1>
	</div>
	<div id="main">
		<table id="main_container">
			<tr>
				<td>
					<table id="sub_container">
					</table>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="insertBook"><a href="insertDiary.do"><span class="glyphicon glyphicon-plus" id="plus_location"></span></a></div>
	
	<div class="menu">
		<a href="book.do">일기장</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="favorite.do">즐겨찾기</a>
	</div>
	
	<div class="ifm">
		<a href="#">${id }님</a><span>  |  </span><a href="myPage.do">마이페이지</a><span>  |  </span><a href="logOut.do">로그아웃</a>
	</div>
</body>
</html>