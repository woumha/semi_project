<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="./DetailPage/css.css">
		<script type="text/javascript">
			
			
		</script>
	</head>
	<body>
	<div class="div1">
		<h2>${ houseInfo.houseName }</h2>
		<p>★ ${ houseInfo.houseStar} ·  ${ houseInfo.houseLocation }</p>
		</div>
		<div class="flex_row">
			<img src="./img/${houseInfo.houseImage1}" width="400" height="400" alt="${ houseInfo.houseImage1 }" />
			<div class="flex_col">	
				<img src="./img/${houseInfo.houseImage2}" width="200" height="200" alt="${ houseInfo.houseImage2 }" />
				<img src="./img/${houseInfo.houseImage3}" width="200" height="200" alt="${ houseInfo.houseImage3 }" />
			</div>
		</div>
		
		<div class="div2">
			<h3>${ houseInfo.houseOwner }님의 ${ houseInfo.houseCategory }</h3>
			<hr />
			<h3>숙소 소개</h3>
			<p>${ houseInfo.houseContent }</p>
		</div>
		<hr />
		<div class="div3">
			<h3>예약 정보</h3>
			<p>₩<b>${ houseInfo.housePrice }</b> /박 · 최대 인원 ${ houseInfo.housePerson }명</p>
			<form name="reservationform" class="form" method="post" action="reservation.do">
		        <label for="startDate">체크인</label>
		        <input type="date" id="startDate" name="startDate" />
		        <label for="endDate">체크아웃</label>
		        <input type="date" id="endDate" name="endDate" />
		        <button type="submit" name="save" id="save">예약하기</button>
		    </form>
		</div>
		<hr />
		<div class="div4">
		<h3>별점 ★ ${ houseInfo.houseStar } </h3>
		<c:choose>    
		    <c:when test="${ empty reviewList }">  <!-- 리뷰가 없을 때 -->
		        <p>등록된 리뷰가 없습니다.</p>
		    </c:when>
		    <c:otherwise>  <!-- 리뷰가 있을 때 -->
		        <c:forEach items="${ reviewList }" var="row" varStatus="loop">    
		        <table>
			        <tr align="center">
			            <td>${ row.memberId }</td>  <!-- 작성자 -->
			            <td>${ row.createdDate }</td>  <!-- 작성일 -->
			            <td>★${ row.grade }</td>  <!-- 별점 -->
			            <td>${ row.contents }</td>  <!-- 내용 -->
			        </tr>
		        </table>
		        </c:forEach>        
		    </c:otherwise>    
		</c:choose>
		</div>
		<hr />
		<div class="div5">
		<h3>숙소 정보</h3>
			
		<p>${ houseInfo.houseLocation }</p>
		<hr />		
		<p>호스트 : ${ houseInfo.houseOwner }님</p>
		<p>연락처 : ${ houseInfo.housePhone }</p>
		</div>
	</body>
</html>