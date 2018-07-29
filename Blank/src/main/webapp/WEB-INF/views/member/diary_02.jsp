<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gaegu|Gamja+Flower|Jua|Nanum+Brush+Script|Nanum+Gothic+Coding|Nanum+Myeongjo|Nanum+Pen+Script|Source+Sans+Pro|Stylish|Sunflower:300" rel="stylesheet">

<title>빈칸을 채우다.</title>
<style type="text/css">

	/* id,마이페이지,로그아웃 */
	.ifm
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 25px;
		position: relative;
		width:350px;
		left: 1150px;
		/*top: -700px;*/
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
	.selectBook
	{
		position: relative;
		left: 50px;
		top: 100px;
	}
	.btitle
	{
		width: 250px;
		height: 40px;
	}

</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="../resources/css/blank.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
var list;
var mno = ${mno}
var bno = ${bno}
var listDiary = function () {
	
	$.ajax({
		url: "listDiary.do",	
		data: {"bno":bno,"mno":mno},
		success:function(data){				
			list = eval("("+data+")");
			
			/*
			$.each(list, function(i, d) {
				//날짜 날씨 제목 그림 사진 글
				var div = $('<div></div>');
				
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
			*/
	}})		
};


	$(function () {
		//var mno = document.location.search.substr(5,4);		
		//var bno = document.location.search.substr(14,1);		
		
		
		
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
		
		
		
		
		
		selectBook();
		listDiary();
	});
	
</script>
</head>
<body>

<nav class="clearfix">
    <img src="../resources/img/blank.png" class="logo left">
    <ul>
        <li><a href="book.do">DIARY</a></li>
        <li><a href="favorite.do">FAVORITES</a></li>
        <li><a href="myPage.do">MYPAGE</a></li>
    </ul>
</nav>

  <div class="ifm">
		<a href="#">${id }님</a><span>  |  </span><a href="myPage.do">마이페이지</a><span>  |  </span><a href="logOut.do">로그아웃</a>
	</div>



	<div class="selectBook">
		<select class="btitle">
			<option value="">이동하고싶은 일기장을 선택하세요</option>
		</select>
	</div>
	
	<span id="test"></span>
	<div class="insertBook"><a href="insertDiary.do"><span class="glyphicon glyphicon-plus" id="plus_location"></span></a></div>
	
	<!-- c -->
	<c:forEach items="${list }" var="d">
		<h1>리스트1</h1>
		<div>${d.dno }</div>
		<div>&{d.dno }</div>
		<div>d.dno</div>
	</c:forEach>
	
	
	
	<div>
	
	</div>
	
</body>
</html>