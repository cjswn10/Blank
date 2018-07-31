<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빈칸을 채우다.</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gaegu|Gamja+Flower|Jua|Nanum+Brush+Script|Nanum+Gothic+Coding|Nanum+Myeongjo|Nanum+Pen+Script|Source+Sans+Pro|Stylish|Sunflower:300" rel="stylesheet">

<link rel="stylesheet" href="../resources/css/blank.css?ver=1">
<script type="text/javascript" src="../resources/js/menu.js" ></script>
<script src="//code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(function() {
	var oldFont="${d.dfont}"
	var oldSecret=${d.secret}
	
	//이전 폰트설정
	$("#dcontent").attr({
		style : "font-family:${d.dfont}; font-size:35px;",
	});
	$.each($("#dfont").find("option"), function(i, f) {
		if($(f).val() == oldFont) {
			$(this).attr({
				selected : "selected"
			})
		}
	});
	
	//이전 공개유무 설정
	$.each($(".secret"), function(i, s) {
		console.log(  $(s).val()  );
		if($(s).val() == oldSecret) {
			$(this).attr({
				checked : "checked"
			})
		}
	});	
	
	//선택한 폰트 적용
	$("#dfont").change(function() {
		console.log($(this).val())
		$("#dcontent").attr({
			style : "font-family:"+$(this).val(),
			fontSize: "50px"
		})
		
		$("#dfont").attr({
			style : "font-family:"+$(this).val()
		})
	});

});
// 그림판 띄어주는 창
var openG;

function openGrimpan() {
	
	window.name = "insertDiary";
	openG = window.open("grimpan.do","grimpan","width=900,heigth=900");
}



</script>

<!-- 사진 보여주기 -->
<script>
	var sel_file;
	var sel_fileG;
	
	
	$(document).ready(function() {
		$("#upload").on("change", showImg)
	});
	
	function showImg(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				alert("확장자 오류");
				return;
			}
			
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#photo").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	
	$(document).ready(function() {
		$("#uploadG").on("change", showImgG)
	});
	
	function showImgG(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				alert("확장자 오류");
				return;
			}
			
			sel_fileG = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
</head>
<body>

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
	<hr>
	<form action="updateDiary.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="dno" id="dno" value="${d.dno}">

		<table>
			<tr>
				<td colspan="2">
					<label for="dtitle">제목 </label>
					<input type="text" name="dtitle" id="dtitle" required="required" value="${d.dtitle }">
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="ddate">날짜</label>
					<input type="date" name="ddate" id="ddate" required="required" value="${d.ddate }">
				</td>
				<td>
					<label for="dweather">날씨</label>
					<input type="text" name="dweather" id="dweather" value="${d.dweather }">
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<label for="dfont">글씨체</label>
					<select name="dfont" id="dfont">
						<option value="Nanum Brush Script" style="font-family: Nanum Brush Script" selected="selected" >Nanum Brush Script</option>
						<option value="Nanum Gothic Coding" style="font-family:Nanum Gothic Coding">Nanum Gothic Coding</option>
						<option value="Nanum Myeongjo" style="font-family:Nanum Myeongjo">Nanum Myeongjo</option>
						<option value="Nanum Pen Script" style="font-family:Nanum Pen Script">Nanum Pen Script</option>
						<option value="Stylish" style="font-family:Stylish">Stylish</option>
						<option value="Jua" style="font-family:Jua">Jua</option>
						<option value="Gamja Flower" style="font-family:Gamja Flower">Gamja Flower</option>
						<option value="Black Han Sans" style="font-family:Black Han Sans">Black Han Sans</option>
						<option value="Sunflower" style="font-family:Sunflower">Sunflower</option>
						<option value="Do Hyeon" style="font-family:Do Hyeon">Do Hyeon</option>
						<option value="Source Sans Pro" style="font-family:Source Sans Pro">Source Sans Pro</option>
						<option value="Gaegu" style="font-family:Gaegu">Gaegu</option>
					</select>
					<!-- 그림판 버튼 -->
					<button type="button" onclick="openGrimpan()"><img src="../resources/img/icon/pencil.png" alt="그리기" width="16px"></button>
	
					<label for="uploadG"><img alt="사진첨부" src="../resources/img/icon/draw.png" width="40px"></label>
					<input type="file" name="uploadG" id="uploadG" style="display: none;">
					
					<!-- 사진첨부 버튼 -->
					<label for="upload"><img alt="사진첨부" src="../resources/img/icon/picture.png" width="25px"></label>
					<input type="file" name="upload" id="upload" style="display: none;">
				</td>
			</tr>
			
			<!-- 
			
			그림, 사진 첨에 띄어주기
			
			 -->
			<tr>
				<td colspan="2">
					<!-- 그림 -->
					<c:if test="${not empty d.dfile}">
						<img id="img" width="300" height="300" src="../resources/upload2/${d.dfile}">
					</c:if>
					<!-- 사진 -->
					<c:if test="${not empty d.dphoto}">
						<img width="300" height="300" id="photo" src="../resources/upload/${d.dphoto}">
					</c:if>
					<br>
					<br>
					<!-- 글 -->
					<textarea rows="8" cols="40" name="dcontent" id="dcontent" style="font-family: ${d.dfont};">${d.dcontent }</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="radio" name="secret" class="secret" value=1> 나만보기
					<input type="radio" name="secret" class="secret" value=0> 전체공개<br>
				</td>
			</tr>
			
		</table>
		

