<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String houseImg1 = request.getParameter("houseImg1");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="CSS/pay.css">
</head>
<body>
<div class="cover">

<!-- 왼쪽 -->
<div>
	<h1>예약 정보</h1>
	<br><br><br>
	<p>&nbsp;이름</p>
	<input class="textbox" name="name" value="" readonly>
	<br><br><br><br>
	<p>&nbsp;휴대폰 번호</p>
	<!-- DB 넣기 -->
	<input class="textbox name="phone" value="" readonly>
	<br><br><br><br><br>
	<div align="center"><button type="button" class="btn btn-danger" onclick="location.href='view/main.jsp'">확인</button></div>
</div>

<!-- 오른쪽 -->
<div class="card" style="width: 18rem;">

<!-- 이미지 넣어야 함 -->
  <img src="upload/<%=houseImg1 %>" width="267" height="180"/>
  
  <!-- 수정 -->
  <!-- 내용 -->
  <div class="card-body">
    <div class="cover_in">
	    <div class="cont">체크인</div>
	    <div>
			<p>${dto.getCheckin().substring(0, 10)}</p>
		</div>
	</div>
	<p></p>
	
	<div class="cover_in">
	    <div class="cont">체크아웃</div>
	    <div><p>${dto.getCheckout().substring(0, 10)}</p></div>
	</div>
	<!-- 수정 끝 -->
	
    <hr color="gray">
    <h5>요금 세부정보</h5>
	    
    <!-- 텍스트 양쪽 끝에 위치 -->
    <div class="cover_in">
	    <div class="cont">요금</div>
	    <div><p>${dto.getprice()}원</p></div>
	</div>
  </div>
</div>
</div>
</body>
</html>