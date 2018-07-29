<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빈칸을 채우다.</title>
<style type="text/css">
	/*로고 표시 */
	.title
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 80px;
		position: relative;
		width: 160px;
		height:100px;
		left: 40px;
		top: -10px;
	}
	/* 일기장,즐겨찾기 */
	.menu
	{ 
		font-family: 'Nanum Pen Script', serif;
		font-size: 40px;
		position: relative;
		width:300px;
		left: 1100px;
		top: -600px;
	}
	
	/* id,마이페이지,로그아웃 */
	.ifm
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 25px;
		position: relative;
		width:350px;
		left: 1150px;
		top: -660px;
	}
	/* 새일기장 만들기 */
	.insertBook
	{
		font-size: 25px;
		position: relative;
		width: 450px;
		border: 1px solid black;
		height:500px;
		left: 350px;
		top: 100px;
	}

	/* remove 아이콘위치 */
	#remove_location
	{
		position: relative;
		left: 390px;
		top: -100px;
		
	}
	/* plus 아이콘위치 */
	#plus_location
	{
		position: relative;
		top:170px;
		display:table;
		margin-left: auto;
		margin-right: auto;
	}
	/* plus 아이콘 */
	.glyphicon-plus
	{
		font-size: 400%;
		color: black;
	}
	/* remove 아이콘 */
	.glyphicon-remove
	{
		font-size: 250%;
		color: black;
	}
	/* 일기장 목록 컨테이너 */
	#main_container
	{
		position: absolute;
		top: 800px;
		left: 250px;
		width: 1200px;
		height: 1200px;
	}
	/* 일기장 목록 서브컨테이너 */
	#sub_container
	{
		margin: 10px;
		padding: 10px;
		width: 1200px;
		height: 900px;
	}
	/* 일기장 목록을 포괄하는 div 화면보다 넘어가면 숨김 */
	#main
	{
		overflow: hidden;
	}
	/* 일기장 목록 div 생성위치를 왼쪽으로부터 생성*/
	#main > div
	{
		float: left;
	}
	/* 서브컨테이너의 자식 div들 */
	#sub_container > div
	{
		position:relative;
		left: 20px;
		top: -20px;
		width: 450px;
		height: 500px;
		float: left;
		margin: 65px;
		padding: 40px;
		background-color: yellow;
	}
	/* 일기장 제목 */
	.btitle
	{
		font-family: 'Nanum Pen Script', serif;
		position:relative;
		display:table;
		font-size: 30px;
		color:black;
		top:30px;
		margin-left: auto;
		margin-right: auto;
		
	}
	/*일기장 수정*/
	.update
	{
		font-family: 'Nanum Pen Script', serif;
		position:relative;
		display:table;
		font-size: 30px;
		color:black;
		top:400px;
		left: 130px;

	}
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<link rel="stylesheet" href="../resources/css/blank.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		
		//var id = $("#id").val();
		var mno = $("#mno").val();
		
		//일기장 목록 불러오기위한 기능 
		var listBook = function() {
					
			$.ajax({
				url:"listBook.do",
				data:{"mno":mno},
				success:function(data)
				{
					//alert(data)
					var list = eval("("+data+")");
					$.each(list,function(i,d){
						
						//일기장 목록 div
						var div = $("<div></div>");
						
						
						//일기장 -->> 일기목록
						var aList = $("<a href='diary.do?mno="+d.mno+"&bno="+d.bno+"'></a>")
						
						//일기장 제목
						var title = $("<span class='btitle'></span>").html(d.btitle);
						
						//일기장수정 문구
						var Update = $("<span class='update'></span>").html("일기장 수정")
						
						//일기장 수정a태그
						var aUpdate = $("<a href='updateBook.do?bno="+d.bno+"'></a>")
						
						//일기장 삭제a태그
						var aRemove = $("<a></a>")
						
						
						//remove 아이콘을 누르면 발생하여 선택한 일기장 삭제
						$(aRemove).click(function() {
							re = confirm('삭제된 그림일기장은 복구할 수 없습니다.\n정말로 삭제 하시겠습니까?');
							if(re == true)
							{
								confirm("일기장이 정상적으로 삭제되었습니다. ")
								location.href="deleteBook.do?bno="+d.bno;
							}	
							else
							{
								return;
							}	
						})
						
						//일기장 삭제 아이콘
						var remove = $("<span class='glyphicon glyphicon-remove' id='remove_location'></span>")
						
						//일기장 색상
						var color = $(div).attr({
							style:"background-color:"+d.bcolor
						})
						
						//일기장 수정a태그에 수정하기 문구 추가
						$(aUpdate).append(Update)
						
						//일기장 삭제a태그에 삭제아이콘 추가
						$(aRemove).append(remove)
						
						//일기장 목록 --> 일기목록
						$(aList).append(title)
						
						//일기장 목록에 제목,삭제a태그 추가
						$(div).append(aList,aRemove,color,aUpdate)

						
						//일기장 서브컨테이너에 추가
						$("#sub_container").append(div)
					});
					
				}
			});
		}
		//일기장 목록 불러오기
		listBook();
		
	})

</script>
</head>
<body>

	<div class="title">
		<h1>그림 일기</h1>
	</div>
	<div id="main">
		<table id="main_container">
			<tr>
				<td>
					<table id="sub_container">
					</table>
				</td>
			</tr>
		</table>
	</div>

		  <div class="insertBook"><a href="insertBook.do"><span class="glyphicon glyphicon-plus" id="plus_location"></span></a></div>
		  <input type="hidden" name="id" id="id" value="${id }">
		  <input type="hidden" name="mno" id="mno" value="${mno }">
	
	
	<div class="ifm">
		<a href="#">${id }님</a><span>  |  </span><a href="myPage.do">마이페이지</a><span>  |  </span><a href="logOut.do">로그아웃</a>
	</div>
</body>
</html>