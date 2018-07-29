var canvas = document.getElementById("canvas");
var context = canvas.getContext("2d");
var selectColor = document.getElementById("selectColor");
var myColor = document.getElementById("myColor");
var drawBackup = new Array();

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
	case 'c1':
		return "#ff1d23";
	case 'c2':
		return "#f5941c";
	case 'c3':
		return "#ded120";
	case 'c4':
		return "#45bf55";
	case 'c5':
		return "#1854ff";
	case 'c6':
		return "#1d1058";
	case 'c7':
		return "#700a8a";
	case 'c8':
		return "#f6dddf";
	case 'c9':
		return "#32ccb0";
	case 'c10':
		return "#ffeda7";
	case 'c11':
		return "#ff5c58";
	case 'c12':
		return "#f20574";
	case 'c13':
		return "#eacbff";
	case 'c14':
		return "#bec2c1";
	case 'c15':
		return "#fffcf0";
	case 'c16':
		return "#1c1a21";
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
// 되돌리기
document.getElementById("prev").addEventListener("click", function(e) {
	context.putImageData(drawBackup.pop(), 0, 0);
},false);








