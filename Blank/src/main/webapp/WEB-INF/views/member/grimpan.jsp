
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
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
			downloadCanvas(this, 'canvas', 'seongin.png');
		});
		
		$("#btnOk").click(function() {
			
			var myImage = document.getElementById("myImage");
			var imageUrl = canvas.toDataURL(); 
			myImage.src = canvas.toDataURL();
			
			alert(imageUrl)
			
			$.ajax({
				type : "POST",
				url : "grimpan2.do",
				data : {"imageUrl" : imageUrl}
			}).success(function(data){
				var arr = eval("("+data+")");
				alert(arr)
			});

			// 부모창으로 넘기기
			opener.document.getElementById("img").src = document
					.getElementById("myImage").src;
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
		<canvas id="canvas" width="500" height="500">
		</canvas>
	</div>
	<script type="text/javascript" src="../resources/js/drawingColor.js"></script>
	<input type="button" id="selectColor">
	<input id="myColor" type="color" onchange="cg_color(this.value)">

	size:
	<input type="range" min="1" max="5" id="Lwidth" value="1"
		onchange="cg_line(this.value)">

	<div>
		<input type="button" value="지우기" id="delete"> <input
			type="button" value="되돌리기" id="prev">
	</div>

	<div>
		<input type="button" id="btnOk" value="확인">
	</div>
	<a id="download"><button type="button">Download</button></a>

	<img id="myImage">

	<script src="../resources/js/draw.js"></script>
</body>
</html>
 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript"
   src="http:code:jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

function setCanvimg() {
   
   var jqObj_file = $("#upFile_tmp")[0].files[0];
   var img = new image();
   var url = window.URL || window.wdbkitURL;
   var imgSrc = url.cerateObjectURL(jqObj_file);
   img.src=imgSrc;
   img.onload= function() {
      var canvas = document.getElementById("canvasUpload");
      var ctx = canvas.getContext("2d");
      ctx.clearRect(0,0,canvas.width,canvas.height);
      ctx.drawImage(img,0,0,canvas.width,canvas.height);
   }
   
   return;
}

function showStr() {
   
   var canvas = doucument.getElementById("canvasUpload");
   alert(canvas.toDataURL("image/png",1.0));
   return;
}

function uploadCanvas() {
   
   var canvas = document.getElementById("canvasUpload");
   var canvImaStr = canvas.toDataURL("image/png",1.0);
   $.ajax({
      url : 'grimpan2.do',
      data : {strImg : canImgStr},
      type : 'POST',
      success : function() {
         $("img[id=rstImg]").show();
         $("img[id=rstImg]").attr("src","/"+json.replace("\\","/"));
      }
      
   });
   return;
}


</script>
</head>
<body>

   <canvas id="canvasUpload" width="400" height="400"></canvas>
<input type="file" name="upFile_tmp" id="upFile_tmp"
      onchange="setCanImg()" />
<input type="button" name="showStr" value="showStr" onclick="showStr()" />
<input type="button" name="doUploadBtn" value="upload"
      onclick="uploadCanvas()" />
<br>
   <br>
<img id="rstImg">
</body>


</html>
 
 
 