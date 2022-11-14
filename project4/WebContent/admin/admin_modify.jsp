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
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
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
	.input_box_cat {
		/* 둥근 입력창 스타일 */
		width: 210px;
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
		margin-left: 12%;
		text-align: left;
	}
	#sub_div_area1 .sub_div, #sub_div_area2 .sub_div { display: inline; }
	#sub_div_area1, #sub_div_area2 { margin-bottom: 20px; margin-left: 35%; }
	#sub_div_area3 { margin-top: 20px; }
	#sub_div_area4 { margin-top: 30px; }
	#sub_div_area5 { margin-top: 20px; margin-left: 33%; }
	#sub_div_area6 { margin-left: 15%;}
	#sub_div_area7 { text-align: center; margin-top: 50px; }
	.sub_div { margin-bottom: 20px; }
	.sub_div_btn { margin-right: 30%; }
	.one_tr { padding-right: 10px; padding-left: 90px;}
	.one {width: 450px;}
	.title_text { padding-right: 10px; }
	.title_file { padding-left: 24%; }
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
		width: 80%;
		height: 50%;
		border: 2;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		border-color: rgb(233, 233, 233);
		border-style: solid;
		padding: 3%;
	}
	#house_img1_preview {
	    display:none;
	}
	#house_img2_preview {
	    display:none;
	}
	#house_img3_preview {
	    display:none;
	}
	#sub_img1 {
		display: inline-block;
		width: 33%;
	}
	
	#sub_img2{
		display: inline-block;
		width: 33%;
	}
	
	#sub_img3 {
		display: inline-block;
		width: 33%;
	}
</style>
</head>
<body>
<jsp:include page="../include/top2.jsp" />
<c:set var="dto" value="${modify }"/>
<%-- enctype : 파일을 업로드하기 위한 속성 --%>
	<form id="form_tag"method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/admin_modify_ok.do">
	<div id="main">
		<div id="border">
		<div id="title">${dto.getHouse_name()} 숙소 수정</div><br>
		<input type="hidden" name="house_no" value="${dto.getHouse_no() }">
		<input type="hidden" value="${member_code_session }" name="pcode">
		<input type="hidden" name="house_star" value="${dto.getHouse_star() }">
		
		<div id="sub_div_area1">
			<div class="sub_div">
				<span class="title_text">숙소 주인</span>
				<input style="margin-left: 19.1%" class="input_box" name="house_owner" id="house_owner" value="${dto.getHouse_owner() }" readonly>
			</div>
		</div>
		
		<div id="sub_div_area1">
			<div class="sub_div">
				<span class="title_text">숙소 카테고리</span>
				<select style="margin-left: 16%" class="input_box_cat" name="house_category" id="house_category">
					<option value="호텔" <c:if test="${dto.getHouse_category() == '호텔'}"> selected </c:if>>호텔</option>
					<option value="아파트" <c:if test="${dto.getHouse_category() == '아파트'}"> selected </c:if>>아파트</option>
					<option value="리조트" <c:if test="${dto.getHouse_category() == '리조트'}"> selected </c:if>>리조트</option>
					<option value="게스트하우스" <c:if test="${dto.getHouse_category() == '게스트하우스'}"> selected </c:if>>게스트하우스</option>
				</select>
			</div>
		</div>
		
		<div id="sub_div_area1">
			<div class="sub_div">
				<span class="title_text">숙소 이름</span>
				<input style="margin-left: 19.1%" class="input_box" name="house_name" id="house_name" value="${dto.getHouse_name() }">
			</div>
		</div>
		
		<div id="sub_div_area2">
			<div class="sub_div">
				<span class="title_text">숙소 가격</span>
				<input style="margin-left: 19.1%" type="number" class="input_box" name="house_price" id="house_price" value="${dto.getHouse_price() }">
			</div>
		</div>
			
		<div id="sub_div_area1">
			<div class="sub_div" >
				<span class="title_text">숙소 전화번호</span>
				<input style="margin-left: 16%" class="input_box" name="house_phone" id="house_phone" value="${dto.getHouse_phone() }">
			</div>
		</div>
			
		<div id="sub_div_area1">
			<div class="sub_div">
				<span class="title_text">숙소 인원</span>
				<input style="margin-left: 19.1%" type="number" class="input_box" name="house_person" id="house_person" value="${dto.getHouse_person() }">
			</div>
		</div>
		
		<div id="sub_div_area2">
			<div class="sub_div">
				<table>
					<tr>
						<th><span class="title_text">숙소 주소</span></th>
						<td>
							<textarea style="margin-left: 80.1%" class="input_box" rows="1" cols="100" name="house_location" id="house_location">${dto.getHouse_location() }</textarea>
						</td>
					</tr>
				</table>	
			</div>
		</div>
	<div id="sub_div_area5">	
		<div id="map_area">
			<div id="map" style="width:500px;height:300px;z-index: -1;"></div>
			<p><em>지도를 클릭해주세요!</em></p> 
			<input id="latitude" name="latitude" value="${dto.getLatitude() }" readonly>
			<input id="longitude" name="longitude" value="${dto.getLongitude() }" readonly>
		</div>
	</div>
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
		<br>
		<div id="sub_div_area2">
			<div class="sub_div">
				<table>
					<tr>
						<th><span class="title_cont">숙소 소개</span></th>
						<td><textarea style="margin-left: 85%" class="input_box_cont" rows="1" cols="100" name="house_content" id="house_house_contentlocation">${dto.getHouse_content() }</textarea></td>
					</tr>
				</table>
			</div>
		</div>
			
		<div id="sub_img1">
				<span class="title_file">파일첨부1 : </span>
					<input type="file" name="house_img1"  style="width: 215px;" id="house_img1">
				    	<br>
				    	<span id="house_img1_preview">
				    		<img style="margin-left: 23%" src="#"  width="100px" />
					        <br>
					        <a href="#" style="margin-left: 23%">삭제</a>
				    	</span>
		</div>
				    	
		<div id="sub_img2">
				<span class="title_file">파일첨부2 : </span>
					<input type="file" name="house_img2" style="width: 215px;" id="house_img2">
				    	<br>
				    	<span id="house_img2_preview">
				    		<img src="#" style="margin-left: 23%"  width="100px" />
					        <br>
					        <a href="#" style="margin-left: 23%">삭제</a>
				    	</span>
		</div>
		
		<div id="sub_img3">	    	
				<span class="title_file">파일첨부3 : </span>
					<input type="file" name="house_img3" style="width: 215px;" id="house_img3">
				    	<br>
				    	<span id="house_img3_preview">
				    		<img src="#" style="margin-left: 23%"  width="100px" />
					        <br>
					        <a href="#" style="margin-left: 23%" >삭제</a>
				    	</span>
		</div>
				    
					
				    
