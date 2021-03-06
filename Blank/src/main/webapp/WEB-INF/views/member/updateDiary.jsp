<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빈칸을 채우다.</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gaegu|Gamja+Flower|Jua|Nanum+Brush+Script|Nanum+Gothic+Coding|Nanum+Myeongjo|Nanum+Pen+Script|Source+Sans+Pro|Stylish|Sunflower:300" rel="stylesheet">

<link rel="stylesheet" href="../resources/css/blank.css?ver=10">
<script type="text/javascript" src="../resources/js/menu.js?ver=1" ></script>
<script src="//code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(function() {
	
$(".today_weather").hide();
	
	if($("#cityName").val() == "")
	{
		$("#citya").html("현재 위치를 찾고 있습니다.")
	}
	
	setTimeout(function () {
		
		location.href = "logOut.do?id=${id}&autoOut=out";
		
	},10800*1000);	
	
	$.ajax({
		url:"http://ip-api.com/json",
		success:function(data)
		{
			var lat = data.lat
			var lon = data.lon
			var city = data.city
			
			if(city == "Seoul"){city = "서울";}
			else if(city == "Seoul-si"){city = "서울";}
			else if(city == "Incheon"){city = "인천";}
			else if(city == "Incheon-si"){city = "인천";}
			else if(city == "Suwon"){city = "수원";}
			else if(city == "Suwon-si"){city = "수원";}
			else if(city == "Chuncheon"){city = "춘천";}
			else if(city == "Chuncheon-si"){city = "춘천";}
			else if(city == "Gangneung"){city = "강릉";}
			else if(city == "Gangneung-si"){city = "강릉";}
			else if(city == "Cheongju"){city = "청주";}
			else if(city == "Cheongju-si"){city = "청주";}
			else if(city == "Daejeon"){city = "대전";}
			else if(city == "Daejeon-si"){city = "대전";}
			else if(city == "Hong Sung"){city = "홍성";}
			else if(city == "Hong Sung-si"){city = "홍성";}
			else if(city == "Seosan City"){city = "홍성";}
			else if(city == "Seosan City-si"){city = "홍성";}
			else if(city == "Jeonju"){city = "전주";}
			else if(city == "Jeonju-si"){city = "전주";}
			else if(city == "Daegu"){city = "대구";}
			else if(city == "Daegu-si"){city = "대구";}
			else if(city == "Ulsan"){city = "울산";}
			else if(city == "Ulsan-si"){city = "울산";}
			else if(city == "Pohang"){city = "포항";}
			else if(city == "Pohang-si"){city = "포항";}
			else if(city == "Busan"){city = "부산";}
			else if(city == "Busan-si"){city = "부산";}
			else if(city == "Gwangju"){city = "광주";}
			else if(city == "Gwangju-si"){city = "광주";}
			else if(city == "Mokpo"){city = "목포";}
			else if(city == "Mokpo-si"){city = "목포";}
			else if(city == "Jeju City"){city = "제주";}
			else if(city == "Jeju City-si"){city = "제주";}
			else if(city == "Changwon"){city = "창원";}
			else if(city == "Changwon-si"){city = "창원";}
			else if(city == "Yeosu"){city = "여수";}
			else if(city == "Yeosu-si"){city = "여수";}
			else if(city == "Baengnyeongdo"){city = "백령도";}
			else if(city == "Baengnyeongdo-si"){city = "백령도";}
			else if(city == "Dokdo"){city = "독도";}
			else if(city == "Dokdo-si"){city = "독도";}
			else if(city == "Uljin"){city = "울진";}
			else if(city == "Uljin-si"){city = "울진";}
			else if(city == "Andong"){city = "안동";}
			else if(city == "Andong-si"){city = "안동";}
			else if(city == "Heuksando"){city = "흑산도";}
			else if(city == "Heuksando-si"){city = "흑산도";}
			else
			{
				city = "서울";
			}
			$("#x").val(lat);
			$("#y").val(lon);
			$("#cityName").val(city);
			
			var y_day = $("#day").val()
			var y_month = y_day.substring(5,7)
			var y_date = y_day.substring(8,10)

			if(city != "")
			{
				setTimeout(function() {
					
					$("#citya").hide();
					$("#cityb").show();
					$("#cityb").html("현재 위치는 "+city+"이며, "+y_month+"월"+y_date+"일 날씨")
					
				}, 1000);
					
				
			}
			
		}
	})		
	
	var today = $("#today_date").val();
	var today_year = parseInt(today.substring(0,4));
	var today_month = parseInt(today.substring(5,6));
	var today_date = parseInt(today.substring(7,9));
	
	var todays = "";
	var arr2 = today.split("-");
	
	for(i=0;i<arr2.length;i++)
	{
		todays += arr2[i]
	}
	
	var today_now = parseInt(todays);
	
	var months = "";
	var year = "";
	var month = "";
	var select_day = "";
	var day = "";
	
	
	$("#ddate").change(function(){
		
		var ddate = $(this).val()
		
		year = parseInt(ddate.substring(0,4));
		month = ddate.substring(5,7);
		date_a = ddate.substring(8,10);
		
		
		var arr = ddate.split("-")
		
		for(i=0;i<arr.length;i++)
		{
			day += arr[i]
		}
		
		if(day.length > 8)
		{
			day = day.substring(8,day.length)
		}
		
		select_day = parseInt(day)
			
		months = parseInt(ddate.substring(5,7));
		
		$("#year").val(year)
		$("#month").val(month)
		
		if(ddate.charAt(8) == '0')
		{
			date = parseInt(ddate.charAt(9))
			$("#date").val(date)
		}
		else
		{
			date = parseInt(ddate.substring(8,10))
			$("#date").val(date)
		}
		
		$("#select_day").val(select_day);
		
		if($("#date").val() == '')
		{
			confirm("날짜를 입력 해주세요.")
		}
		else if($("#cityName").val() == '')
		{
			confirm("지역을 입력 해주세요.")
		}
		else if(select_day > today_now)
		{
			confirm("지난 날씨의 달력만 볼수 있습니다.")	
		}	
		else
		{
			$.ajax({
				url:"weather4.do",
				data:{"cityName":$("#cityName").val(),"dates":$("#date").val()},
				success:function(data)
				{
					
					var area = "";
					var cityName = $("#cityName").val();
					
					if(cityName == '서울'){area = "09680";}
					else if(cityName == '인천'){area = "11200";}
					else if(cityName == '수원'){area = "02111";}
					//else if(cityName == '파주'){area = "02480";}
					else if(cityName == '춘천'){area = "01110";}
					else if(cityName == '백령도'){area = "11720";}
					else if(cityName == '강릉'){area = "01150";}
					else if(cityName == '독도'){area = "04940";}
					//else if(cityName == '속초'){area = "01210";}
					else if(cityName == '청주'){area = "16111";}
					else if(cityName == '안동'){area = "04170";}
					else if(cityName == '대전'){area = "07110";}
					else if(cityName == '홍성'){area = "15800";}
					else if(cityName == '전주'){area = "13113";}
					else if(cityName == '대구'){area = "06290";}
					else if(cityName == '울산'){area = "10140";}
					else if(cityName == '포항'){area = "04111";}
					else if(cityName == '울진'){area = "04930";}
					else if(cityName == '부산'){area = "08710";}
					else if(cityName == '창원'){area = "03123";}
					else if(cityName == '광주'){area = "05200";}
					else if(cityName == '목포'){area = "12110";}
					else if(cityName == '여수'){area = "12130";}
					else if(cityName == '흑산도'){area = "12910";}
					else if(cityName == '제주'){area = "14100";}
					else
					{
						area = "09680";
					}
					
					$.ajax({url:"http://203.236.209.112:4997/weather.do/"+$("#year").val()+""+$("#month").val()+"/"+area+"",success:function(data){}})
					$.ajax({url:"http://203.236.209.112:4997/weather2.do",success:function(data){}})
					
					$("#cityb").hide();
					$("#cityc").show();
					$("#cityc").html("현재 위치는 "+cityName+"이며, "+month+"월"+date_a+"일 날씨")
					
					$("#weather").html(data);
					
					$("#tmef_img").show()
					
					select_day = $("#select_day").val();
					
					if(select_day == today_now)
					{
						$("#tmef_img").attr({"src":$("[name='img2'] > v").html()})
						$("#dweather").val($("[name='tmef2'] > v").html())
					}
					else if(select_day < today_now)
					{
						$("#tmef_img").attr({"src":$("[name='img'] > v").html()})
						$("#dweather").val($("[name='tmef'] > v").html())
					}	
					
				}
			})
		}
		
	})
	
	$("#weather").hide()	
	$("#weather2").hide()	
	
					var cityName = location.search.substr(1,1)
					
					if(cityName == '' || cityName == 'd')
					{
						$("#city").hide()
						
						var dweather = $("#tes").val();
						var dweathera = dweather.substring(dweather.indexOf("/")+1,dweather.length)
						var dweathers = dweather.substring(dweather.indexOf("/")+1,dweather.indexOf("/",dweather.indexOf("/")+1))
						
						if(dweathers == "")
						{
							dweathers = dweather
						}
						
						else if(dweathers.match("/") == "/")
						{
							dweathers = dweathera
						}
						
						
						if(dweathers == "맑음"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB01.png"})}
						else if(dweathers == "구름조금"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB02.png"})}
						else if(dweathers == "구름많음"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB03.png"})}
						else if(dweathers == "흐림"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB04.png"})}
						else if(dweathers == "비"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB08.png"})}
						else if(dweathers == "소나기"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB07.png"})}
						else if(dweathers == "흐리고 비"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB08.png"})}
						else if(dweathers == "눈"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB11.png"})}
						else if(dweathers == "비 또는 눈"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB12.png"})}
						else if(dweathers == "눈 또는 비"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB13.png"})}
						else if(dweathers == "안개"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s9.gif"})}
						else if(dweathers == "천둥번개"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s10.gif"})}
						else if(dweathers == "황사"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s22.gif"})}
						else if(dweathers == "박무"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB17.png"})}
						else if(dweathers == "연무"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB18.png"})}
						else if(dweathers == "흐리고 가끔 비"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB20.png"})}
						else if(dweathers == "흐리고 한때 비"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB20.png"})}
						
						/*
						if(dweathers == '맑음'){$("#tmef_img").attr({src:'https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif'})}
						else if(dweathers == '구름조금'){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif"})}
						else if(dweathers == "흐림"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s3.gif"})}
						else if(dweathers == "비"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif"})}
						else if(dweathers == "눈"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif"})}
						else if(dweathers == "소나기"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s7.gif"})}
						else if(dweathers == "구름많음"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif"})}
						else if(dweathers == "소낙 눈"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s8.gif"})}
						else if(dweathers == "진눈깨비"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif"})}
						else if(dweathers == "흐려짐"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif"})}
						else if(dweathers == "흐려져 뇌우"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s12.gif"})}
						else if(dweathers == "흐려져 비"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif"})}
						else if(dweathers == "흐려져 눈"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif"})}
						else if(dweathers == "흐려져 진눈깨비"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif"})}
						else if(dweathers == "흐린 후 갬"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s16.gif"})}
						else if(dweathers == "뇌우 후 갬"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s17.gif"})}
						else if(dweathers == "비 후 갬"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s18.gif"})}
						else if(dweathers == "눈 후 갬"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s19.gif"})}
						else if(dweathers == "진눈깨비 후 갬"){$("#tmef_img").attr({"src":"https://ssl.pstatic.net/static/weather/images/w_icon/w_s20.gif"})}
						else if(dweathers == "천둥번개"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB14.png"})}
						else if(dweathers == "안개"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB15.png"})}
						else if(dweathers == "황사"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB16.png"})}
						else if(dweathers == "박무"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB21.png"})}
						else if(dweathers == "박무"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB22.png"})}
						else if(dweathers == "박무"){$("#tmef_img").attr({"src":"http://www.kma.go.kr/images/icon/NW/NB23.png"})}
						*/
					}
	
	$("#btnAdd").click(function(){
		if($("#dweather").val() == "")
		{
			var re = confirm("날씨를 입력해주세요.")
			if(re)
			{
				return false;
			}
			else
			{
				return false;
			}
		}
	})
	
	var oldFont="${d.dfont}"
	var oldSecret=${d.secret}
	var oldDfile="${d.dfile}"
	var oldDphoto="${d.dphoto}"
	
	console.log(oldDfile);
	console.log(oldDphoto);
	
	//이전 폰트설정
	$("#dcontent").attr({
		style : "font-family:${d.dfont}; font-size:35px;",
	});
	$.each($("#dfont").find("option"), function(i, f) {
		if($(f).val() == oldFont) {
			$(this).attr({
				selected : "selected"
			})
		}
	});
	
	//이전 공개유무 설정
	$.each($(".secret"), function(i, s) {
		
		if($(s).val() == oldSecret) {
			$(this).attr({
				checked : "checked"
			})
		}
	});	
	
	//선택한 폰트 적용
	$("#dfont").change(function() {
		console.log($(this).val())
		$("#dcontent").attr({
			style : "font-family:"+$(this).val(),
			fontSize: "50px"
		})
		
		$("#dfont").attr({
			style : "font-family:"+$(this).val()
		})
	});
	
	//이전 그림이 있으면 보여주기
	if(oldDfile != "") {
		console.log("그림있따!!")
		$("#grim").attr({
			src : "../resources/upload2/" + oldDfile
		})
	}
	
	//이전 사진이 있으면 보여주기
	if(oldDphoto != "") {
		console.log("사진있따!!")
		$("#photo").attr({
			src : "../resources/upload/" + oldDphoto
		})
	}
	

});
// 그림판 띄어주는 창
var openG;

function openGrimpan() {
	
	var popupX = (window.screen.width / 2) - (600 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height /2) - (680 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
	window.name = "insertDiary";
	openG = window.open("grimpan.do","grimpan",'status=no, height=700, width=840, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
}



</script>

<script>
	var sel_file;
	var sel_fileG;
	

	<!-- 사진 보여주기 -->
	$(document).ready(function() {
		$("#upload").on("change", showImg)
	});
	
	function showImg(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
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
	
	<!-- 그림 보여주기 -->
	$(document).ready(function() {
		$("#uploadG").on("change", showImgG)
	});
	
	function showImgG(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				alert("확장자 오류");
				return;
			}
			
			sel_fileG = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#grim").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
</head>
<body>

<section id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	
	<a href="#"><img class="side_icon" src="../resources/img/icon/person.png">${id }님</a>
	<h5>회원정보</h5>
	<a href="pwdCheck.do?id=${id }">Edit</a>
	<a href="logOut.do?id=${id }">logout</a>
	<br>
	<h5>고객센터</h5>
	<a href="qNa.do">Contact</a>
	<br>
	<div class="side_icon_set">
		<a href="https://github.com/cjswn10/Blank"><img class="side_icon" alt="G" src="../resources/img/icon/git.png"></a>
		<a href="http://sc.bitcamp.co.kr/index.php?main_page=faq&action=use"><img class="side_icon" alt="B" src="../resources/img/icon/bit.png"></a>
	</div>
	
</section>

<div id="wrapper">

	<!-- main-menu -->
	<nav class="clearfix">
	    <a href="main.do"><img src="../resources/img/blank.png" class="logo left"></a>
	    <span style="cursor:pointer" onclick="openNav()">&#9776; </span>
	    <ul>
	        <li><a href="book.do">DIARY</a></li>
	        <li><a href="favorite.do">FAVORITES</a></li>
	        <li><a href="myPage.do">MYPAGE</a></li>
	    </ul>
	</nav>

<div class="content" style="margin-top: 100px">
	<h2>일기 수정</h2>
	<hr>
	<form action="updateDiary.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="dno" id="dno" value="${d.dno}">

		<table>
			<tr>
				<td colspan="2">
					<label for="dtitle">제목 </label>
					<input type="text" name="dtitle" id="dtitle" required="required" value="${d.dtitle }">
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="ddate">날짜</label>
					<input type="date" name="ddate" id="ddate" required="required" value="${d.ddate }">
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="dweather">날씨</label>
					<input type="text" name="dweather" id="dweather" value="${d.dweather }" style="display:none;">
					<span id="citya"></span>
						<span id="cityb"></span>
						<span id="cityc"></span>
						<div class="status" style="display: inline-block;">
						<!--  <span id="city"></span> -->
						<img id="tmef_img" src="" width="30px" height="30px">
						</div>
						<div class="today_weather" style="display: inline-block; width:65%">
							<input type="hidden" name="cityName" id="cityName">
							<input type="hidden" id="day" value="${d.ddate }">
							<input type="hidden" id="date">
							<input type="hidden" id="today_date" value="${todays }">
							<input type="hidden" id="year">
							<input type="hidden" id="month">
							<input type="hidden" name="dno" id="dno" value="${d.dno }">
							<input type="hidden" id="tes" value="${d.dweather }">
							<input type="hidden" name="select_day" id="select_day">
							<span id="weather"></span>
							<span id="weather2"></span>
							<input type="hidden" id="x" name="latitude">
							<input type="hidden" id="y" name="longitude">
						</div>
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
	
					<label for="uploadG"><img alt="사진첨부" src="../resources/img/icon/draw.png" width="40px"></label>
					<input type="file" name="uploadG" id="uploadG" style="display: none;">
					
					<!-- 사진첨부 버튼 -->
					<label for="upload"><img alt="사진첨부" src="../resources/img/icon/picture.png" width="25px"></label>
					<input type="file" name="upload" id="upload" style="display: none;">
				</td>
			</tr>
			
			<!-- 그림, 사진 첨에 띄어주기-->
			<tr>
				<td colspan="2">
					<!-- 그림 -->
					<img id="grim" width="300">
					<br>
					<!-- 사진 -->
					<img width="300" id="photo">

					<br>
					<br>
					<!-- 글 -->
					<textarea rows="8" cols="40" name="dcontent" id="dcontent" style="font-family: ${d.dfont};">${d.dcontent }</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="radio" name="secret" class="secret" value=1> 나만보기
					<input type="radio" name="secret" class="secret" value=0> 전체공개<br>
				</td>
			</tr>
			
		</table>
		<button id="btnAdd" type="submit">수정</button>
		</div>
	</form>
	</div>
</div>

<!-- 푸터 -->
<footer class="footer">
	<h3>비트와밀당하는 팀 X 빈칸 , 2018</h3>
	<ul class="list-inline">
       <li>
           <img alt="" src="../resources/img/ho.jpg" class="btn-social btn-outline">
           <br><h5>김영호</h5>
       </li>
       <li>
           <img alt="" src="../resources/img/adult.jpg" class="btn-social btn-outline">
           <br><h5>변성인</h5>
       </li>
       <li>
           <img alt="" src="../resources/img/min.jpg" class="btn-social btn-outline">
           <br><h5>성민규</h5>
       </li>
       <li>
           <img alt="" src="../resources/img/lim.jpg" class="btn-social btn-outline">
           <br><h5>임연주</h5>
       </li>
       <li>
           <img alt="" src="../resources/img/cha.jpg" class="btn-social btn-outline">
           <br><h5>차건우</h5>
       </li>
    </ul>
</footer>
</body>
</html>