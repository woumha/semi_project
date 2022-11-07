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
		width: 150px;
		height: 32px;
		font-size: 15px;
		border: 0;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
		/* 둥근 입력창 스타일 끝 */
	}
	.input_box_no {
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
	.input_box_code {
		/* 둥근 입력창 스타일 */
		width: 90px;
		height: 30px;
		font-size: 15px;
		border: 0;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
		/* 둥근 입력창 스타일 끝 */
	}
	.input_box_star {
		/* 둥근 입력창 스타일 */
		width: 60px;
		height: 30px;
		font-size: 15px;
		border: 0;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
		/* 둥근 입력창 스타일 끝 */
	}
	.input_box_location {
		/* 둥근 입력창 스타일 */
		width: 488px;
		height: 30px;
		font-size: 15px;
		border: 0;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
		/* 둥근 입력창 스타일 끝 */
	}
	.input_box_content {
		/* 둥근 입력창 스타일 */
		width: 488px;
		height: 100px;
		font-size: 15px;
		border: 0;
		border-radius: 15px;
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
	#sub_div_area1, #sub_div_area2 { margin-bottom: 20px; }
	#sub_div_area3 { margin-top: 20px; }
	#sub_div_area4 { margin-top: 30px; }
	#sub_div_area5 { margin-top: 30px; }
	#sub_div_area6 { margin-top: 50px; }
	#sub_div_area7 { text-align: center; margin-top: 50px; }
	.sub_div { margin-bottom: 20px; }
	.sub_div_btn { margin-right: 30%; }
	.one_tr { padding-right: 10px; }
	.two_tr { padding-right: 10px; padding-left: 9px;}
	.th_tr { padding-right: 10px; padding-left: 2px;}
	.title_text { padding-right: 10px;}
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
</style>
</head>
<body>
<jsp:include page="../include/top2.jsp"/>
<c:set var="dto" value="${Cont }" />
	<div id="title">${dto.getHouse_name() }&nbsp;&nbsp;상세내역</div>		
		<div id="main">
			<div id="sub_div_area1">
				<div class="sub_div">
					<span class="title">숙소 번호</span>
					<input class="input_box_no" value="${dto.getHouse_no() }" readonly>
				</div>
				
				<div class="sub_div" style="margin-left: 30px;">
					<span class="title">유저 코드</span>
					<input class="input_box_code" value="${dto.getPmember_code() }" readonly>
				</div>
			
				<div class="sub_div" style="margin-left: 30px;">
					<span class="title">숙소 주인</span>
					<input class="input_box" value="${dto.getHouse_owner() }" readonly>
				</div>
			</div>
			
				<div id="sub_div_area2">
					<div class="sub_div">
						<span class="title">숙소 이름</span>
						<input class="input_box" value="${dto.getHouse_name() }" readonly>
					</div>
					
					<div class="sub_div">
						<span class="title" style="margin-left: 108px;">숙소 종류</span>
						<input class="input_box" value="${dto.getHouse_category() }" readonly>
					</div>
				</div>
				
				<div id="sub_div_area2">
					<div class="sub_div">
						<span class="title">숙소 가격(1박)</span>
						<input class="input_box" value="${dto.getHouse_price() }" readonly>
					</div>
					
					<div class="sub_div">
						<span class="title" style="margin-left: 66px;">숙소 연락처</span>
						<input class="input_box" value="${dto.getHouse_phone() }" readonly>
					</div>
				</div>
				
				<div id="sub_div_area2">
					<div class="sub_div">
						<span class="title">숙소 최대인원</span>
						<input class="input_box_no" value="${dto.getHouse_person() }" readonly>
					</div>
					
					<div class="sub_div">
						<span class="title" style="margin-left: 70px;">숙소 별점</span>
						<input class="input_box_star" value="★ ${dto.getHouse_star() }" readonly>
					</div>
					
					<div class="sub_div">
						<span class="title" style="margin-left: 66px;">숙소 결제 수</span>
						<input class="input_box_star" value="${dto.getHouse_count() }" readonly>
					</div>
				</div>
			
				<div id="sub_div_area3">
					<div class="sub_div">
						<span class="title">숙소 위치</span>
						<input class="input_box_location" value="${dto.getHouse_location() }" readonly>
					</div>
				</div>
		
				<div id="sub_div_area3">
					<div class="sub_div">
						<span class="title">숙소 소개</span>
						<input class="input_box_content" value="${dto.getHouse_content() }" readonly>
					</div>
				</div>
			
				<div id="sub_div_area5">
					<div class="sub_div">
						<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img1() }" >
						<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img2() }" >
						<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img3() }" >
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
								<span class="title">수변인접 여부</span>
								<input class="input_box_no" value="${dto.getHouse_water() }" readonly>
							</td>
							<th class="two_tr">
								<img src="main_img/top_pool_40.png">
							</th>
							<td>
								<span class="title">수영장 여부</span>
								<input class="input_box_no" value="${dto.getHouse_pool() }" readonly>
							</td>
							<th class="th_tr">
								<img src="main_img/top_ski_40.png">
							</th>
							<td>
								<span class="title">스키장 여부</span>
								<input class="input_box_no" value="${dto.getHouse_ski() }" readonly>
							</td>
						</tr>
					</div>
					<div class="sub_div">
						<tr>
							<th class="one_tr">
								<img src="main_img/food_40.png">
							</th>
							<td>
								<span class="title">식사 제공 여부</span>
								<input class="input_box_no" value="${dto.getHouse_food() }" readonly>
							</td>
							<th class="two_tr">
								<img src="main_img/top_parking_40.png">
							</th>
							<td>
								<span class="title">무료 주차 여부</span>
								<input class="input_box_no" value="${dto.getHouse_parking() }" readonly>
							</td>
							<th class="th_tr">
								<img src="main_img/top_smoking_40.png">
							</th>
							<td>
								<span class="title">흡연장 여부</span>
								<input class="input_box_no" value="${dto.getHouse_grill() }" readonly>
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
								<input class="input_box_no" value="${dto.getHouse_gym() }" readonly>
							</td>
							<th class="two_tr">
								<img src="main_img/top_grill_40.png">
							</th>
							<td>
								<span class="title">바베큐 그릴 여부</span>
								<input class="input_box_no" value="${dto.getHouse_grill() }" readonly>
							</td>
						</tr>
					</div>
				</table>
			</div>
					
			<div id="sub_div_area3">
				<div class="sub_div">
					<span class="title">숙소 등록일</span>
					<input class="input_box_location" value="${dto.getHouse_update().substring(0,10) }" readonly>
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