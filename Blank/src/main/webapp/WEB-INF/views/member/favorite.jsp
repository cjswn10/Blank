<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빈칸을 채우다.e</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="../resources/css/blank.css">
<script type="text/javascript" src="../resources/js/menu.js" ></script>

<script type="text/javascript">
	$(function() {
		
		var fno;
		
		var listFavorite = function() {
			$.ajax({
			url:"listFavorite.do",
			data:{"mno":$("#mno").val()},				
			success:function(data) {
				var list = eval("("+data+")");					
				$.each(list,function(i,f){	
          
					var img = $("<img src='../resources/img/favoriteicon.png'>")
					var a = $("<a href='favoritesDiary.do?fmno="+f.fmno+"&fno="+f.fno+"&id="+f.id+"'></a>").html(f.id+"님");					

					var li = $("<li></li>")
					var removeimg = $("<a href='deleteFavorite.do?fno="+f.fno+"' class='glyphicon glyphicon-remove' id='plus_location'></a>");
					
					$(li).append(img,a,removeimg);
					$("#list").append(li);
				});
			}});
		};
		listFavorite();
	});
</script>
</head>
<body style="background-image: url('https://png.pngtree.com/thumb_back/fw800/back_pic/03/74/41/5757bc295499924.jpg');">

	<input type="hidden" name="mno" id="mno" value="${mno}">
	<input type="hidden" name="fmno" id="fmno" value="${fmno}">

<!-- side-menu -->
<section id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	
	
	<a href="#"><img class="side_icon" src="../resources/img/icon/person.png">${id }님</a>
	<a href="logOut.do">logout</a>
	<a href="qNa.do">Contact</a>
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

	<div class="content" >
		<h2>즐겨 찾기</h2>
		
		<ul id="list"></ul>
		
	</div>
</div>	
</body>
</html>