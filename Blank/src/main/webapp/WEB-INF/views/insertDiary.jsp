<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>일기 등록</h2>
	<hr>
	<form action="insertDiary.do" method="post" enctype="multipart/form-data">
	
		<input type="hidden" name="bno" id="bno" value="${bno }"><br> 
		<input type="hidden" name="mno" id="mno" value="${mno }"><br> 
	
		<label for="dtitle">제목 </label> <input type="text" name="dtitle" id="dtitle">
		<div class="row">
			<label for="ddate" class="col-sm-2 control-label">날짜</label>
			<div class="col-xs-3">
				<input type="date" name="ddate" id="ddate" class="form-control" placeholder=".col-xs-2">
			</div>
			<label for="dweather" class="col-sm-2 control-label">날씨</label>
			<div class="col-xs-3">
				<input type="text" name="dweather" id="dweather" class="form-control" placeholder="">
			</div>
		</div>
		<label for="dfont">글씨체</label>
		<select name="dfont" id="dfont">
			<option value="Nanum Brush Script">Nanum Brush Script</option>
			<option value="Nanum Gothic">Nanum Gothic</option>
			<option value="Nanum Gothic Coding">Nanum Gothic Coding</option>
			<option value="Nanum Myeongjo">Nanum Myeongjo</option>
			<option value="Nanum Pen Script">Nanum Pen Script</option>
		</select><br>
		<textarea class="form-control" rows="10" name="dcontent"></textarea><br>
		그림 : <input type="text" name="dfile"><br>
		사진 : <input type="file" name="upload">
		<br>
		<input type="radio" name="secret" value=1 checked="checked"> 비공개
		<input type="radio" name="secret" value=0> 전체공개<br>
		<button type="submit">등록</button>
	</form>
</body>
</html>