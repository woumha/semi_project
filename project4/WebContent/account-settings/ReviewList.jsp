<%@page import="com.model.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/ReviewList.css">

<link rel="stylesheet" href="../CSS/top.css">
<script src="../JS/main_java2.js">
	
</script>
<link rel="stylesheet" href="CSS/top.css">
<script src="JS/main_java2.js">
	
</script>
<script src="JS/houseDetail.js">
	
</script>
<script>
	document.addEventListener("DOMContentLoaded", function(){
		if (window.location.search.substring(1) === 'result=true') {
			alert("리뷰를 삭제했습니다.");
			window.history.pushState({}, document.title, window.location.pathname);
		} else if (window.location.search.substring(1) === 'result=false') {
			alert("일시적인 오류로 리뷰를 삭제하지 못했습니다.");
			window.history.pushState({}, document.title, window.location.pathname);
		} else if (window.location.search.substring(1) === 'save=true') {
			alert("리뷰를 등록했습니다.");
			window.history.pushState({}, document.title, window.location.pathname);
		} else if (window.location.search.substring(1) === 'save=false') {
			alert("일시적인 오류로 리뷰를 등록하지 못했습니다.");
			window.history.pushState({}, document.title, window.location.pathname);
		} 
	});
	function deleteReview(e, id) {
		var result = confirm("리뷰를 삭제할까요?");
		if (result) {
			location.href = "review-delete.do?id=" + id;
		} else {
			e.preventDefault();
		}
	}
</script>
</head>
<body>
	<jsp:include page="../include/top2.jsp" />

	<div class="div1">
		<h2>&nbsp;</h2>
		<h2>내가 작성한 리뷰</h2>
		<br>
		<c:choose>
			<c:when test="${ empty result }">
				<!-- 리뷰가 없을 때 -->
				<p>등록된 리뷰가 없습니다.</p>
			</c:when>
			<c:otherwise>
				<!-- 리뷰가 있을 때 -->
				<table style="width: 100%">
					<tr>
						<td width="20%">숙소 이름</td>
						<td width="10%">별점</td>
						<td width="55%">내용</td>
						<td width="10%">작성일</td>
						<td width="5%"></td>
					</tr>
					<c:forEach items="${ result }" var="row" varStatus="loop">
						<tr>
							<td><b>${ row.houseName }</b></td>
							<!-- 작성자 -->
							<td><c:if test="${ row.grade eq 1}">
									<a class="star">★</a>
								</c:if> <c:if test="${ row.grade eq 2}">
									<a class="star">★★</a>
								</c:if> <c:if test="${ row.grade eq 3}">
									<a class="star">★★★</a>
								</c:if> <c:if test="${ row.grade eq 4}">
									<a class="star">★★★★</a>
								</c:if> <c:if test="${ row.grade eq 5}">
									<a class="star">★★★★★</a>
								</c:if> <!-- 별점 -->
							<td>${ row.contents }</td>
							<!-- 내용 -->
							<td>${ row.createdDate }</td>
							<!-- 작성일 -->
							<td><input type="image" src="img/delete.png"
								onClick="deleteReview(event, ${ row.id })" style="width: 13px;"></td>
							<!-- 삭제 -->
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		<br> <input type="button" value="리뷰 작성"
			style="margin: auto; display: block; width: 8%;"
			onclick="location.href='review-write.do';"> <br>
	</div>
	<jsp:include page="../include/bottom.jsp" />
</body>
</html>