<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.input_box {
		/* 둥근 입력창 스타일 */
		width: 200px;
		height: 30px;
		font-size: 15px;
		border: 0;
		border-radius: 5px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
		/* 둥근 입력창 스타일 끝 */
	}
	.input_box_no {
		/* 둥근 입력창 스타일 */
		width: 20px;
		height: 30px;
		font-size: 15px;
		border: 0;
		border-radius: 5px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
		/* 둥근 입력창 스타일 끝 */
	}
	.input_box_cont {
		/* 둥근 입력창 스타일 */
		width: 200px;
		height: 80px;
		font-size: 15px;
		border: 0;
		border-radius: 5px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
		/* 둥근 입력창 스타일 끝 */
	}
	#title {
		text-align: center;
		margin-top: 2%;
		font-size: 25px;
	}
	#main {
		margin-top: 2%;
		margin-bottom: 3%;
		margin-left: 30%;
		text-align: left;
	}
	#sub_div_area1 .sub_div, #sub_div_area2 .sub_div { display: inline; }
	#sub_div_area1, #sub_div_area2 { margin-bottom: 20px; margin-left: 20%; }
	#sub_div_area3 { margin-top: 20px; }
	#sub_div_area4 { margin-top: 30px; }
	#sub_div_area5 { margin-top: 30px; }
	#sub_div_area6 { margin-top: 50px; }
	#sub_div_area7 { text-align: center; margin-top: 50px; }
	.sub_div { margin-bottom: 20px; }
	.sub_div_btn { margin-right: 30%; }
	.one_tr { padding-right: 10px;}
	.two_tr { padding-right: 10px; padding-left: 150px;}
	.title_text { padding-right: 10px; }
	#btn {
		border: 0;
		width: 113px;
		height: 32px;
		border-radius: 5%;
	}
	#btn:hover {
		background-color: #e85255;
		color: white;
		cursor: pointer;
	}
	#border {
		width: 58%;
		height: 50%;
		border: 2;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		border-color: rgb(233, 233, 233);
		border-style: solid;
		padding: 3%;
	}
</style>
</head>
<body>
<jsp:include page="../include/top2.jsp"/>
<c:set var="dto" value="${Cont }" />
		<div id="main">
		<div id="border">
		<div id="title">${dto.getHouse_name() }&nbsp;&nbsp;상세내역</div><br>	
			<div id="sub_div_area1">
				<div class="sub_div">
					<span class="title">숙소 번호</span>
					<input style="margin-left: 21.2%" class="input_box" value="${dto.getHouse_no() }" readonly>
				</div>
			</div>
			
			<div id="sub_div_area1">
				<div class="sub_div">
					<span class="title">유저 코드</span>
					<input style="margin-left: 21.2%" class="input_box" value="${dto.getPmember_code() }" readonly>
				</div>
			</div>
			
			<div id="sub_div_area1">
				<div class="sub_div">
					<span class="title">숙소 주인</span>
					<input style="margin-left: 21.2%" class="input_box" value="${dto.getHouse_owner() }" readonly>
				</div>
			</div>
			
				<div id="sub_div_area2">
					<div class="sub_div">
						<span class="title">숙소 이름</span>
						<input style="margin-left: 21.2%" class="input_box" value="${dto.getHouse_name() }" readonly>
					</div>
				</div>
					
				<div id="sub_div_area2">
					<div class="sub_div">
						<span class="title">숙소 종류</span>
						<input style="margin-left: 21.2%" class="input_box" value="${dto.getHouse_category() }" readonly>
					</div>
				</div>
				
				<div id="sub_div_area2">
					<div class="sub_div">
						<span class="title">숙소 가격(1박)</span>
						<input style="margin-left: 14.9%" class="input_box" value="${dto.getHouse_price() }" readonly>
					</div>
				</div>
					
				<div id="sub_div_area2">
					<div class="sub_div">
						<span class="title">숙소 연락처</span>
						<input style="margin-left: 18.2%" class="input_box" value="${dto.getHouse_phone() }" readonly>
					</div>
				</div>
				
				<div id="sub_div_area2">
					<div class="sub_div">
						<span class="title">숙소 최대인원</span>
						<input style="margin-left: 15.2%" class="input_box" value="${dto.getHouse_person() }" readonly>
					</div>
				</div>
					
				<div id="sub_div_area2">
					<div class="sub_div">
						<span class="title">숙소 별점</span>
						<input style="margin-left: 21.2%" class="input_box" value="★ ${dto.getHouse_star() }" readonly>
					</div>
				</div>
					
				<div id="sub_div_area2">
					<div class="sub_div">
						<span class="title">숙소 결제 수</span>
						<input style="margin-left: 17.2%" class="input_box" value="${dto.getHouse_count() }" readonly>
					</div>
				</div>
			
				<div id="sub_div_area2">
					<div class="sub_div">
						<span class="title">숙소 위치</span>
						<input style="margin-left: 21.2%" class="input_box" value="${dto.getHouse_location() }" readonly>
						
						<div id="map" style="width:880px;height:500px;"></div>
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
		/* kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    		// 클릭한 위도, 경도 정보를 가져옵니다 
    		var latlng = mouseEvent.latLng; 
    
    		// 마커 위치를 클릭한 위치로 옮깁니다
    		marker.setPosition(latlng);
    
    		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    		message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    		document.getElementById('latitude').value = latlng.getLat(); 
    		document.getElementById('longitude').value = latlng.getLng(); 
    		
		}); */