<script type="text/javascript">
	$('#house_img1').on('change', function() {
					        
	ext = $(this).val().split('.').pop().toLowerCase(); 
					        
		if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
			resetFormElement($(this)); 
			window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
		} else {
			file = $('#house_img1').prop("files")[0];
			blobURL = window.URL.createObjectURL(file);
			$('#house_img1_preview img').attr('src', blobURL);
			$('#house_img1_preview').slideDown();
			$(this).slideUp(); 
		}
	});
					
	$('#house_img1_preview a').bind('click', function() {
		resetFormElement($('#house_img1'));
		$('#house_img1').slideDown();
		$(this).parent().slideUp();
		return false;
	});
					
	function resetFormElement(e) {
		e.wrap('<form>').closest('form').get(0).reset();
		e.unwrap(); 
	}
	
	$('#house_img2').on('change', function() {
        
		ext = $(this).val().split('.').pop().toLowerCase(); 
						        
			if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -2) {
				resetFormElement($(this)); 
				window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
			} else {
				file = $('#house_img2').prop("files")[0];
				blobURL = window.URL.createObjectURL(file);
				$('#house_img2_preview img').attr('src', blobURL);
				$('#house_img2_preview').slideDown();
				$(this).slideUp(); 
			}
		});
						
		$('#house_img2_preview a').bind('click', function() {
			resetFormElement($('#house_img2'));
			$('#house_img2').slideDown();
			$(this).parent().slideUp();
			return false;
		});
						
		function resetFormElement(e) {
			e.wrap('<form>').closest('form').get(0).reset();
			e.unwrap(); 
		}
		
		$('#house_img3').on('change', function() {
	        
			ext = $(this).val().split('.').pop().toLowerCase(); 
							        
				if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -3) {
					resetFormElement($(this)); 
					window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
				} else {
					file = $('#house_img3').prop("files")[0];
					blobURL = window.URL.createObjectURL(file);
					$('#house_img3_preview img').attr('src', blobURL);
					$('#house_img3_preview').slideDown();
					$(this).slideUp(); 
				}
			});
							
			$('#house_img3_preview a').bind('click', function() {
				resetFormElement($('#house_img3'));
				$('#house_img3').slideDown();
				$(this).parent().slideUp();
				return false;
			});
							
			function resetFormElement(e) {
				e.wrap('<form>').closest('form').get(0).reset();
				e.unwrap(); 
			}
