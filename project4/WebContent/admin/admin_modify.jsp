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
.input_box_name {
	/* 둥근 입력창 스타일 */
	width: 150px;
	height: 30px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
	/* 둥근 입력창 스타일 끝 */
}
#write_title { text-align: center; margin-top: 2%; font-size: 25px; }
#main_div { margin-top: 2%; margin-bottom: 3%; margin-left: 30%; text-align: left; }
#sub_div_area1 .sub_div, #sub_div_area2 .sub_div { display: inline; }
#sub_div_area1, #sub_div_area2 { margin-bottom: 20px; }
#sub_div_area3 { margin-top: 50px; }
#sub_div_area4 { margin-top: 30px; }
#sub_div_area5 { margin-top: 30px; }
#sub_div_area6 { margin-top: 50px; }
#sub_div_area7 { text-align: center; margin-top: 50px; }
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
<c:set var="dto" value="${modify }"/>
<div id="write_title">${dto.getHouse_name()} 숙소 수정</div>
<%-- enctype : 파일을 업로드하기 위한 속성 --%>
	<form id="form_tag"method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/admin_modify_ok.do">
	<div id="main_div">
		<input type="hidden" name="house_no" value="${dto.getHouse_no() }">
		<input type="hidden" value="${member_code_session }" name="pcode">
		<div id="sub_div_area1">
			<div class="sub_div">
				<span class="title_text">숙소 주인</span> <input class="input_box_name" name="house_owner" id="house_owner" value="${dto.getHouse_owner() }" readonly>
			</div>
			<div class="sub_div" style="margin-left: 30px;">
				<span class="title_text">숙소 카테고리</span>
				<select class="input_box_name" name="house_category" id="house_category">
					<option value="호텔" selected>호텔</option>
					<option value="아파트">아파트</option>
					<option value="리조트">리조트</option>
					<option value="게스트하우스">게스트하우스</option>
				</select>
			</div>
			<div class="sub_div">
				<span class="title_text" style="margin-left: 30px;">숙소 이름</span> <input class="input_box_name" name="house_name" id="house_name" value="${dto.getHouse_name() }">
			</div>
		</div>
		<div id="sub_div_area2">
			<div class="sub_div">
				<span class="title_text">숙소 가격</span> <input type="number" class="input_box" name="house_price" id="house_price" value="${dto.getHouse_price() }">
			</div>
			<div class="sub_div" style="margin-left: 30px;">
				<span class="title_text">숙소 전화번호</span> <input class="input_box" name="house_phone" id="house_phone" value="${dto.getHouse_phone() }">
			</div>
			<div class="sub_div" style="margin-left: 20px;">
				<span class="title_text">숙소 인원</span> <input type="number" class="input_box_person" name="house_person" id="house_person" value="${dto.getHouse_person() }">명
			</div>
		</div>
		<div id="sub_div_area3">
			<div class="sub_div">
				<table>
					<tr>
						<th><span class="title_text">숙소 주소</span></th>
						<td><textarea class="input_textbox_location" rows="1" cols="100" name="house_location" id="house_location">${dto.getHouse_location() }</textarea></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="sub_div_area4">
			<div class="sub_div">
				<table>
					<tr>
						<th><span class="title_text">숙소 소개</span></th>
						<td><textarea class="input_textbox_content" rows="10" cols="100" name="house_content" id="house_content"></textarea></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="sub_div_area5">
			<div class="sub_div">
				<span class="title_text">파일첨부1</span> <input type="file" name="house_img1" id="house_img1">
				<span class="title_text">파일첨부2</span> <input type="file" name="house_img2" id="house_img2">
				<span class="title_text">파일첨부3</span> <input type="file" name="house_img3" id="house_img3">
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
							<input class="input_radio" type="radio" name="house_water" id="house_water" value="0" checked>없음
							<input class="input_radio" type="radio" name="house_water" id="house_water" value="1">있음
						</td>
						<th class="two_tr">
							<img src="main_img/top_pool_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">수영장 여부</span>
							<input class="input_radio" type="radio" name="house_pool" id="house_pool" value="0" checked>없음
							<input class="input_radio" type="radio" name="house_pool" id="house_pool" value="1">있음
						</td>
					</tr>
				</div>
				<div class="sub_div">
					<tr>
						<th class="one_tr">
							<img src="main_img/top_ski_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">스키장 여부</span>
							<input class="input_radio" type="radio" name="house_ski" id="house_ski" value="0" checked>없음
							<input class="input_radio" type="radio" name="house_ski" id="house_ski" value="1">있음
						</td>
						<th class="two_tr">
							<img src="main_img/food_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">식사제공 여부</span>
							<input class="input_radio" type="radio" name="house_food" id="house_food" value="0" checked>없음
							<input class="input_radio" type="radio" name="house_food" id="house_food" value="1">있음
						</td>
					</tr>
				</div>
				<div class="sub_div">
					<tr>
						<th class="one_tr">
							<img src="main_img/top_parking_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">무료주차 여부</span>
							<input class="input_radio" type="radio" name="house_parking" id="house_parking" value="0" checked>없음
							<input class="input_radio" type="radio" name="house_parking" id="house_parking" value="1">있음
						</td>
						<th class="two_tr">
							<img src="main_img/top_grill_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">바베큐 그릴 여부</span>
							<input class="input_radio" type="radio" name="house_grill" id="house_grill" value="0" checked>없음
							<input class="input_radio" type="radio" name="house_grill" id="house_grill" value="1">있음
						</td>
					</tr>
				</div>
				<div class="sub_div">
					<tr>
						<th class="one_tr">
							<img src="main_img/top_smoking_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">흡연장 여부</span>
							<input class="input_radio" type="radio" name="house_smoking" id="house_smoking" value="0" checked>없음
							<input class="input_radio" type="radio" name="house_smoking" id="house_smoking" value="1">있음
						</td>
						<th class="two_tr">
							<img src="main_img/top_gym_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">헬스장 여부</span>
							<input class="input_radio" type="radio" name="house_gym" id="house_gym" value="0" checked>없음
							<input class="input_radio" type="radio" name="house_gym" id="house_gym" value="1">있음
						</td>
					</tr>
				</div>
			</table>
		</div>
	</div>
	<div id="sub_div_area7">
		<div class="sub_div">
			<input type="submit" value="숙소수정" class="host_btns">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="다시작성" class="host_btns">
		</div>
	</div>
