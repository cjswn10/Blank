var canvas = document.getElementById("canvas");
var context = canvas.getContext("2d");
var selectColor = document.getElementById("selectColor");
var myColor = document.getElementById("myColor");

context.strokeStyle = myColor.value;
context.lineWidth = document.getElementById("Lwidth").value;
canvas.addEventListener("mousedown", function(e) {
	down(e)
}, false);
canvas.addEventListener("mouseup", function(e) {
	up(e)
}, false);
canvas.addEventListener("mousemove", function(e) {
	move(e)
}, false);
canvas.addEventListener("mouseout", function(e) {
	out(e)
}, false);

function changeColor(color) {
	switch (color) {
	case 'maroon':
		return "#800000";
	case 'red':
		return "#ff0000";
	case 'orange':
		return "#ffa500";
	case 'yellow':
		return "#ffff00";
	case 'olive':
		return "#808000";
	case 'purple':
		return "#800080";
	case 'fuchsia':
		return "#FF00FF";
	case 'white':
		return "#ffffff";
	case 'lime':
		return "#00ff00";
	case 'green':
		return "#008000";
	case 'navy':
		return "#000080";
	case 'aqua':
		return "#00ffff";
	case 'teal':
		return "#008080";
	case 'black':
		return "#000000";
	case 'silver':
		return "#c0c0c0";
	case 'gray':
		return "#808080";
	default:
		return color;
	}
}
function cg_color(color) {
	context.strokeStyle = color;
	selectColor.style.background = color;
	myColor.value = changeColor(color);
}

function cg_line(width) {
	context.lineWidth = width;
}

var startX = 0,
	startY = 0;
var drawing = false;


function down(e) {
	startX = e.offsetX;
	startY = e.offsetY;
	drawing = true;
}

function move(e) {
	if (!drawing)
		return;
	var curX = e.offsetX;
	var curY = e.offsetY;
	draw(curX, curY);
	startX = curX;
	startY = curY;
}

function draw(curX, curY) {
	
	context.beginPath();
	context.moveTo(startX, startY);
	context.lineTo(curX, curY);
	context.stroke();
	
}

function up(e) {
	drawing = false;
}

function out(e) {
	drawing = false;
}

// 지우기
document.getElementById("delete").addEventListener("click", function(e) {
	context.clearRect(0, 0, canvas.width, canvas.height);
}, false);