</script>
		
		<br>
		<div id="sub_div_area6">
			<table style="border-collapse: separate; border-spacing:0px 20px;">
				<div class="sub_div">
					<tr>
						<th class="one_tr">
							<img src="main_img/top_water_40.png">
						</th>
						<td class="one">
							<span class="radio_title_text">수변인접 여부</span>
							<input style="margin-left: 5%"  type="radio" name="house_water" value="0" <c:if test="${dto.getHouse_water() == 0}">checked</c:if>> 없음
							<input style="margin-left: 5%"  type="radio" name="house_water" value="1" <c:if test="${dto.getHouse_water() == 1}">checked</c:if>> 있음
						</td>
						<th class="two_tr">
							<img src="main_img/top_pool_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">수영장 여부</span>
							<input style="margin-left: 13.5%" type="radio" name="house_pool" value="0" <c:if test="${dto.getHouse_pool() == 0}">checked</c:if>> 없음
							<input style="margin-left: 5%" type="radio" name="house_pool" value="1" <c:if test="${dto.getHouse_pool() == 1}">checked</c:if>> 있음
						</td>
					</tr>
				</div>
				<div class="sub_div">
					<tr>
						<th class="one_tr">
							<img src="main_img/top_ski_40.png">
						</th>
						<td class="one">
							<span class="radio_title_text" id="house_price">스키장 여부</span>
							<input style="margin-left: 8%" type="radio" name="house_ski" value="0" <c:if test="${dto.getHouse_ski() == 0}">checked</c:if>> 없음
							<input style="margin-left: 5%" type="radio" name="house_ski" value="1" <c:if test="${dto.getHouse_ski() == 1}">checked</c:if>> 있음
						</td>
						<th class="two_tr">
							<img src="main_img/food_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">식사제공 여부</span>
							<input style="margin-left: 9.5%" type="radio" name="house_food" value="0" <c:if test="${dto.getHouse_food() == 0}">checked</c:if>> 없음
							<input style="margin-left: 5%" type="radio" name="house_food" value="1" <c:if test="${dto.getHouse_food() == 1}">checked</c:if>> 있음
						</td>
					</tr>
				</div>
				<div class="sub_div">
					<tr>
						<th class="one_tr">
							<img src="main_img/top_parking_40.png">
						</th>
						<td class="one">
							<span class="radio_title_text" id="house_price">무료주차 여부</span>
							<input style="margin-left: 5%" type="radio" name="house_parking" value="0" <c:if test="${dto.getHouse_parking() == 0}">checked</c:if>>  없음
							<input style="margin-left: 5%" type="radio" name="house_parking" value="1" <c:if test="${dto.getHouse_parking() == 1}">checked</c:if>>  있음
						</td>
						<th class="two_tr">
							<img src="main_img/top_grill_40.png">
						</th>
						<td style="width: 400px;">
							<span class="radio_title_text" id="house_price">바베큐 그릴 여부</span>
							<input style="margin-left: 5%" type="radio" name="house_grill" value="0" <c:if test="${dto.getHouse_grill() == 0}">checked</c:if>>  없음
							<input style="margin-left: 5%" type="radio" name="house_grill" value="1" <c:if test="${dto.getHouse_grill() == 1}">checked</c:if>>  있음
						</td>
					</tr>
				</div>
				<div class="sub_div">
					<tr>
						<th class="one_tr">
							<img src="main_img/top_smoking_40.png">
						</th>
						<td class="one">
							<span class="radio_title_text" id="house_price">흡연장 여부</span>
							<input style="margin-left: 8%" type="radio" name="house_smoking" value="0" <c:if test="${dto.getHouse_smoking() == 0}">checked</c:if>>  없음
							<input style="margin-left: 5%" type="radio" name="house_smoking" value="1" <c:if test="${dto.getHouse_smoking() == 1}">checked</c:if>>  있음
						</td>
						<th class="two_tr">
							<img src="main_img/top_gym_40.png">
						</th>
						<td>
							<span class="radio_title_text" id="house_price">헬스장 여부</span>
							<input style="margin-left: 13.5%" type="radio" name="house_gym" value="0" <c:if test="${dto.getHouse_gym() == 0}">checked</c:if>> 없음
							<input style="margin-left: 5%" type="radio" name="house_gym" value="1" <c:if test="${dto.getHouse_gym() == 1}">checked</c:if>> 있음
						</td>
					</tr>
				</div>
			</table>
		</div>
	<div id="sub_div_area7">
		<div class="sub_div">
			<input id="btn" type="submit" value="숙소수정" class="host_btns">&nbsp;&nbsp;&nbsp;
			<input id="btn" type="reset" value="다시작성" class="host_btns">
		</div>
	</div>
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