</script>
					</div>
				</div>
				
				<div id="sub_div_area2">
					<div class="sub_div">
						<span class="title">숙소 등록일</span>
						<input style="margin-left: 18.2%" class="input_box" value="${dto.getHouse_update().substring(0,10) }" readonly>
					</div>
				</div>
		
				<div id="sub_div_area2">
					<div class="sub_div">
					<table>
						<tr>
							<th><span class="title_cont">숙소 소개</span></th>
							<td><textarea style="margin-left: 47%" class="input_box_cont" rows="1" cols="100" name="house_content" id="house_house_contentlocation" readonly>${dto.getHouse_content() }</textarea></td>
						</tr>
					</table>
					</div>
				</div>
			
				<div id="sub_div_area5">
					<div class="sub_div">
						<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img1() }" width="100%">
						<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img2() }" width="100%">
						<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img3() }" width="100%">
					</div>
				</div> 
			
			<div id="sub_div_area5">
				<table style="border-collapse: separate; border-spacing:0px 20px;">
					<div class="sub_div">
						<tr>
							<th class="one_tr">
								<img src="main_img/top_water_40.png">
							</th>
							<td>
								<!-- <span class="title">수변인접 여부</span> -->
								<span class="radio_title_text">수변인접 여부</span>
								<c:if test="${dto.getHouse_water() == 0}"><input style="margin-left: 30px" class="input_box_no" name="house_water" value="X" readonly></c:if>
								<c:if test="${dto.getHouse_water() == 1}"><input style="margin-left: 30px" class="input_box_no" name="house_water" value="O" readonly></c:if>
							</td>
							<th class="two_tr">
								<img src="main_img/top_pool_40.png">
							</th>
							<td>
								<span class="title">수영장 여부</span>
								<c:if test="${dto.getHouse_pool() == 0}"><input style="margin-left: 58px" class="input_box_no" name="house_water" value="X" readonly></c:if>
								<c:if test="${dto.getHouse_pool() == 1}"><input style="margin-left: 58px" class="input_box_no" name="house_water" value="O" readonly></c:if>
							</td>
						</tr>
					</div>
					<div class="sub_div">
						<tr>
							<th class="one_tr">
								<img src="main_img/top_ski_40.png">
							</th>
							<td>
								<span class="title">스키장 여부</span>
								<c:if test="${dto.getHouse_ski() == 0}"><input style="margin-left: 43px" class="input_box_no" name="house_water" value="X" readonly></c:if>
								<c:if test="${dto.getHouse_ski() == 1}"><input style="margin-left: 43px" class="input_box_no" name="house_water" value="O" readonly></c:if>
							</td>
							
							<th class="two_tr">
								<img src="main_img/food_40.png">
							</th>
							<td>
								<span class="title">식사 제공 여부</span>
								<c:if test="${dto.getHouse_food() == 0}"><input style="margin-left: 41px" class="input_box_no" name="house_water" value="X" readonly></c:if>
								<c:if test="${dto.getHouse_food() == 1}"><input style="margin-left: 41px" class="input_box_no" name="house_water" value="O" readonly></c:if>
							</td>
						</tr>
					</div>
					<div class="sub_div">
						<tr>
							<th class="one_tr">
								<img src="main_img/top_parking_40.png">
							</th>
							<td>
								<span class="title">무료 주차 여부</span>
								<c:if test="${dto.getHouse_parking() == 0}"><input style="margin-left: 25px" class="input_box_no" name="house_water" value="X" readonly></c:if>
								<c:if test="${dto.getHouse_parking() == 1}"><input style="margin-left: 25px" class="input_box_no" name="house_water" value="O" readonly></c:if>
							</td>
							<th class="two_tr">
								<img src="main_img/top_smoking_40.png">
							</th>
							<td>
								<span class="title">흡연장 여부</span>
								<c:if test="${dto.getHouse_smoking() == 0}"><input style="margin-left: 59.6px" class="input_box_no" name="house_water" value="X" readonly></c:if>
								<c:if test="${dto.getHouse_smoking() == 1}"><input style="margin-left: 59.6px" class="input_box_no" name="house_water" value="O" readonly></c:if>
							</td>
						</tr>
					</div>
					<div class="sub_div">
						<tr>
							<th class="one_tr">
								<img src="main_img/top_gym_40.png">
							</th>
							<td>
								<span class="title">헬스장 여부</span>
								<c:if test="${dto.getHouse_gym() == 0}"><input style="margin-left: 43px" class="input_box_no" name="house_water" value="X" readonly></c:if>
								<c:if test="${dto.getHouse_gym() == 1}"><input style="margin-left: 43px" class="input_box_no" name="house_water" value="O" readonly></c:if>
							</td>
							<th class="two_tr">
								<img src="main_img/top_grill_40.png">
							</th>
							<td>
								<span class="title">바베큐 그릴 여부</span>
								<c:if test="${dto.getHouse_grill() == 0}"><input style="margin-left: 29.3px" class="input_box_no" name="house_water" value="X" readonly></c:if>
								<c:if test="${dto.getHouse_grill() == 1}"><input style="margin-left: 29.3px" class="input_box_no" name="house_water" value="O" readonly></c:if>
							</td>
						</tr>
					</div>
				</table>
			</div>
			</div>
			
			<c:if test="${empty dto }">
					<td colspan="2" align="center">
						<h3>조회된 게시물이 없습니다</h3>
			</c:if>

			<div id="sub_div_area7">
				<div class="sub_div_btn">
					<input type="button" id="btn" value="수정" onclick="location.href='admin_update.do?no=${dto.getHouse_no()}'">
					<input type="button" id="btn" value="삭제" onclick="if(confirm('게시글을 삭제 하시겠습니까?')){
						location.href='admin_delete.do?no=${dto.getHouse_no()}'
					} else {return;}">
					<input type="button" id="btn" value="목록으로" onclick="location.href='admin_house_list.do'">
				</div>
			</div>
		</div>
	<jsp:include page="../include/bottom.jsp"/>
</body>
</html>