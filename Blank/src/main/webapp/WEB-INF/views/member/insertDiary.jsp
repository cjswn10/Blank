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
	
	//선택한 폰트 dfont, dcontent에 적용
	$("#dfont").change(function() {
		console.log($(this).val())
		$("#dcontent").attr({
			style : "font-family:"+$(this).val()
		})
		
		$("#dfont").attr({
			style : "font-family:"+$(this).val()
		})
		
	});
	
});

var openG;

function openGrimpan() {
	
	window.name = "insertDiary";
	openG = window.open("grimpan.do","grimpan","width=900,heigth=900");
}

</script>

<title>빈칸을 채우다.</title>

<!-- 사진 보여주기 -->
<script>
	var sel_file;
	var sel_file2;
	

	$(document).ready(function() {
		$("#upload").on("change", showImg)
	});

	function showImg(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
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
		$("#upload2").on("change", showImg2)
	});

	function showImg2(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자 오류");
				return;
			}

			sel_file2 = f;
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
	<h2>일기 등록</h2>
	<hr>

	<form action="insertDiary.do" method="post" enctype="multipart/form-data">
	
		<input type="hidden" name="bno" id="bno" value="${bno }"><br> 
		<input type="hidden" name="mno" id="mno" value="${mno }"><br> 
		
		<table>
			<tr>
				<td colspan="2">
					<label for="dtitle">제목 </label>
					<input type="text" name="dtitle" id="dtitle" required="required">
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="ddate">날짜</label>
					<input type="date" name="ddate" id="ddate" required="required">
				</td>
				<td>
					<label for="dweather">날씨</label>
					<input type="text" name="dweather" id="dweather">
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
					<input type="file" name="upload2" id="upload2"> 
					<!-- 사진첨부 버튼 -->
					<label for="upload"><img alt="사진첨부" src="../resources/img/icon/photo.png" width="25px"></label>
					<input type="file" name="upload" id="upload" style="display: none;">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- 그림 -->
					<img id="img" width="300">
					<!-- 사진 -->
					<img id="photo" width="300">
					<!-- 글 -->
					<textarea class="form-control" rows="10" name="dcontent" id="dcontent" style="font-family: Nanum Brush Script"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="radio" name="secret" value=1 checked="checked">나만보기
					<input type="radio" name="secret" value=0>전체공개
				</td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td>
					<button type="submit">등록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>