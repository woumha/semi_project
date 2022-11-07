<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- 모달 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- 모달 end -->

<style type="text/css">
#Host_list_box { text-align: center; }
#Host_list {
	border: 1px;
	cellspacing: 0;
	width: 1200px;
	align: center;
	text-align: center;
}
#paging_box { text-align: center; }
.input_box {
	/* 둥근 입력창 스타일 */
	width: 200px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
	/* 둥근 입력창 스타일 끝 */
}
.input_textbox {
	/* 둥근 입력창 스타일 */
	width: 200px;
	height: auto;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
	/* 둥근 입력창 스타일 끝 */
}
.input_textbox_location {
	/* 둥근 입력창 스타일 */
	width: auto;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
	/* 둥근 입력창 스타일 끝 */
}
.input_textbox_content {
	/* 둥근 입력창 스타일 */
	width: auto;
	height: auto;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
	/* 둥근 입력창 스타일 끝 */
}
.input_box_person {
	/* 둥근 입력창 스타일 */
	width: 30px;
	height: 30px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
	/* 둥근 입력창 스타일 끝 */
}
#content_title { text-align: center; margin-top: 2%; font-size: 25px; }
#main_div { margin-top: 2%; margin-bottom: 3%; margin-left: 30%; text-align: left; }
#sub_div_area1 .sub_div, #sub_div_area2 .sub_div { display: inline; }
#sub_div_area1, #sub_div_area2 { margin-bottom: 20px; }
#sub_div_area3 { margin-top: 50px; }
#sub_div_area4 { margin-top: 30px; }
#sub_div_area5 { margin-top: 30px; }
#sub_div_area6 { margin-top: 50px; }
#sub_div_area7 { text-align: center; margin-top: 50px; }
#content_button { text-align: center; margin-bottom: 100px; }
.sub_div { margin-bottom: 20px; }
.one_tr { padding-left: 30px; padding-right: 10px; }
.two_tr { padding-left: 180px; padding-right: 10px; }
.title_text { padding-right: 10px; }
.radio_title_text { padding-right: 15px; }
.host_btns {
	border: 0;
	width: 113px;
	height: 32px;
	margin-top: 35px;
	border-radius: 5%;
}
.host_btns:hover {
	background-color: #e85255;
	color: white;
	cursor: pointer;
}
</style>
</head>

