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
	<div align="center">
	<c:set var="dto" value="${modify }"/>
		<hr width="50%" color="gray">
			<h3>${dto.getHouse_name()} 수정</h3>
		<hr width="50%" color="gray">
		<br>
		
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/admin_modify_ok.do">
			<input type="hidden" name="house_no" value="${dto.getHouse_no() }">
			<table border="1" cellspacing="0" width="600">
				<tr>
					<th>숙소 주인</th>
					<td>
						<!-- <input name="house_owner"> -->
						${dto.getHouse_owner() }
					</td>
				</tr>
				
				<tr>
					<th>숙소 이름</th>
					<td>
						<input name="house_name" value="${dto.getHouse_name() }">
					</td>
				</tr>
				
				<tr>
					<th>숙소 종류</th>
					<td>
						<input name="house_category" value="${dto.getHouse_category() }">
					</td>
				</tr>
				
				<tr>
					<th>유저 코드</th>
					<td>
						<input name="pmember_code" value="${dto.getPmember_code() }">
					</td>
				</tr>
				
				<tr>
					<th>숙소 위치</th>
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
					<th>숙소 설명</th>
					<td>
						<input name="house_content" value="${dto.getHouse_content() }">
					</td>
				</tr>
				
				<tr>
					<th>숙소 연락처</th>
					<td>
						<input name="house_phone" value="${dto.getHouse_phone() }">
					</td>
				</tr>
				
				<tr>
					<th>숙소 최대인원</th>
					<td>
						<input name="house_person" value="${dto.getHouse_person() }">
					</td>
				</tr>
				
				<tr>
					<th>숙소 별점</th>
					<td>
						<input name="house_star" value="${dto.getHouse_star() }">
						<%-- ★ ${dto.getHouse_star() } --%>
					</td>
				</tr>
				
				<tr>
					<th>숙소 이미지</th>
					<td>
						<%-- <input name="house_img" value="${dto.getHouse_img1() }"> --%>
						<%-- <img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img1() }" width="60" height="50">
						<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img2() }" width="60" height="50">
						<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img3() }" width="60" height="50"> --%>
						<input type="file" name="house_img1">
						<input type="file" name="house_img2">
						<input type="file" name="house_img3">
					</td>
				</tr>
				
				<tr>
					<th>숙소 결제수</th>
					<td>
						<!-- <input name="house_count"> -->
						${dto.getHouse_count() }
					</td>
				</tr>
		
				<tr>
					<th>숙소 편의시설</th>
					<td>
						수변 인접 여부 : <input name="house_water" value="${dto.getHouse_water() }"><br>
						수영장 여부 : <input name="house_pool" value="${dto.getHouse_water() }"><br>
						스키장 여부 : <input name="house_ski" value="${dto.getHouse_ski() }"><br>
						식사 제공 여부 : <input name="house_food" value="${dto.getHouse_food() }"><br>
						무료 주차 여부 : <input name="house_parking" value="${dto.getHouse_parking() }"><br>
						바베큐 그릴 여부 : <input name="house_grill" value="${dto.getHouse_grill() }"><br>
						흡연장 여부 : <input name="house_smoking" value="${dto.getHouse_smoking() }"><br>
						헬스장 여부 : <input name="house_gym" value="${dto.getHouse_gym() }"><br>
					</td>
				</tr>
				
				<tr>
					<th>숙소 등록일</th>
					<td>
						<%-- <input name="house_update">
						${dto.getHouse_update().substring(0,10) } --%> 
						<input name="house_update" value="${dto.getHouse_update().substring(0,10) }">
					</td>
				</tr>
				
			<c:if test="${empty dto }">
				<tr>
					<td colspan="2" align="center">
						<h3>조회된 게시물이 없습니다</h3>
					</td>
				</tr>
			</c:if>
			
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>