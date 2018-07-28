<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빈칸을 채우다.</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
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
	.menu
	{ 
		font-family: 'Nanum Pen Script', serif;
		font-size: 40px;
		position: relative;
		width:300px;
		left: 1100px;
		top: -530px;
	}
	.ifm
	{
		font-family: 'Nanum Pen Script', serif;
		font-size: 25px;
		position: relative;
		width:350px;
		left: 1150px;
		top: -630px;
	}
	.check
	{
		font-family: 'Nanum Pen Script', serif;
		position: relative;
		font-size: 50px;
		width:400px;
		top: 200px;
		left: 100px;
	}
	.main
	{
		font-family: 'Nanum Pen Script', serif;
		position: relative;
		font-size: 45px;
		width:600px;
		top: -20px;
		left: 600px;
	}

	
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=AEECUGOtAKgtqe22o3QO&submodules=geocoder"></script>

</head>
<body>
	<div class="title">
		<h1>그림 일기</h1>
	</div>
	
	<div class="check">
		<a href="#">Q & A</a>
		<br>
		<br>
		<a href="pwdCheck.do?id=${id }">회원정보수정</a>
	</div>
	
	<input type="hidden" id="id" name="id" value="${id }">
	
	<div class="main">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span>차건우</span><br>
		<span>연락처 : 010-7706-2878</span>
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span>010-9042-1391</span>
		<br>
		<span>이메일 : 123123@naver.com</span>
		<br>
		<span>주소 : 서울 마포구 백범로 23 구프라자 3층</span>
		<br>
		<span><div id="map" style="width:100%;height:400px;"></div></span> 
	</div>
	
	
	<div class="menu">
		<a href="book.do">일기장</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="favorite.do">즐겨찾기</a>
	</div>
	
	<div class="ifm">
		<a href="#">${id }님</a><span>  |  </span><a href="myPage.do">마이페이지</a><span>  |  </span><a href="logOut.do">로그아웃</a>
	</div>
	
	<script>
      var map = new naver.maps.Map('map');
      var myaddress = '서울 마포구 백범로 23';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          var result = response.result;
          // 검색 결과 갯수: result.total
          // 첫번째 결과 결과 주소: result.items[0].address
          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
      });
</script>
</body>

</html>

