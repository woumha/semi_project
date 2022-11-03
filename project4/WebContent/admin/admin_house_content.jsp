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
		<c:set var="dto" value="${Cont }" />
		<hr width="50%" color="tomato">
			<h3>${dto.getHouse_name() } 상세 내역</h3>
		<hr width="50%" color="tomato">		
		<br>
		<table border="1" cellspacing="0" width="600">
			<tr>
				<th>숙소 번호</th>
				<td>${dto.getHouse_no() }</td>
			</tr>
			
			<tr>
				<th>숙소 주인</th>
				<td>${dto.getHouse_owner() }</td>
			</tr>
			
			<tr>
				<th>유저 코드</th>
				<td>${dto.getPmember_code() }</td>
			</tr>
			
			<tr>
				<th>숙소 이름</th>
				<td>${dto.getHouse_name() }</td>
			</tr>
			
			<tr>
				<th>숙소 종류</th>
				<td>${dto.getHouse_category() }</td>
			</tr>
			
			<tr>
				<th>숙소 위치</th>
				<td>${dto.getHouse_location() }</td>
			</tr>
			
			<tr>
				<th>숙소 가격(1박)</th>
				<td>${dto.getHouse_price() }</td>
			</tr> 
			
			<tr>
				<th>숙소 설명</th>
				<td>${dto.getHouse_content() }</td>
			</tr>
			
			<tr>
				<th>숙소 연락처</th>
				<td>${dto.getHouse_phone() }</td>
			</tr>
			
			<tr>
				<th>숙소 최대인원</th>
				<td>${dto.getHouse_person() }</td>
			</tr>
			
			<tr>
				<th>숙소 별점</th>
				<td>${dto.getHouse_star() }</td>
			</tr>
			
			<tr>
				<th>숙소 이미지</th>
					<c:if test="${!empty dto.getHouse_img1() }">
						<td>
							<%-- <a href="<%=request.getContextPath() %>/upload/${dto.getHouse_img1() }" target="_blank">
							${dto.getHouse_img1() }</a>
							<a href="<%=request.getContextPath() %>/upload/${dto.getHouse_img2() }" target="_blank">
							${dto.getHouse_img2() }</a>
							<a href="<%=request.getContextPath() %>/upload/${dto.getHouse_img3() }" target="_blank">
							${dto.getHouse_img3() }</a> --%>
							<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img1() }" width="60" height="50">
							<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img2() }" width="60" height="50">
							<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img3() }" width="60" height="50">
						</td>
					</c:if>
					<c:if test="${empty dto.getHouse_img1() }">
						<td></td>
					</c:if>
			</tr>
			
			<tr>
				<th>숙소 결제 수</th>
				<td>${dto.getHouse_count() }</td>
			</tr>
			
			<tr>
				<th>숙소 편의시설</th>
				<td>
					수변 인접 여부 : ${dto.getHouse_water() }<br>
					수영장 여부 : ${dto.getHouse_pool() }<br>
					스키장 여부 : ${dto.getHouse_ski() }<br>
					식사 제공 여부 : ${dto.getHouse_food() }<br>
					무료 주차 여부 : ${dto.getHouse_parking() }<br>
					바베큐 그릴 여부 : ${dto.getHouse_grill() }<br>
					흡연장 여부 : ${dto.getHouse_smoking() }<br>
					헬스장 여부 : ${dto.getHouse_gym() }
				</td>
			</tr>
			
			<tr>
				<th>숙소 등록일</th>
				<td>${dto.getHouse_update().substring(0,10) }</td>
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
					<input type="button" value="수정" onclick="location.href='admin_update.do?no=${dto.getHouse_no()}'">
					<input type="button" value="삭제" onclick="if(confirm('게시글을 삭제 하시겠습니까?')){
						location.href='admin_delete.do?no=${dto.getHouse_no()}'
					} else {return;}">
					<input type="button" value="목록으로" onclick="location.href='admin_house_list.do'">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>