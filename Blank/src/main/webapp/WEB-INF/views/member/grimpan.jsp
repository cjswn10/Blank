<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blank Grimpan</title>
<style type="text/css">
canvas {
	border: 1px solid black
}
</style>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	
	function setGrimpan() {
		//이미지로 변환
		var myImage = document.getElementById('myImage');
		myImage.src = canvas.toDataURL();
		// 부모창으로 넘기기
		opener.document.getElementById("img").value = document.getElementById("myImage").value;

		//self.close();
	}
</script>
<body>
	<div>
		<canvas id="canvas" width="500" height="500">
		</canvas>
	</div>
	<script type="text/javascript" src="../resources/js/drawingColor.js"></script>
	<input type="button" id="selectColor">
	<input id="myColor" type="color" onchange="cg_color(this.value)">

	size:<input type="range" min="1" max="5" id="Lwidth" value="1" onchange="cg_line(this.value)">

	<div>
		<input type="button" value="지우기" id="delete">
	</div>

	<div>
		<input type="button" value="확인" onclick="setGrimpan()">
	</div>
	<img id="myImage">

	<script src="../resources/js/draw.js"></script>
</body>
</html>