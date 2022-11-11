<%@page import="com.model.HouseDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.model.HouseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String allcategory = "전체"; 

	HouseDAO dao = HouseDAO.getInstance();

	List<HouseDTO> list = dao.getHouseList();

	request.setAttribute("List_start", list);
	request.setAttribute("List_title_start", allcategory); 
	
%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project4 main page</title>
<link rel="stylesheet" href="../CSS/main_style.css">
<script src="../JS/main_java2.js"> </script>
<link rel="stylesheet" href="CSS/main_style.css">
<script src="JS/main_java2.js"> </script>

<link rel="stylesheet" href="../CSS/top.css">
<script src="../JS/main_java2.js"> </script>
<link rel="stylesheet" href="CSS/top.css">
<script src="JS/main_java2.js"> </script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

</head>
<body>
	<jsp:include page="/include/top.jsp"/>
	<div id="header">

	<!-- 카테고리 상단 바 ============================================================================== -->
	<div id="header_category">
		<c:set var="answer" value="${List_title }"/>
		<ul class="main_topbar">
			<li>
				<form method="post" action="<%=request.getContextPath() %>/house_list.do">
					<input type="submit" value="" id="category1">
				</form>
				<p>전체</p>
				
				<c:if test="${answer ne '전체' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '전체' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>
			<li>
				<form method="post" action="<%=request.getContextPath() %>/house_category.do?keyword=호텔">
					<input type="submit" value="" id="category2">
				</form>
				<p>호텔</p>
				<c:if test="${answer ne '호텔' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '호텔' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>		
			<li>
				<form method="post" action="<%=request.getContextPath() %>/house_category.do?keyword=아파트">
					<input type="submit" value="" id="category3">
				</form>
				<p>아파트</p>
				<c:if test="${answer ne '아파트' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '아파트' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>	
			<li>
				<form method="post" action="<%=request.getContextPath() %>/house_category.do?keyword=리조트">
					<input type="submit" value="" id="category4">
				</form>
				<p>리조트</p>
				<c:if test="${answer ne '리조트' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '리조트' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>	
			<li>
				<form method="post" action="<%=request.getContextPath() %>/house_category.do?keyword=게스트하우스">
					<input type="submit" value="" id="category5">
				</form>
				<p>게스트하우스</p>
				<c:if test="${answer ne '게스트하우스' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '게스트하우스' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>	
			<li>
				<form method="post" action="<%=request.getContextPath() %>/category_hot.do">
					<input type="submit" value="" id="category6">
				</form>
				<p>인기순</p>
				<c:if test="${answer ne '인기순' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '인기순' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>
			<li>
				<form method="post" action="<%=request.getContextPath() %>/category_star.do">
					<input type="submit" value="" id="category7">
				</form>
				<p>별점순</p>
				<c:if test="${answer ne '별점순' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '별점순' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>
			<li>
				<form method="post" action="<%=request.getContextPath() %>/category_price.do">
					<input type="submit" value="" id="category8">
				</form>
				<p>가격순</p>
				<c:if test="${answer ne '가격순' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '가격순' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>
			<li>
				<form method="post" action="<%=request.getContextPath() %>/category_option.do?title=수변인접&water=1&pool=0&ski=0&grill=0&smoking=0&gym=0">
					<input type="submit" value="" id="category9">
				</form>
				<p>수변인접</p>
				<c:if test="${answer ne '수변인접' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '수변인접' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>	
			<li>
				<form method="post" action="<%=request.getContextPath() %>/category_option.do?title=수영장&water=0&pool=1&ski=0&grill=0&smoking=0&gym=0">
					<input type="submit" value="" id="category10">
				</form>
				<p>수영장</p>
				<c:if test="${answer ne '수영장' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '수영장' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>	
			<li>
				<form method="post" action="<%=request.getContextPath() %>/category_option.do?title=스키장&water=0&pool=0&ski=1&grill=0&smoking=0&gym=0">
					<input type="submit" value="" id="category11">
				</form>
				<p>스키장</p>
				<c:if test="${answer ne '스키장' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '스키장' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>	
			<li>
				<form method="post" action="<%=request.getContextPath() %>/category_option.do?title=바베큐&water=0&pool=0&ski=0&grill=1&smoking=0&gym=0">
					<input type="submit" value="" id="category12">
				</form>
				<p>바베큐</p>
				<c:if test="${answer ne '바베큐' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '바베큐' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>
			<li>
				<form method="post" action="<%=request.getContextPath() %>/category_option.do?title=흡연장&water=0&pool=0&ski=0&grill=0&smoking=1&gym=0">
					<input type="submit" value="" id="category13">
				</form>
				<p>흡연장</p>
				<c:if test="${answer ne '흡연장' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '흡연장' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>
			<li>
				<form method="post" action="<%=request.getContextPath() %>/category_option.do?title=헬스장&water=0&pool=0&ski=0&grill=0&smoking=0&gym=1">
					<input type="submit" value="" id="category14">
				</form>
				<p>헬스장</p>
				<c:if test="${answer ne '헬스장' }">
					<hr style="margin-top: 5px; height: 2px; background-color: white; border: 0">
				</c:if>
				<c:if test="${answer eq '헬스장' }">
					<hr style="margin-top: 5px; height: 2px; background-color: black; border: 0">
				</c:if>
			</li>
			<li>
				<a class="btn_filter" href="#ex7">
					<c:set var="list" value="${List }"/>
						<c:if test="${empty list }">
							<img src="/project4/main_img/filter_icon_40.png">	
						</c:if>
						<c:if test="${!empty list }">
							<img src="/project4/main_img/filter_icon_40.png">	
						</c:if>
					<p>필터</p>
				</a>
			</li>		
		</ul>
	</div>
	
	</div> <!-- header 영역 end -->
 	<!-- 모달창(필터) 내용 ============================================================ -->
 	<c:set var="f_category" value="${f_cate }"/>
	<div id="ex7" class="modal">
		<p id="filter_title"> 필터 </p>
		<hr style="margin-bottom: 20px; color: gray;">
  		<form method="post" action="<%=request.getContextPath() %>/filter_ok.do">
  			<div id="f_category_box">
				<p class="sub_title">숙소 유형 : <input id="filter_category" class="filter_input" name="filter_category" value="선택안함"></p>
				<div>
					<input class="filter_select" type="button" value="호텔" onclick="input_category('호텔')">
					<input class="filter_select" type="button" value="아파트" onclick="input_category('아파트')">
					<input class="filter_select" type="button" value="리조트" onclick="input_category('리조트')">
					<input class="filter_select" type="button" value="게스트하우스" onclick="input_category('게스트하우스')">
				</div>
			</div>
			<div id="f_price_box">
				<p class="sub_title">최대 요금 : ₩<input id="filter_price" class="filter_input" name="filter_price" value="0"> 이하</p>
				<div>
					<input class="filter_select" type="button" value="₩200,000" onclick="input_price(200000)">
					<input class="filter_select" type="button" value="₩250,000" onclick="input_price(250000)">
					<input class="filter_select" type="button" value="₩300,000" onclick="input_price(300000)">
					<input class="filter_select" type="button" value="₩350,000" onclick="input_price(350000)">
				</div>
			</div>
			<div id="f_person_box">
				<p class="sub_title">최대 인원 : <input id="filter_person" class="filter_input" name="filter_person" value="0">명 까지</p>
				<div>
					<input class="filter_select3" type="button" value="2명" onclick="input_person(2)">
					<input class="filter_select3" type="button" value="4명" onclick="input_person(4)">
					<input class="filter_select3" type="button" value="6명" onclick="input_person(6)">
					<input class="filter_select3" type="button" value="8명" onclick="input_person(8)">
					<input class="filter_select3" type="button" value="12명" onclick="input_person(12)">
				</div>
			</div>
			<div id="filter_submit_box">
				<input type="submit" name="filterOk" value="필터적용">
				<input type="reset" name="filter_reset" value="선택해제">
			</div>
		</form>
	</div>
 	<!-- 모달창 자바스크립트 영역 -->
	<script>
		function input_price(a) { document.getElementById("filter_price").value = a; }
		function input_person(e) { document.getElementById("filter_person").value = e; }
		function input_category(e) { document.getElementById("filter_category").value = e; }
    	$('a[href="#ex7"]').click(function(event) {
      		event.preventDefault();
 
      		$(this).modal({
        		fadeDuration: 250
      		});
    	});
	</script>
	<!-- 모달창(필터) 내용 end ======================================================== -->
	<!-- 카테고리 상단 바 end ========================================================================-->
	<c:set var="check" value="${check }"/>
	<c:if test="${empty check }">
		<c:set var="list" value="${List }"/>
		<ul class="center_list">
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
				<li class="center_imgs">
					<a href="detail.do?id=${dto.getHouse_no() }">
						<div>
							<img src="upload/${dto.getHouse_img1() }">
						</div>
						<p class="location">${dto.getHouse_name() }
							<span id="cont_star">★
								<c:if test="${dto.getHouse_star() == 0}">
									NEW!
								</c:if>
								<c:if test="${dto.getHouse_star() != 0}">
									${dto.getHouse_star() }
								</c:if>
							</span>
						</p> <!-- 이름 -->
						<p class="km">${dto.getHouse_location() }</p> <!-- 위치 -->
						<p class="date">${dto.getHouse_category() } &nbsp; ${dto.getHouse_person() }명</p> <!-- 종류 -->
						<p class="price">₩<fmt:formatNumber value="${dto.getHouse_price() }"/> <span style="font-weight: normal">/박</span></p> <!-- 가격 -->
					</a>
				</li>
			</c:forEach>
		</c:if>
		<c:if test="${empty list }">
			<c:set var="list1" value="${List_start }"/>
			<c:forEach items="${list1 }" var="dto1">
				<li class="center_imgs">
					<a href="../detail.do?id=${dto1.getHouse_no() }">
						<div>
							<img src="../upload/${dto1.getHouse_img1() }">
						</div>
						<p class="location">${dto1.getHouse_name() }
							<span id="cont_star">★
								<c:if test="${dto1.getHouse_star() == 0}">
									NEW!
								</c:if>
								<c:if test="${dto1.getHouse_star() != 0}">
									${dto1.getHouse_star() }
								</c:if>
							</span>
						</p> <!-- 이름 -->
						<p class="km">${dto1.getHouse_location() }</p> <!-- 위치 -->
						<p class="date">${dto1.getHouse_category() } &nbsp; ${dto1.getHouse_person() }명</p> <!-- 종류 -->
						<p class="price">₩<fmt:formatNumber value="${dto1.getHouse_price() }"/> <span style="font-weight: normal">/박</span></p> <!-- 가격 -->
					</a>
				</li>
			</c:forEach>
		</c:if>
		</ul>
	</c:if>
	<c:if test="${!empty check }">
		<c:set var="list" value="${List }"/>
		<ul class="center_list">
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
				<li class="center_imgs">
					<a href="detail.do?id=${dto.getHouse_no() }">
						<div>
							<img src="upload/${dto.getHouse_img1() }">
						</div>
						<p class="location">${dto.getHouse_name() }
							<span id="cont_star">★
								<c:if test="${dto.getHouse_star() == 0}">
									NEW!
								</c:if>
								<c:if test="${dto.getHouse_star() != 0}">
									${dto.getHouse_star() }
								</c:if>
							</span>
						</p> <!-- 이름 -->
						<p class="km">${dto.getHouse_location() }</p> <!-- 위치 -->
						<p class="date">${dto.getHouse_category() } &nbsp; ${dto.getHouse_person() }명</p> <!-- 종류 -->
						<p class="price">₩<fmt:formatNumber value="${dto.getHouse_price() }"/> <span style="font-weight: normal">/박</span></p> <!-- 가격 -->
					</a>
				</li>
			</c:forEach>
		</c:if>
		<c:if test="${empty list }">
			<p>검색된 숙소가 없습니다...</p>
		</c:if>
		</ul>	
	</c:if>
	<jsp:include page="/include/bottom.jsp"/>
</body>
</html>
