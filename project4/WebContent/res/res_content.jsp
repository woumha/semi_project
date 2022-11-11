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
	
	/* 수정중 */
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
		text-align: left;
		margin-top: 2%;
		font-size: 25px;
		margin-left: 2%;
	}
	#sub_cont {
		text-align: left;
		margin-top:1%;
		font-size: 15px;
		margin-bottom: 3%;
	}
	#main {
		margin-top: 2%;
		margin-bottom: 3%;
		margin-left: 18%;
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
	.sub_div_btn { margin-right: 35%; }
	.one_tr { padding-right: 10px;}
	.two_tr { padding-right: 10px; padding-left: 150px;}
	#btn {
		border: 0;
		width: 113px;
		height: 32px;
		border-radius: 5%;
		margin-left: 3%;
	}
	#btn:hover {
		background-color: #e85255;
		color: white;
		cursor: pointer;
	}
	#border_1 {
		width: 52%;
		display: inline-block;
		vertical-align: 75px;
	}
	#border_2 {
		width: 39%;
		display: inline-block;
		padding-bottom: 2%;
		margin-left: 3%;
	}
	#main_border {
		width: 75%;
		height: 50%;
		border: 2;
		border-radius: 5px;
		outline: none;
		border-color: rgb(233, 233, 233);
		border-style: solid;
		margin-left: 1%;
	}
	#left {
		display: inline-block;
		width: 35%;
		margin-left: 10%
	}
	#right {
		display: inline-block;
		width: 50%;
		margin-left: 10%
	}
	#left_cont {
		display: inline-block;
		margin-left: 10%
	}
	#arrow {
		display: inline-block;
		width: 18%;
	}
	#left_1 {
		display: inline-block;
		width: 30%;
	}
	
</style>
</head>
<body>
	<jsp:include page="../include/top.jsp"/>
		<c:set var="dto" value="${Cont }" />
		<div id="main">
			<div id="title">확정된 예약 : ${dto.getHouse_name() }</div><br>
	<div id="main_border">
		<div id="border_1">	
			<div id="left">
					체크인<br>
					<h3>${dto.getCheckin().substring(0,10) }</h3>
			</div>		
			<div id="arrow">
				<h1>></h1>
			</div>
			<div id="left_1">	
					️체크아웃<br>
					<h3>${dto.getCheckout().substring(0,10) }</h3>
			</div>
			<div align="center">
				<hr style="margin-top: 2%;" width="90%">
			</div>
				<div style="margin-top: 4%; margin-bottom: 2%;" id="left">
					<h3>게스트</h3>
			</div>
			<br>
			<c:set var="p_dto" value="${PCont }" />
				<div id="left_cont">
					<p id="sub_cont">예약자 : ${p_dto.getPmember_firstname() }${p_dto.getPmember_lastname() }</p>
					<p id="sub_cont">전화번호 : ${p_dto.getPmember_phone()}</p>
					<p id="sub_cont">이메일 : ${p_dto.getPmember_email()}@${p_dto.getPmember_domain() }</p>
					<p id="sub_cont">결제일 : ${dto.getCreated_date().substring(0,10) }</p>
				</div>
			</div>
			
		<div id="border_2">	
			<br>
				<div id="left_cont">
					<c:set var="h_dto" value="${HCont }" />
					<p><img src="<%=request.getContextPath() %>/upload/${h_dto.getHouse_img1() }" width="100%"></p>
					<p>${h_dto.getHouse_location() }</p>
					<p id="sub_cont" style="margin-top: 5%">호스트 이름 : ${h_dto.getHouse_owner() }</p>
					<p id="sub_cont">전화번호 : ${h_dto.getHouse_phone() }</p>
					<p id="sub_cont">요금 : ${dto.getprice() }</p>
				</div>		
		</div>
	</div>
</div>
			
			<c:if test="${empty dto }">
				<tr>
					<td colspan="2" align="center">
						<h3>조회된 게시물이 없습니다</h3>
					</td>
				</tr>
			</c:if>
			
			<div id="sub_div_area7">
				<div class="sub_div_btn">
					<input style="margin-left: 50%" id="btn" type="button" value="삭제"
				onclick="if(confirm('예약을 취소하시겠습니까?')) {location.href='res_delete.do?no=${dto.getId() }&pcode=${member_code_session }'
			}else { return; }">
					<input type="button" id="btn" value="목록" onclick="location.href='res_list.do?pcode=${member_code_session }'">
				</div>
			</div>
			
	<jsp:include page="../include/bottom.jsp"/>
</body>
</html>