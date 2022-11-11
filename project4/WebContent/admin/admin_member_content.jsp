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
	#sub_div_area1, #sub_div_area2 { margin-bottom: 20px; margin-left: 20%;}
	#sub_div_area3 { margin-top: 20px; margin-left: 20%; }
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
	#border {
		width: 50%;
		height: 50%;
		border: 2;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		border-color: rgb(233, 233, 233);
		border-style: solid;
		padding: 2%;
	}
</style>
</head>
<body>
<jsp:include page="../include/top.jsp"/>
		<c:set var="dto" value="${Cont }" />
		<div id="main">
		<div id="border">
			<div id="title">${dto.getPmember_firstname() }${dto.getPmember_lastname() }님 상세 내역	</div><br>	
			<div id="sub_div_area1">
				<div class="sub_div">
					<span class="title">코드</span>
					<input style="margin-left: 19.2%"  class="input_box" value="${dto.getPmember_code() }" readonly>
				</div>
			</div>
			
			<div id="sub_div_area2">
				<div class="sub_div">
					<span class="title">이름</span>
					<input style="margin-left: 19.2%"  class="input_box" value="${dto.getPmember_firstname() }${dto.getPmember_lastname() }" readonly>
				</div>
			</div>

			<div id="sub_div_area2">
				<div class="sub_div">
					<span class="title">성별</span>
					<input style="margin-left: 19.2%" class="input_box" value="${dto.getPmember_gender() }" readonly>
				</div>
			</div>
			
			<div id="sub_div_area2">
				<div class="sub_div">
					<span class="title">생년월일</span>
					<input style="margin-left: 12.3%" class="input_box" value="${dto.getPmember_birth() }" readonly>
				</div>
			</div>
			
			<div id="sub_div_area2">
				<div class="sub_div">
					<span class="title">전화번호</span>
					<input style="margin-left: 12.3%" class="input_box" value="${dto.getPmember_phone() }" readonly>
				</div>
			</div>
			
			<div id="sub_div_area2">
				<div class="sub_div">
					<span class="title">이메일</span>
					<input style="margin-left: 15.7%" class="input_box" value="${dto.getPmember_email() }@${dto.getPmember_domain() }" readonly>
				</div>
			</div>
			
			<div id="sub_div_area3">
				<div class="sub_div">
					<span class="title">가입일</span>
					<input style="margin-left: 15.7%" class="input_box" value="${dto.getPmember_date().substring(0,10) }" readonly>
				</div>
			</div>
			
			<div id="sub_div_area3">
				<div class="sub_div">
					<span class="title">등급</span>
					<input style="margin-left: 19.3%" class="input_box" value="${dto.getPmember_userlevel() }" readonly>
				</div>
			</div>
		</div>
			<div id="sub_div_area7">
				<div class="sub_div_btn">
					<input type="button" id="btn" value="수정" onclick="location.href='admin_p_update.do?no=${dto.getPmember_code()}'">
					<input type="button" id="btn" value="삭제" onclick="if(confirm('게시글을 삭제 하시겠습니까?')){
						location.href='admin_p_delete.do?no=${dto.getPmember_code()}'
					} else {return;}">
					<input type="button" id="btn" value="목록으로" onclick="location.href='admin_house_list.do'">
			</div>
		</div>
	</div>
	<jsp:include page="../include/bottom.jsp"/>
</body>
</html>