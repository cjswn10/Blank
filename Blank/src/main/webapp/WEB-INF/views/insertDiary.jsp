<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gaegu|Gamja+Flower|Jua|Nanum+Brush+Script|Nanum+Gothic+Coding|Nanum+Myeongjo|Nanum+Pen+Script|Source+Sans+Pro|Stylish|Sunflower:300" rel="stylesheet">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<script type="text/javascript">
$(function() {
	$("#dfont").change(function() {
		console.log($(this).val())
		$("#dcontent").attr({
			style : "font-family:"+$(this).val()
		})
		
		$("#dfont").attr({
			style : "font-family:"+$(this).val()
		})
		
		//alert($(this).children("option:selected").text());
	});
});

var openG;

function openGrimpan() {
	
	window.name = "insertDiary";
	openG = window.open("grimpan.do","grimpan","width=900,heigth=900");
}

</script>
<title>Insert title here</title>
</head>
<body>
	<h2>일기 등록</h2>
	<hr>

	<form action="insertDiary.do" method="post" enctype="multipart/form-data">
	
		<input type="hidden" name="bno" id="bno" value="${bno }"><br> 
		<input type="hidden" name="mno" id="mno" value="${mno }"><br> 
	
		<label for="dtitle">제목 </label> <input type="text" name="dtitle" id="dtitle" required="required">
		<div class="row">
			<label for="ddate" class="col-sm-2 control-label">날짜</label>
			<div class="col-xs-3">
				<input type="date" name="ddate" id="ddate" class="form-control" required="required" placeholder=".col-xs-2">

			</div>
			<label for="dweather" class="col-sm-2 control-label">날씨</label>
			<div class="col-xs-3">
				<input type="text" name="dweather" id="dweather"
					class="form-control" placeholder="">
			</div>
		</div>


		<label for="dfont">글씨체</label>
		<select name="dfont" id="dfont">
			<option value="Nanum Brush Script" style="font-family: Nanum Brush Script" selected="selected" >Nanum Brush Script</option>
			<!-- <option value="Nanum Gothic" style="font-family: Nanum Gothic">Nanum Gothic</option> -->
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
		<textarea class="form-control" rows="10" name="dcontent" id="dcontent" style="font-family: Nanum Brush Script"></textarea><br>
    
		<input type="text" name="dfile"> 
		<input type="button" value="그림판열기" onclick="openGrimpan()"><br>
		사진 : <input type="file" name="upload">
		<br>
		<input type="radio" name="secret" value=1 checked="checked"> 비공개
		<input type="radio" name="secret" value=0> 전체공개<br>

		<button type="submit">등록</button>
	</form>
</body>
</html>