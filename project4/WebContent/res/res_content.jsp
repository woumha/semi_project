<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h2 {
		margin-left: 18%;
		color: gray;
	}
	
	#check {
		display: flex;
	}
	
	#left {
		/* width: 8%;
		margin-left: 18%;
		float: left; */
		flex-basis: 7%;
		margin-left: 18%;
	}
	
	#arrow{
		/* width: 8%;
		overflow: hidden; */
		flex-basis: 3.5%;
	}
	
	#left_1 {
		/* overflow: hidden; */
		flex: 1;
	}
	
	#cont {
		width: 200px;
  		height: 32px;
  		font-size: 15px;
 		border: 0;
	  	border-radius: 15px;
  		outline: none;	
  		padding-left: 10px;
  		background-color: rgb(233, 233, 233);
	}
</style>
</head>
<body>
	<jsp:include page="../include/top.jsp"/>
		<c:set var="dto" value="${Cont }" />
			<br><h2>확정된 예약 : ${dto.getHouse_name() }</h2>
		<br>
	<div id="check">
		<div id="left">
				체크인<br>
				<h3>${dto.getCheckin().substring(0,10) }</h3>
		</div>
		<div id="arrow">
			<h1>➡</h1>
		</div>
		<div id="left_1">	
				️체크아웃<br>
				<h3>${dto.getCheckout().substring(0,10) }</h3>
		</div>
	</div>
			<tr>
				<th>요금</th>
				<td>${dto.getprice() }</td>
			</tr>
			<tr>
				<th>예약일</th>
				<td>${dto.getCreated_date().substring(0,10) }</td>
			</tr>
			
			<c:set var="h_dto" value="${HCont }" />
				<tr>
					<th>숙소 주인</th>
					<td>${h_dto.getHouse_owner() }</td>
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
					<input type="button" value="삭제"
						onclick="if(confirm('예약을 취소하시겠습니까?')) {location.href='res_delete.do?no=${dto.getId() }&pcode=${member_code_session }'
	                 }else { return; }">
				</td>
			</tr>
		</table>
	<jsp:include page="../include/bottom.jsp"/>
</body>
</html>