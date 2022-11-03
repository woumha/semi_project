<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#Host_content

</style>
</head>
<body>
	<jsp:include page="../include/top2.jsp" />
	<div align="center">
		<c:set var="dto" value="${house_content }" />
		<hr width="50%" color="marmoon">
		<h3>${dto.getHouse_no() } 숙소 정보</h3>
		<hr width="50%" color="marmoon">
		<br>
		<div id="Host_content_box">
		<table id="Host_content" border="1" cellspacing="0" width="500">
			<tr>
				<th>숙소 오너</th>
				<td>${dto.getHouse_owner() }</td>
			</tr>

			<tr>
				<th>숙소 이름</th>
				<td>${dto.getHouse_name() }</td>
			</tr>
			<tr>
				<th>숙소 카테고리</th>
				<td>${dto.getHouse_category() }</td>
			</tr>
			<tr>
				<th>숙소 주소</th>
				<td>${dto.getHouse_location() }</td>
			</tr>
			<tr>
				<th>숙소 가격</th>
				<td>${dto.getHouse_price() }</td>
			</tr>
			<tr>
				<th>숙소 소개</th>
				<td><textarea rows="7" cols="25" readonly>${dto.getHouse_content() }</textarea>
				</td>
			</tr>
			<tr>
				<th>숙소 연락처</th>
				<td>${dto.getHouse_phone() }</td>
			</tr>
			<tr>
				<th>숙소 인원</th>
				<td>${dto.getHouse_person() }명</td>
			</tr>
			<tr>
				<th>숙소 별점</th>
				<td>${dto.getHouse_star() }</td>
			</tr>
			<tr>
				<th>숙소 결제 수</th>
				<td>${dto.getHouse_count() }</td>
			</tr>
			<tr>
				<th>숙소 이미지</th>
				<td>
					<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img1()}" width="50" height="50">
					<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img2()}" width="50" height="50">
					<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img3()}" width="50" height="50">
				</td>
			</tr>

			<tr>
				<th>수변인접 여부</th>
				<td>
					<input type="radio" name="house_water" value="0" onclick="return(false);" <c:if test="${dto.getHouse_water() == 0}">checked</c:if>>없음
					<input type="radio" name="house_water" value="1" onclick="return(false);" <c:if test="${dto.getHouse_water() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>수영장 여부</th>
				<td>
					<input type="radio" name="house_pool" value="0" onclick="return(false);" <c:if test="${dto.getHouse_pool() == 0}">checked</c:if>>없음
					<input type="radio" name="house_pool" value="1" onclick="return(false);" <c:if test="${dto.getHouse_pool() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>스키장 여부</th>
				<td>
					<input type="radio" name="house_ski" value="0" onclick="return(false);" <c:if test="${dto.getHouse_ski() == 0}">checked</c:if>>없음
					<input type="radio" name="house_ski" value="1" onclick="return(false);" <c:if test="${dto.getHouse_ski() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>식사제공 여부</th>
				<td>
					<input type="radio" name="house_food" value="0" onclick="return(false);" <c:if test="${dto.getHouse_food() == 0}">checked</c:if>>없음
					<input type="radio" name="house_food" value="1" onclick="return(false);" <c:if test="${dto.getHouse_food() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>무료주차 여부</th>
				<td>
					<input type="radio" name="house_parking" value="0" onclick="return(false);" <c:if test="${dto.getHouse_parking() == 0}">checked</c:if>>없음
					<input type="radio" name="house_parking" value="1" onclick="return(false);" <c:if test="${dto.getHouse_parking() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>바베큐 그릴 여부</th>
				<td>
					<input type="radio" name="house_grill" value="0" onclick="return(false);" <c:if test="${dto.getHouse_grill() == 0}">checked</c:if>>없음
					<input type="radio" name="house_grill" value="1" onclick="return(false);" <c:if test="${dto.getHouse_grill() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>흡연장 여부</th>
				<td>
					<input type="radio" name="house_smoking" value="0" onclick="return(false);" <c:if test="${dto.getHouse_smoking() == 0}">checked</c:if>>없음
					<input type="radio" name="house_smoking" value="1" onclick="return(false);" <c:if test="${dto.getHouse_smoking() == 1}">checked</c:if>>있음
				</td>
			</tr>
			<tr>
				<th>헬스장 여부</th>
				<td>
					<input type="radio" name="house_gym" value="0" onclick="return(false);" <c:if test="${dto.getHouse_gym() == 0}">checked</c:if>>없음
					<input type="radio" name="house_gym" value="1" onclick="return(false);" <c:if test="${dto.getHouse_gym() == 1}">checked</c:if>>있음
				</td>
			</tr>

			<c:if test="${empty dto }">
				<tr>
					<td colspan="2" align="center">
						<h3>게시물이 없습니다.....</h3>
					</td>
				</tr>
			</c:if>

			<tr>
				<td colspan="2" align="center"><input type="button" value="글수정"
					onclick="location.href='host_modify.do?no=${dto.getHouse_no() }'">

					<input type="button" value="글삭제"
					onclick="if(confirm('게시글을 정말 삭제하시겠습니까?')) {location.href='host_delete.do?no=${dto.getHouse_no() }&pcode=${member_code_session }'
	                        }else { return; }">

					<input type="button" value="전체목록"
					onclick="location.href='host_list.do?pcode=${member_code_session }'">
				</td>
			</tr>
		</table>
		</div>
	</div>
	<jsp:include page="../include/bottom.jsp" />
</body>
</html>