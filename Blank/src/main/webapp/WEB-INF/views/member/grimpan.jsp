
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
	$(function() {
		$("#download").click(function() {
			downloadCanvas(this, 'canvas', 'myGrim.png');
		});

		$("#btnOk").click(
				function() {

					var myImage = document.getElementById("myImage");
					var imageUrl = canvas.toDataURL();
					myImage.src = canvas.toDataURL();

					$.ajax({
						type : "POST",
						url : "grimpan2.do",
						data : {
							"imageUrl" : imageUrl
						},
						success : function() {
							alert("ok");
						}
					})
					self.close();
				});
	});

	//C:\Blank\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Blank\resources\upload2
// 작업 이미지 로컬 다운로드(.PNG)
	function downloadCanvas(link, canvasId, filename) {
		link.href = document.getElementById(canvasId).toDataURL();
		link.download = filename;
	}
</script>
<body>
	<div>
		<canvas id="canvas" width="500" height="500"></canvas>
	</div>
	
	<script type="text/javascript" src="../resources/js/drawingColor.js"></script>
	
	<input type="button" id="selectColor">
	<input id="myColor" type="color" onchange="cg_color(this.value)">

	size:<input type="range" min="1" max="5" id="Lwidth" value="1" onchange="cg_line(this.value)">

	<div>
		<button id="delete"><img src="../resources/img/icon/newpage.png" width="15px">전체지우기</button>
		<button id="prev"><img src="../resources/img/icon/prev.png" width="15px">되돌리기</button>
	</div>
	
	<div>
		<a id="download"><button type="button"><img src="../resources/img/icon/download.png" width="15px">download</button></a>
	</div>
	
	<div>
		<button id="btnOk"><img src="../resources/img/icon/exit.png" width="15px">닫기</button>
	</div>
	
	<img id="myImage">

	<script src="../resources/js/draw.js"></script>
</body>
</html>

