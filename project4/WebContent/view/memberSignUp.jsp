<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String mail = (String)session.getAttribute("membermail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="../JS/loginscript.js"></script>
<style type="text/css">

#email1  {
	float: none;
	width: 250px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
	margin-bottom: 15px;
}
#lname  {
	float: none;
	width: 150px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}
#fname  {
	float: none;
	width: 100px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
	margin-bottom: 15px;
}
#bir  {
	float: none;
	width: 200px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
	
}
#ph  {
	float: none;
	width: 200px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}
	
#signUp_title {
	margin-top: 130px;
    margin-bottom: 70px;
    font-size: 35px;
}

/* 입력 내용 박스 영역 */
#signUp_box {
	margin-left: 38%;
	margin-bottom: 240px;
}

#signUp_box > form > div {
	margin-bottom: 10px;
}

#signUp_box > form > p {
	margin-left: 10px;
	margin-bottom: 30px;
	font-size: 10px;
	color: gray;
}
#submit_btn {
	margin-top: 40px;
	margin-left: 185px;
}
#signUpbtn {
	text-align: center;
    border: 0;
    width: 120px;
    height: 32px;
    margin-top: 35px;
    border-radius: 5%;
}
#signUpbtn:hover {
	background-color: #e85255;
	color: white;
	cursor: pointer;
}
	
</style>
</head>
<body>
<jsp:include page="../include/top.jsp"/>

	<div align="center" id="signUp_title">
		<p>회원 가입 완료하기</p>
		<hr width="25%">
	</div>
	<div id="signUp_box">
		<form method="post" id="inform" name="inform" action="<%=request.getContextPath() %>/signUp.do">
			<input type="hidden" id="hide_email" name="hide_email" value="<%=mail %>">
			<div>
				<input type="text" id="email1" class="field" name="email" placeholder="<%=mail %>" readonly>
			</div>
			<div>
				<input type="text" id="lname" class="field" name="lastname" placeholder="이름 (예:길동)">
			</div>
			<div>
				<input type="text" id="fname" class="field" name="firstname" placeholder="성 (예: 홍)">
			</div>
			<div>
				<input type="text" id="bir" class="field" name="birth" placeholder="생년월일 (19900101)">
			</div>
			<p>만 18세 이상의 성인만 회원으로 가입할 수 있습니다. 생일은 다른 회원에게 공개되지 않습니다.</p>
			<div>
				<input type="text" id="ph" class="field" name="phone" placeholder="핸드폰 번호">
			</div>
			<p>예약 확인과 영수증을 이메일로 보내드립니다.</p>
			<div id="submit_btn">
				<input type="submit" id="signUpbtn" name="signUpbtn" value="동의 및 계속하기">
			</div>
		</form>		
	</div>
	
<jsp:include page="../include/bottom.jsp"/>	
</body>
</html>