<!-- 
		<label for="dtitle">제목 </label> <input type="text" name="dtitle" id="dtitle" value="${d.dtitle }">
		<div class="row">
			<label for="ddate" class="col-sm-2 control-label">날짜</label>
			<div class="col-xs-3">
				<input type="date" name="ddate" id="ddate" class="form-control" value="${d.ddate }" placeholder="">
			</div>
			<label for="dweather" class="col-sm-2 control-label">날씨</label>
			<div class="col-xs-3">
				<input type="text" name="dweather" id="dweather" class="form-control" value="${d.dweather }" placeholder="">
			</div>
		</div>
		<label for="dfont">글씨체</label>
		
		<select name="dfont" id="dfont">
			<option value="Nanum Brush Script" style="font-family: Nanum Brush Script">Nanum Brush Script</option>
			<option value="Nanum Gothic Coding" style="font-family:Nanum Gothic Coding">Nanum Gothic Coding</option>
			<option value="Nanum Myeongjo" style="font-family:Nanum Myeongjo">Nanum Myeongjo</option>
			<option value="Nanum Pen Script" style="font-family:Nanum Pen Script">Nanum Pen Script</option>
			<option value="Stylish" style="font-family:Stylish">Stylish</option>
			<option value="Jua" style="font-family:Jua">Jua</option>
			<option value="Gamja Flower" style="font-family:Gamja Flower">Gamja Flower</option>
			<option value="Black Han Sans" style="font-family:Black Han Sans">Black Han Sans</option>
			<option value="Sunflower" style="font-family:Sunflower">Sunflower</option>
			<option value="Do Hyeon" style="font-family:Do Hyeon">Do Hyeon</option>
			<option value="Source Sans Pro" style="font-family:Source Sans Pro">Source Sans Pro</option>
			<option value="Gaegu" style="font-family:Gaegu">Gaegu</option>
		</select><br>
		<textarea class="form-control" rows="10" name="dcontent" id="dcontent">${d.dcontent }</textarea><br>
		그림 : <input type="text" name="dfile" value="${d.dfile }"><br>
		사진 : <input type="file" name="upload"><br>
		현재 파일 : <img src="../resources/upload/${d.dphoto }" width="100%">
		<input type="hidden" name="dphoto" value="${d.dphoto }">
		<input type="hidden" name="dtype" value="${d.dtype }">
		<br>
		<input type="radio" name="secret" class="secret" value=1> 비공개
		<input type="radio" name="secret" class="secret" value=0> 전체공개<br>
 -->

		<button type="submit">수정</button>
	</form>
	</div>
</div>
</body>
</html>