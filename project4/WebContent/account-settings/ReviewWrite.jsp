<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../CSS/ReviewWrite.css">
<link rel="stylesheet" type="text/css" href="CSS/ReviewWrite.css">

<link rel="stylesheet" href="../CSS/top.css">
<script src="../JS/main_java2.js">
	
</script>
<link rel="stylesheet" href="CSS/top.css">
<script src="JS/main_java2.js">
	
</script>
<script src="JS/houseDetail.js">
	
</script>
</head>
<body>
	<jsp:include page="../include/top.jsp" />

	<div class="div1">

		<h2>리뷰 작성</h2>
		<br>

		<c:choose>
			<c:when test="${ empty result }">
				<!-- 예약이 없을 때 -->
				<p>방문하신 숙소가 없어, 리뷰를 작성할 수 없습니다.</p>
			</c:when>
			<c:otherwise>
				<!-- 예약이 있을 때 -->
				<form name="reviewWriteForm" method="post" action="review-insert.do">
					<table border="1" width="90%"
						style="width: 100%; border: 1px solid gray; border-collapse: collapse;">
						<tr>
							<td>숙소</td>
							<td><select name="house_no">
									<c:forEach items="${ result }" var="row" varStatus="loop">
										<option value=${ row.house_no }>${ row.house_name }</option>
									</c:forEach>
							</select></td>

						</tr>
						<tr>
							<td>별점</td>
							<td><select name="star">
									<option value="5">★★★★★</option>
									<option value="4">★★★★</option>
									<option value="3">★★★</option>
									<option value="2">★★</option>
									<option value="1">★</option>
							</select></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="contents"
									style="width: 90%; height: 100px; border: none; resize: none;"
									maxlength="40" placeholder="40자 이하로 작성해주세요."></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button type="submit">리뷰 등록</button>
							</td>
						</tr>
					</table>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
	<jsp:include page="../include/bottom.jsp" />
</body>
</html>