<body>
<jsp:include page="../include/top2.jsp" />
<c:set var="dto" value="${house_content }" />
<div id="content_title">숙소 정보</div>
	<div id="main_div">
		<div id="sub_div_area1">
			<div class="sub_div">
				<span class="title_text">숙소 이름</span> <input class="input_box" name="house_name" id="house_name" value="${dto.getHouse_name() }" readonly>
			</div>
			<div class="sub_div" style="margin-left: 30px;">
				<span class="title_text">숙소 카테고리</span> <input class="input_box" name="house_category" id="house_category" value="${dto.getHouse_category() }" readonly>
			</div>
		</div>
		<div id="sub_div_area2">
			<div class="sub_div">
				<span class="title_text">숙소 가격</span> <input type="number" class="input_box" name="house_price" id="house_price" value="${dto.getHouse_price() }" readonly>
			</div>
			<div class="sub_div" style="margin-left: 30px;">
				<span class="title_text">숙소 전화번호</span> <input class="input_box" name="house_phone" id="house_phone" value="${dto.getHouse_phone() }" readonly>
			</div>
			<div class="sub_div" style="margin-left: 20px;">
				<span class="title_text">숙소 인원</span> <input type="number" class="input_box_person" name="house_person" id="house_person" value="${dto.getHouse_person() }" readonly>명
			</div>
		</div>
		<div id="sub_div_area3">
			<div class="sub_div">
				<table>
					<tr>
						<th><span class="title_text">숙소 주소</span></th>
						<td><textarea class="input_textbox_location" rows="1" cols="100" name="house_location" id="house_location" readonly>${dto.getHouse_location() }</textarea></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="sub_div_area4">
			<div class="sub_div">
				<table>
					<tr>
						<th><span class="title_text">숙소 소개</span></th>
						<td><textarea class="input_textbox_content" rows="10" cols="100" name="house_content" id="house_content" readonly>${dto.getHouse_content() }</textarea></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="sub_div_area5">
			<div class="sub_div">
				<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img1()}">
				<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img2()}">
				<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img3()}">
			</div>
		</div>
		<div id="sub_div_area6">
			<table style="border-collapse: separate; border-spacing:0px 20px;">
				<div class="sub_div">
					<tr>
						<th class="one_tr">
							<img src="main_img/top_water_40.png">
						</th>
						<td>
							<span class="radio_title_text">수변인접 여부</span>
							<input type="radio" name="house_water" value="0" onclick="return(false);" <c:if test="${dto.getHouse_water() == 0}">checked</c:if>>없음
							<input type="radio" name="house_water" value="1" onclick="return(false);" <c:if test="${dto.getHouse_water() == 1}">checked</c:if>>있음
						</td>
						<th class="two_tr">
							<img src="main_img/top_pool_40.png">
						</th>
						<td>
							<span class="radio_title_text">수영장 여부</span>
							<input type="radio" name="house_pool" value="0" onclick="return(false);" <c:if test="${dto.getHouse_pool() == 0}">checked</c:if>>없음
							<input type="radio" name="house_pool" value="1" onclick="return(false);" <c:if test="${dto.getHouse_pool() == 1}">checked</c:if>>있음
						</td>
					</tr>
				</div>
				<div class="sub_div">
					<tr>
						<th class="one_tr">
							<img src="main_img/top_ski_40.png">
						</th>
						<td>
							<span class="radio_title_text">스키장 여부</span>
							<input type="radio" name="house_ski" value="0" onclick="return(false);" <c:if test="${dto.getHouse_ski() == 0}">checked</c:if>>없음
							<input type="radio" name="house_ski" value="1" onclick="return(false);" <c:if test="${dto.getHouse_ski() == 1}">checked</c:if>>있음
						</td>
						<th class="two_tr">
							<img src="main_img/food_40.png">
						</th>
						<td>
							<span class="radio_title_text">식사제공 여부</span>
							<input type="radio" name="house_food" value="0" onclick="return(false);" <c:if test="${dto.getHouse_food() == 0}">checked</c:if>>없음
							<input type="radio" name="house_food" value="1" onclick="return(false);" <c:if test="${dto.getHouse_food() == 1}">checked</c:if>>있음
						</td>
					</tr>
				</div>
				<div class="sub_div">
					<tr>
						<th class="one_tr">
							<img src="main_img/top_parking_40.png">
						</th>
						<td>
							<span class="radio_title_text">무료주차 여부</span>
							<input type="radio" name="house_parking" value="0" onclick="return(false);" <c:if test="${dto.getHouse_parking() == 0}">checked</c:if>>없음
							<input type="radio" name="house_parking" value="1" onclick="return(false);" <c:if test="${dto.getHouse_parking() == 1}">checked</c:if>>있음
						</td>
						<th class="two_tr">
							<img src="main_img/top_grill_40.png">
						</th>
						<td>
							<span class="radio_title_text">바베큐 그릴 여부</span>
							<input type="radio" name="house_grill" value="0" onclick="return(false);" <c:if test="${dto.getHouse_grill() == 0}">checked</c:if>>없음
							<input type="radio" name="house_grill" value="1" onclick="return(false);" <c:if test="${dto.getHouse_grill() == 1}">checked</c:if>>있음
						</td>
					</tr>
				</div>
				<div class="sub_div">
					<tr>
						<th class="one_tr">
							<img src="main_img/top_smoking_40.png">
						</th>
						<td>
							<span class="radio_title_text">흡연장 여부</span>
							<input type="radio" name="house_smoking" value="0" onclick="return(false);" <c:if test="${dto.getHouse_smoking() == 0}">checked</c:if>>없음
							<input type="radio" name="house_smoking" value="1" onclick="return(false);" <c:if test="${dto.getHouse_smoking() == 1}">checked</c:if>>있음
						</td>
						<th class="two_tr">
							<img src="main_img/top_gym_40.png">
						</th>
						<td>
							<span class="radio_title_text">헬스장 여부</span>
							<input type="radio" name="house_gym" value="0" onclick="return(false);" <c:if test="${dto.getHouse_gym() == 0}">checked</c:if>>없음
							<input type="radio" name="house_gym" value="1" onclick="return(false);" <c:if test="${dto.getHouse_gym() == 1}">checked</c:if>>있음
						</td>
					</tr>
				</div>
			</table>
		</div>
	</div>
	<div id="content_button">
		<input type="button" class="host_btns" value="정보수정" onclick="location.href='host_modify.do?no=${dto.getHouse_no() }'">
		<input type="button" class="host_btns" value="숙소삭제" onclick="if(confirm('게시글을 정말 삭제하시겠습니까?'))
			{location.href='host_delete.do?no=${dto.getHouse_no() }&pcode=${member_code_session }'}else { return; }">
		<input type="button" class="host_btns" value="숙소목록" onclick="location.href='host_list.do?pcode=${member_code_session }'">
	</div>
<jsp:include page="../include/bottom.jsp" />
</body>
</html>