</form>
<script>
	let ft = document.getElementById("form_tag");
	ft.addEventListener("submit", function(e){
		let hname = document.getElementById("house_name");
		let hcategory = document.getElementById("house_category");
		let hprice = document.getElementById("house_price");
		let hphone = document.getElementById("house_phone");
		let hperson = document.getElementById("house_person");
		let hlocation = document.getElementById("house_location");
		let hcontent = document.getElementById("house_content");
		let hwater = document.getElementById("house_water");
		let hpool = document.getElementById("house_pool");
		let hski = document.getElementById("house_ski");
		let hfood = document.getElementById("house_food");
		let hparking = document.getElementById("house_parking");
		let hgrill = document.getElementById("house_grill");
		let hsmoking = document.getElementById("house_smoking");
		let hgym = document.getElementById("house_gym");
		
		if(hname.value.length == 0) { alert('숙소 이름을 입력해주세요!'); e.preventDefault();
		} else if(hcategory.value.length == 0) { alert('숙소 카테고리를 선택해주세요!'); e.preventDefault();
		} else if(hprice.value.length == 0) { alert('숙소 가격을 입력해주세요!'); e.preventDefault();
		} else if(hphone.value.length == 0) { alert('숙소 전화번호를 입력해주세요!'); e.preventDefault();
		} else if(hperson.value.length == 0) { alert('숙소 최대 인원 수를 입력해주세요!'); e.preventDefault();
		} else if(hlocation.value.length == 0) { alert('숙소 주소를 입력해주세요!'); e.preventDefault();
		} else if(hcontent.value.length == 0) { alert('숙소 소개를 입력해주세요!'); e.preventDefault();
		} else if(hwater.value.length == 0) { alert('수변인접 여부를 선택해주세요!'); e.preventDefault();
		} else if(hpool.value.length == 0) { alert('수영장 여부를 선택해주세요!'); e.preventDefault();
		} else if(hski.value.length == 0) { alert('스키장 여부를 선택해주세요!'); e.preventDefault();
		} else if(hfood.value.length == 0) { alert('식사제공 여부를 선택해주세요!'); e.preventDefault();
		} else if(hparking.value.length == 0) { alert('무료주차 여부를 선택해주세요!'); e.preventDefault();
		} else if(hgrill.value.length == 0) { alert('바베큐 그릴 여부를 선택해주세요!'); e.preventDefault();
		} else if(hsmoking.value.length == 0) { alert('흡연장 여부를 선택해주세요!'); e.preventDefault();
		} else if(hgym.value.length == 0) { alert('헬스장 여부를 선택해주세요!'); e.preventDefault();
		}
	});
</script>

<jsp:include page="../include/bottom.jsp" />
</body>
</html>