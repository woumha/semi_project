<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- 모달 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- 모달 end -->

<style type="text/css">

#Host_list_box {
	margin-left: 19%
}

#Host_list {
	border: 1px;
	cellspacing: 0;
	width: 1200px;
	align: center;
	text-align: center;
}

#paging_box {
	text-align: center;
}
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
<div id="Host_list_box">
	<table id="Host_list">
		<tr>
			<td colspan="8" align="center">
				<h3 style="margin-bottom: 20px;">숙소 리스트</h3>
			</td>
		</tr>
	
		<tr>
			<th width="5%">숙소No</th>
			<th width="20%">숙소이름</th>
			<th width="10%">종류</th>
			<th width="10%">가격</th>
			<th width="10%">인원</th>
			<th width="10%">별점</th>
			<th width="10%">등록일</th>
			<th width="10%">결제수</th>
		</tr>
		
		<c:set var="list" value="${HostList }"/>
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
				<tr>
					<td style="text-align: center;"> ${dto.getHouse_no() } </td>
					<td>
						<a href="<%=request.getContextPath() %>/host_content.do?no=${dto.getHouse_no() }">
							<div style="padding-left: 10%; text-align: left">
								<img src="<%=request.getContextPath() %>/upload/${dto.getHouse_img1()}" width="50" height="50">
								${dto.getHouse_name() }
							</div>
						</a>
					</td>
					<td style="text-align: center;"> ${dto.getHouse_category() } </td>
					<td style="text-align: center;">
						<fmt:formatNumber value="${dto.getHouse_price() }"/>₩/박
					</td>
					<td style="text-align: center;"> ${dto.getHouse_person() } </td>
					<td style="text-align: center;"> ${dto.getHouse_star() } </td>
					<td style="text-align: center;"> ${dto.getHouse_update().substring(0,10) } </td>
					<td style="text-align: center;"> ${dto.getHouse_count() } </td>
			</c:forEach>	
		</c:if>
		<c:if test="${empty list }">
			<tr>
				<td colspan="8" align="center">
					<h3>등록하신 숙소가 없습니다.</h3>
				</td>
			</tr>		
		</c:if>
		<tr>
			<td colspan="8" align="center" id="write_btn">
				<input type="button" id="host_btns" class="host_btns" value="숙소 등록" onclick="location.href='host_write.do'">
			</td>
		</tr>
	</table>
	<br>	
</div>

<%-- ================================= 페이징 처리 영역 ================================= --%>
<div id="paging_box">	
	<c:if test="${page > block }">
		<a href="host_list.do?pcode=${member_code_session }&page=1">◀◀</a>
		<a href="host_list.do?pcode=${member_code_session }&page=${startBlock - 1 }">◀</a>
	</c:if>
  
	<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
		<c:if test="${i == page }">
			<b>
				<a href="host_list.do?pcode=${member_code_session }&page=${i }">[${i }]</a>
			</b>
		</c:if>
     
		<c:if test="${i != page }">
			<a href="host_list.do?pcode=${member_code_session }&page=${i }">[${i }]</a>
		</c:if>
	</c:forEach>
	<c:if test="${endBlock < allPage }">
		<a href="host_list.do?pcode=${member_code_session }&page=${endBlock + 1 }">▶</a>
		<a href="host_list.do?pcode=${member_code_session }&page=${allPage }">▶▶</a>
	</c:if>
</div>	
<%-- ================================ 페이징 처리 영역 end ================================ --%>
<jsp:include page="../include/bottom.jsp"/>
</body>
</html>