<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../include/top2.jsp" />

<div id="modify_box" align="center">
	<hr width="85%" color="gray">
	<h3>숙소 정보 수정</h3>
	<hr width="85%" color="gray">
	<br>
	<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/host_modify_ok.do">
		<c:set var="dto" value="${HouseCont }" />

		<input type="hidden" name="house_no" value="${dto.getHouse_no() }">
		<input type="hidden" name="pcode" value="${member_code_session }">
		<table border="1" cellspacing="0" width="85%">
			<tr>
				<th>숙소 오너</th>
				<td>
					<input name="house_owner" value="${dto.getHouse_owner() }" readonly>
				</td>
			</tr>
			<tr>
				<th>숙소 이름</th>
				<td>
					<input name="house_name" value="${dto.getHouse_name() }">
				</td>
			</tr>
			<tr>
				<th>숙소 카테고리</th>
				<td><select name="house_category">
						<option value="호텔"
							<c:if test="${dto.getHouse_category() == '호텔'}"> selected </c:if>>호텔</option>
						<option value="아파트"
							<c:if test="${dto.getHouse_category() == '아파트'}"> selected </c:if>>아파트</option>
						<option value="리조트"
							<c:if test="${dto.getHouse_category() == '리조트'}"> selected </c:if>>리조트</option>
						<option value="게스트하우스"
							<c:if test="${dto.getHouse_category() == '게스트하우스'}"> selected </c:if>>게스트하우스</option>
				</select></td>
			</tr>
			<tr>
				<th>숙소 주소</th>
				<td>
					<input name="house_location" value="${dto.getHouse_location() }">
				</td>
			</tr>
			<tr>
				<th>숙소 가격</th>
				<td>
					<input name="house_price" value="${dto.getHouse_price() }">
				</td>
			</tr>
			<tr>
				<th>숙소 소개</th>
				<td>
					<textarea rows="7" cols="25" name="house_content">${dto.getHouse_content() }</textarea>
				</td>
			</tr>
			<tr>
				<th>숙소 연락처</th>
				<td>
					<input name="house_phone" value="${dto.getHouse_phone() }">
				</td>
			</tr>
			<tr>
				<th>숙소 인원</th>
				<td>
					<input name="house_person" value="${dto.getHouse_person() }">명
				</td>
			</tr>
			<tr>
				<th>숙소 별점</th>
				<td>
					<input name="house_star" value="${dto.getHouse_star() }" readonly>
				</td>
			</tr>
			<tr>
				<th>숙소 결제 수</th>
				<td>
					<input name="house_count" value="${dto.getHouse_count() }" readonly>
				</td>
			</tr>
			<tr>
				<th>숙소 이미지</th>
				<td>
					<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img1()}" width="100" height="80">
					<input type="file" name="house_img1">
					<%-- 이미지를 수정하지 않고 그대로 제품수정 버튼을 누르면 상품 등록 때 입력했던 제품의 이미지를 그대로 사용하여 히든으로 넘겨줄 예정 --%>
					<input type="hidden" name="house_img1_old" value="${dto.getHouse_img1() }">
					<br>
					<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img2()}" width="100" height="80">
					<input type="file" name="house_img2">
					<%-- 이미지를 수정하지 않고 그대로 제품수정 버튼을 누르면 상품 등록 때 입력했던 제품의 이미지를 그대로 사용하여 히든으로 넘겨줄 예정 --%>
					<input type="hidden" name="house_img2_old" value="${dto.getHouse_img2() }">
					<br>
					<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img3()}" width="100" height="80">
					<input type="file" name="house_img3">
					<%-- 이미지를 수정하지 않고 그대로 제품수정 버튼을 누르면 상품 등록 때 입력했던 제품의 이미지를 그대로 사용하여 히든으로 넘겨줄 예정 --%>
					<input type="hidden" name="house_img3_old" value="${dto.getHouse_img3() }">
				</td>
			</tr>
			<tr>
				<th>수변인접 여부</th>
				<td>
					<input type="radio" name="house_water" value="0" <c:if test="${dto.getHouse_water() == 0}">checked</c:if>>없음
					<input type="radio" name="house_water" value="1" <c:if test="${dto.getHouse_water() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>수영장 여부</th>
				<td>
					<input type="radio" name="house_pool" value="0" <c:if test="${dto.getHouse_pool() == 0}">checked</c:if>>없음
					<input type="radio" name="house_pool" value="1" <c:if test="${dto.getHouse_pool() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>스키장 여부</th>
				<td>
					<input type="radio" name="house_ski" value="0" <c:if test="${dto.getHouse_ski() == 0}">checked</c:if>>없음
					<input type="radio" name="house_ski" value="1" <c:if test="${dto.getHouse_ski() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>식사제공 여부</th>
				<td>
					<input type="radio" name="house_food" value="0" <c:if test="${dto.getHouse_food() == 0}">checked</c:if>>없음
					<input type="radio" name="house_food" value="1" <c:if test="${dto.getHouse_food() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>무료주차 여부</th>
				<td>
					<input type="radio" name="house_parking" value="0" <c:if test="${dto.getHouse_parking() == 0}">checked</c:if>>없음
					<input type="radio" name="house_parking" value="1" <c:if test="${dto.getHouse_parking() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>바베큐 그릴 여부</th>
				<td>
					<input type="radio" name="house_grill" value="0" <c:if test="${dto.getHouse_grill() == 0}">checked</c:if>>없음
					<input type="radio" name="house_grill" value="1" <c:if test="${dto.getHouse_grill() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>흡연장 여부</th>
				<td>
					<input type="radio" name="house_smoking" value="0" <c:if test="${dto.getHouse_smoking() == 0}">checked</c:if>>없음
					<input type="radio" name="house_smoking" value="1" <c:if test="${dto.getHouse_smoking() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>헬스장 여부</th>
				<td>
					<input type="radio" name="house_gym" value="0" <c:if test="${dto.getHouse_gym() == 0}">checked</c:if>>없음
					<input type="radio" name="house_gym" value="1" <c:if test="${dto.getHouse_gym() == 1}">checked</c:if>>있음
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input type="submit"value="제품수정"> &nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>

	</form>


</div>

<jsp:include page="../include/bottom.jsp" />

</body>
</html>