<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<div class="div1">
		<h2>${ houseInfo.house_name }</h2>
		<p>★ ${ houseInfo.house_star } ·  ${ houseInfo.house_location }</p>
		</div>
		<div class="flex_row">
			<img src="upload/${houseInfo.house_img1}" width="400" height="400" alt="${ houseInfo.house_img1 }" />
		<div class="flex_col">	
			<img src="upload/${houseInfo.house_img2}" width="200" height="200" alt="${ houseInfo.house_img2 }" />
			<img src="upload/${houseInfo.house_img3}" width="200" height="200" alt="${ houseInfo.house_img3 }" />
		</div>
		</div>
		
		<div class="div2">
			<h3>${ houseInfo.house_owner }님의 ${ houseInfo.house_category }</h3>
			<hr />
			<h3>숙소 소개</h3>
			<p>${ houseInfo.house_content }</p>
		<hr />

		</div>
		<div class="div3">
			<h3>예약 정보</h3>
			<p>₩<b>${ houseInfo.house_price }</b> /박 · 최대 인원 ${ houseInfo.house_person }명</p>
			<form name="reservationform" class="form" method="get" action="payment_main.jsp">
				<input type="hidden" id="houseNo" name="houseNo" value="${ houseInfo.house_no }" />
		        <label for="startDate">체크인</label>
		        <input type="date" id="startDate" name="startDate" />
		        <label for="endDate">체크아웃</label>
		        <input type="date" id="endDate" name="endDate" />
		        <button type="submit">예약하기</button>
		    </form>
		<hr />

		</div>
		<div class="div4">
		<h3>★ ${ houseInfo.house_star } </h3>
		<c:choose>    
		    <c:when test="${ empty reviewList }">  <!-- 리뷰가 없을 때 -->
		        <p>등록된 리뷰가 없습니다.</p>
		    </c:when>
		    <c:otherwise>  <!-- 리뷰가 있을 때 -->
		        <c:forEach items="${ reviewList }" var="row" varStatus="loop">    
		        <table>
			    <tr>
			    <td>★${ row.grade }</td>  <!-- 별점 -->  
			    </tr>
			    <tr>
				<td><b>${ row.memberId }</b></td>  <!-- 작성자 -->
			    <td>${ row.contents }</td>  <!-- 내용 -->	
			    </tr>
			    <tr>
			    <td>${ row.createdDate }</td>  <!-- 작성일 -->
			    
			    </tr>
			    </table>
		        <hr>
		        </c:forEach>        
		    </c:otherwise>    
		</c:choose>
		</div>
		<div class="div5">
		<h3>호스팅 지역</h3>	
		<p>${ houseInfo.house_location }</p>
		<hr>
		<h3>숙소 정보</h3>
		<p>호스트 : ${ houseInfo.house_owner }님</p>
		<p>연락처 : ${ houseInfo.house_phone }</p>
		</div>
	</body>
</html>