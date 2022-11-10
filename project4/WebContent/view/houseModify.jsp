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
<jsp:include page="../include/top.jsp"/>
<c:set var="dto" value="${HouseCont }" />
<div id="write_title">숙소 정보 수정</div>
<%-- enctype : 파일을 업로드하기 위한 속성 --%>
	<form id="form_tag" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/host_modify_ok.do">
	<div id="main_div">
		<input type="hidden" name="house_no" value="${dto.getHouse_no() }">
		<input type="hidden" name="pcode" value="${member_code_session }">
		<div id="sub_div_area1">
			<div class="sub_div">
				<span class="title_text">숙소 이름</span> <input class="input_box" name="house_name" id="house_name" value="${dto.getHouse_name() }">
			</div>
			<div class="sub_div" style="margin-left: 30px;">
				<span class="title_text">숙소 카테고리</span>
				<select class="input_box" name="house_category" id="house_category">
					<option value="호텔" <c:if test="${dto.getHouse_category() == '호텔'}"> selected </c:if>>호텔</option>
						<option value="아파트" <c:if test="${dto.getHouse_category() == '아파트'}"> selected </c:if>>아파트</option>
						<option value="리조트" <c:if test="${dto.getHouse_category() == '리조트'}"> selected </c:if>>리조트</option>
						<option value="게스트하우스" <c:if test="${dto.getHouse_category() == '게스트하우스'}"> selected </c:if>>게스트하우스</option>
				</select>
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
						<td><textarea class="input_textbox_content" rows="10" cols="100" name="house_content" id="house_content">${dto.getHouse_content() }</textarea></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="sub_div_area5">
			<div class="sub_div">
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
			</div>
		</div>
		
		<div id="map_area">
			<div id="map" style="width:880px;height:500px;"></div>
			<p><em>지도를 클릭해주세요!</em></p> 
			<input id="latitude" name="latitude" value="${dto.getLatitude() }" readonly>
			<input id="longitude" name="longitude" value="${dto.getLongitude() }" readonly>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b133548e794b66e5c1831469d0d70884"></script>
<script>
		var la = '<c:out value="${dto.getLatitude()}"/>';
		var lo = '<c:out value="${dto.getLongitude()}"/>';
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		mapOption = { 
        		center: new kakao.maps.LatLng(la, lo), // 지도의 중심좌표
       			level: 3 // 지도의 확대 레벨
    		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
   		// 지도 중심좌표에 마커를 생성합니다 
   		position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    		// 클릭한 위도, 경도 정보를 가져옵니다 
    		var latlng = mouseEvent.latLng; 
    
    		// 마커 위치를 클릭한 위치로 옮깁니다
    		marker.setPosition(latlng);
    
    		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    		message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    		document.getElementById('latitude').value = latlng.getLat(); 
    		document.getElementById('longitude').value = latlng.getLng(); 
    		
		});
		</script>
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
							<input class="input_radio" type="radio" name="house_water" id="house_water" value="0" <c:if test="${dto.getHouse_water() == 0}">checked</c:if>>없음
							<input class="input_radio" type="radio" name="house_water" id="house_water" value="1" <c:if test="${dto.getHouse_water() == 1}">checked</c:if>>있음
						</td>
						<th class="two_tr">
							<img src="main_img/top_pool_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">수영장 여부</span>
							<input class="input_radio" type="radio" name="house_pool" id="house_pool" value="0" <c:if test="${dto.getHouse_pool() == 0}">checked</c:if>>없음
							<input class="input_radio" type="radio" name="house_pool" id="house_pool" value="1" <c:if test="${dto.getHouse_pool() == 1}">checked</c:if>>있음
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
							<input class="input_radio" type="radio" name="house_ski" id="house_ski" value="0" <c:if test="${dto.getHouse_ski() == 0}">checked</c:if>>없음
							<input class="input_radio" type="radio" name="house_ski" id="house_ski" value="1" <c:if test="${dto.getHouse_ski() == 1}">checked</c:if>>있음
						</td>
						<th class="two_tr">
							<img src="main_img/food_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">식사제공 여부</span>
							<input class="input_radio" type="radio" name="house_food" id="house_food" value="0" <c:if test="${dto.getHouse_food() == 0}">checked</c:if>>없음
							<input class="input_radio" type="radio" name="house_food" id="house_food" value="1" <c:if test="${dto.getHouse_food() == 1}">checked</c:if>>있음
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
							<input class="input_radio" type="radio" name="house_parking" id="house_parking" value="0" <c:if test="${dto.getHouse_parking() == 0}">checked</c:if>>없음
							<input class="input_radio" type="radio" name="house_parking" id="house_parking" value="1" <c:if test="${dto.getHouse_parking() == 1}">checked</c:if>>있음
						</td>
						<th class="two_tr">
							<img src="main_img/top_grill_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">바베큐 그릴 여부</span>
							<input class="input_radio" type="radio" name="house_grill" id="house_grill" value="0" <c:if test="${dto.getHouse_grill() == 0}">checked</c:if>>없음
							<input class="input_radio" type="radio" name="house_grill" id="house_grill" value="1" <c:if test="${dto.getHouse_grill() == 1}">checked</c:if>>있음
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
							<input class="input_radio" type="radio" name="house_smoking" id="house_smoking" value="0" <c:if test="${dto.getHouse_smoking() == 0}">checked</c:if>>없음
							<input class="input_radio" type="radio" name="house_smoking" id="house_smoking" value="1" <c:if test="${dto.getHouse_smoking() == 1}">checked</c:if>>있음
						</td>
						<th class="two_tr">
							<img src="main_img/top_gym_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">헬스장 여부</span>
							<input class="input_radio" type="radio" name="house_gym" id="house_gym" value="0" <c:if test="${dto.getHouse_gym() == 0}">checked</c:if>>없음
							<input class="input_radio" type="radio" name="house_gym" id="house_gym" value="1" <c:if test="${dto.getHouse_gym() == 1}">checked</c:if>>있음
						</td>
					</tr>
				</div>
			</table>
		</div>
	</div>
	<div id="sub_div_area7">
		<div class="sub_div">
			<input type="submit" class="host_btns" value="정보수정"> &nbsp;&nbsp;&nbsp;
			<input type="reset" class="host_btns" value="다시작성">
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
		let himg1 = document.getElementById("house_img1");
		let himg2 = document.getElementById("house_img2");
		let himg3 = document.getElementById("house_img3");
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
		} else if(himg1.value.length == 0) { alert('숙소 이미지(1)를 첨부해주세요!'); e.preventDefault();
		} else if(himg2.value.length == 0) { alert('숙소 이미지(2)를 첨부해주세요!'); e.preventDefault();
		} else if(himg3.value.length == 0) { alert('숙소 이미지(3)를 첨부해주세요!'); e.preventDefault();
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