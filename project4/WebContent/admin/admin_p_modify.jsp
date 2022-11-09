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
	.input_box_domain {
		/* 둥근 입력창 스타일 */
		width: 110px;
		height: 30px;
		font-size: 15px;
		border: 0;
		border-radius: 5px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
		/* 둥근 입력창 스타일 끝 */
	}
	.input_box_gender {
		/* 둥근 입력창 스타일 */
		width: 210.5px;
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
		font-size: 25px;
	}
	#main {
		margin-top: 2%;
		margin-bottom: 3%;
		margin-left: 21%;
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
	.two_tr { padding-right: 10px; padding-left: 100px;}
	.title_text { padding-right: 10px; }
	.title_file { padding-right: 25px; }
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
		width: 65%;
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
<jsp:include page="../include/top2.jsp"/>
	<c:set var="dto" value="${p_modify }"/>
		<form method="post" action="<%=request.getContextPath() %>/admim_p_modify_ok.do">
			<div id="main">
				<div id="border">
				<div id="title">회원 정보 수정</div>
				<input type="hidden" name="pmember_code" value="${dto.getPmember_code() }">
				<br>
				
				<div id="sub_div_area1">
					<div class="sub_div">
						<span class="title_text">유저코드</span>
						<input style="margin-left: 19.2%" class="input_box" name="pmember_code" id="pmember_code" value="${dto.getPmember_code() }" readonly>
					</div>
				</div>
				
				<div id="sub_div_area1">
					<div class="sub_div">
						<span class="title_text">성</span>
						<input style="margin-left: 26.2%" class="input_box" name="pmember_firstname" id="pmember_firstname" value="${dto.getPmember_firstname() }">
					</div>
				</div>
				
				<div id="sub_div_area1">
					<div class="sub_div">
						<span class="title_text">이름</span>
						<input style="margin-left: 23.8%" class="input_box" name="pmember_lastname" id="pmember_lastname" value="${dto.getPmember_lastname() }">
					</div>
				</div>
				
				<div id="sub_div_area1">
					<div class="sub_div">
						<span class="title_text">생년월일</span>
						<input style="margin-left: 19.1%" class="input_box" name="pmember_birth" id="pmember_birth" value="${dto.getPmember_birth() }">
					</div>
				</div>
				
				<div id="sub_div_area1">
					<div class="sub_div">
						<span class="title_text">전화번호</span>
						<input style="margin-left: 19.1%" class="input_box" name="pmember_phone" id="pmember_phone" value="${dto.getPmember_phone() }">
					</div>
				</div>
				
				<div id="sub_div_area1">
					<div class="sub_div">
						<span class="title_text">이메일</span>
						<input style="margin-left: 21.4%" class="input_box" name="pmember_email" id="pmember_email" value="${dto.getPmember_email() }">
						@
						<select name="pmember_domain" class="input_box_domain">
							<option value="naver.com" <c:if test="${dto.getPmember_domain() == 'naver.com'}"> selected </c:if>>naver.com</option>
							<option value="gmail.com" <c:if test="${dto.getPmember_domain() == 'gmail.com'}"> selected </c:if>>gmail.com</option>
							<option value="daum.net" <c:if test="${dto.getPmember_domain() == 'daum.net'}"> selected </c:if>>daum.net</option>
						</select>
					</div>
				</div>
				
				<div id="sub_div_area1">
					<div class="sub_div">
						<span class="title_text">성별</span>
						<select style="margin-left: 23.7%" class="input_box_gender" name="pmember_gender" id="house_category">
							<option value="남자" <c:if test="${dto.getPmember_gender() == '남자'}"> selected </c:if>>남자</option>
							<option value="여자" <c:if test="${dto.getPmember_gender() == '여자'}"> selected </c:if>>여자</option>
							<option value="" <c:if test="${dto.getPmember_gender() == ''}"> selected </c:if>>선택안함</option>
						</select>
					</div>
				</div>
				
				<div id="sub_div_area1">
					<div class="sub_div">
						<span class="title_text">수정일</span>
						<input style="margin-left: 21.3%" class="input_box" name="pmember_date" id="pmember_date" value="${dto.getPmember_date().substring(0,10) }" readonly>
					</div>
				</div>
				
				<div id="sub_div_area1">
					<div class="sub_div">
						<span class="title_text">등급</span>
						<input style="margin-left: 23.6%" class="input_box" name="pmember_userlevel" id="pmember_userlevel" value="${dto.getPmember_userlevel() }" readonly>
					</div>
				</div>
	</div>
</div>
		<div id="sub_div_area7">
			<div class="sub_div">
				<input id="btn" type="submit" value="수정">&nbsp;&nbsp;&nbsp;
				<input id="btn" type="reset" value="다시작성">
			</div>
		</div>	
</form>
	<jsp:include page="../include/bottom.jsp"/>
</body>
</html>