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
;
</style>
</head>
<body>
	<div>
		<canvas id="canvas" width="500" height="500">
		</canvas>
	</div>
	<script type="text/javascript" src="drawingColor.js"></script>
	<input type="button" id="selectColor">
	<input id="myColor" type="color" onchange="cg_color(this.value)">
	size:<input type="range" min="1" max="5" id="Lwidth" value="1" onchange="cg_line(this.value)">
	<div>
		<input type="button" value="원" id="cyc"/>
		<input type="button" value="사각형" id="rec"/>
		<input type="button" value="삼각형" id="tri"/>
		<input type="button" value="지우기" id="delete"></input>
	</div>
		
<script src="draw.js"></script>

</body>
</html>