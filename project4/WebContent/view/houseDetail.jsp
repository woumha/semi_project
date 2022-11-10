<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="CSS/detail.css">


<link rel="stylesheet" href="../CSS/top.css">
<script src="../JS/main_java2.js"> </script>
<link rel="stylesheet" href="CSS/top.css">
<script src="JS/main_java2.js"> </script>
<script src="JS/houseDetail.js"> </script>
	
	</head>
	<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<jsp:include page="../include/top2.jsp"/>
	
	<div class="div1">
		<h2>${ houseInfo.house_name }</h2>
		<p><a class="star">★</a> <a href="#review">${ houseInfo.house_star }</a> ·  <a href="#map">${ houseInfo.house_location }</a></p>
		</div>
		<div class="flex_row">
			<img src="upload/${houseInfo.house_img1}" width="50%" height="700" alt="${ houseInfo.house_img1 }" />
		<div class="flex_col">	
			<img src="upload/${houseInfo.house_img2}" width="100%" height="350" alt="${ houseInfo.house_img2 }" />
			<img src="upload/${houseInfo.house_img3}" width="100%" height="350" alt="${ houseInfo.house_img3 }" />
		</div>
		</div>
		
		<div class="div1">
			<br>
			<h3>${ houseInfo.house_owner }님의 ${ houseInfo.house_category }</h3>
			<br>
			<p>${ houseInfo.house_content }</p>
		<br>
		<hr />
		<br>
		<h3>숙소 편의시설</h3>
		<br>
<div class="img">
		<c:if test="${ houseInfo.house_water eq 1}"><div><img src="main_img/top_water_40.png"><span> 수변 인접</span></div></c:if>
		<c:if test="${ houseInfo.house_pool eq 1}"><div><img src="main_img/top_pool_40.png"><span> 수영장</span></div></c:if>
		<c:if test="${ houseInfo.house_ski eq 1}"><div><img src="main_img/top_ski_40.png"><span> 스키장</span></div></c:if>
		<c:if test="${ houseInfo.house_food eq 1}"><div><img src="main_img/food_40.png"><span> 식사 제공</span></div></c:if>
		<c:if test="${ houseInfo.house_parking eq 1}"><div><img src="main_img/top_parking_40.png"><span> 무료 주차 가능</span></div></c:if>
		<c:if test="${ houseInfo.house_grill eq 1}"><div><img src="main_img/top_grill_40.png"><span> 바베큐 가능</span></div></c:if>
		<c:if test="${ houseInfo.house_smoking eq 1}"><div><img src="main_img/top_smoking_40.png"><span> 흡연장</span></div></c:if>
		<c:if test="${ houseInfo.house_gym eq 1}"><div><img src="main_img/top_gym_40.png"><span> 헬스장</span></div></c:if>
				
</div>		
<hr>
<br>
		</div>
		<div class="div1">
		<div class="info">
			<h3>예약 정보</h3>
			<br>
			<p>₩<b>${ houseInfo.house_price }</b> /박 · 최대 인원 ${ houseInfo.house_person }명</p>
			
			<form name="reservationform" class="form" method="get" action="payment_main.jsp">
				<input type="hidden" id="houseName" name="houseName" value="${ houseInfo.house_name }" />
				<input type="hidden" id="houseNo" name="houseNo" value="${ houseInfo.house_no }" />
				<input type="hidden" id="houseImg1" name="houseImg1" value="${ houseInfo.house_img1 }" />
				<input type="hidden" id="houseprice" name="houseprice" value="${ houseInfo.house_price }" />
				<div  style="float: left; width: 40%;">
				<label for="startDate">체크인</label>
		        <input type="date" id="startDate" name="startDate" required="required" onChange="calcResult(event, 'start')"/>
		        <label for="endDate"> 체크아웃</label>
		        <input type="date" id="endDate" name="endDate" required="required" onChange="calcResult(event, 'end')"/>
		  </div>
		      <div style="float: left; width: 60%;"> 
		        ₩${ houseInfo.house_price } x
		        <input type="number" id="count" name="count" readonly="readonly"style="text-align: right;width:30px;" />
		        박&emsp;&emsp;
		        	<b>₩<input type="number" id="result" disabled style="text-align: right;width:180px;"/></b> <c:if test="${!empty member_code_session }">
	<button type="submit">예약하기</button>
</c:if>
<c:if test="${empty member_code_session }">
	<button type="submit" disabled>예약하기</button>
	<p style="margin-left: 193px;"><a href="house_list.do" style="color: red;">로그인</a> 후 예약이 가능합니다</p>
</c:if>
	        	</div>
	        	
		    </form>
		    
		    </div>

		    <br>
		<hr />
		<br>
		</div>
		<div class="div1">
		
		<div id="review"><h3><a class="star">★</a> ${ houseInfo.house_star } </h3></div>
		<br>
		<c:choose>    
		    <c:when test="${ empty reviewList }">  <!-- 리뷰가 없을 때 -->
		        <p>등록된 리뷰가 없습니다.</p>
		    </c:when>
		    <c:otherwise>  <!-- 리뷰가 있을 때 -->
		        <c:forEach items="${ reviewList }" var="row" varStatus="loop">    
		        <table>
			    <tr>
			    <td colspan="2">
			    <c:if test="${ row.grade eq 1}"><a class="star">★</a></c:if>
			    <c:if test="${ row.grade eq 2}"><a class="star">★★</a></c:if>
			    <c:if test="${ row.grade eq 3}"><a class="star">★★★</a></c:if>
			    <c:if test="${ row.grade eq 4}"><a class="star">★★★★</a></c:if>
			    <c:if test="${ row.grade eq 5}"><a class="star">★★★★★</a></c:if>
			    </td>
			    </tr>
			    <tr>
				<td>${ row.contents }</td>  <!-- 내용 -->	
			    </tr>
			    
			    <tr>
			    <td>${ row.createdDate } </td>  <!-- 작성일 -->
			    </tr>
			    </table>
		        </c:forEach>        
		    </c:otherwise>    
		</c:choose>
		<br>
		</div>
		<div class="div1">
		<hr>
		<br>
		<div id="map">
		<h3>호스팅 지역</h3>
		</div>
		<br>	
		<p>${ houseInfo.house_location }</p>
		<br>
		<hr>
		<br>
		<h3>숙소 정보</h3>
		<br>
		<p>호스트 : ${ houseInfo.house_owner }님</p>
		<p>연락처 : ${ houseInfo.house_phone }</p>
		</div>
<jsp:include page="../include/bottom.jsp"/>
		
	</body>
</html>