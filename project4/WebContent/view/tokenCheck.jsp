<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증 코드</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="JS/loginscript.js"></script>
<style type="text/css">

#email_token {

}

#email_token_text {
    margin-top: 30px;
    margin-bottom: 100px;
    font-size: 35px;
}

#formsubmit {
	margin-bottom: 150px;
}

#email_token_text2 {
    font-size: 20px;
    margin-bottom: 35px;
}

#inputToken {
	width: 200px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

#inputToken_box {

}

#ck {
}

#tokenCheck_icon {
	margin-top: 100px;
	text-align: center;
	width: 80px;
}

.main_btn {
	border: 0;
	width: 113px;
	height: 32px;
	margin-top: 35px;
	border-radius: 5%;
}
.main_btn:hover {
	background-color: #e85255;
	color: white;
	cursor: pointer;
}
#main_btn_box {
	text-align: center;
	margin-bottom: 250px;
}

</style>
</head>
<body>
<jsp:include page="../include/top.jsp"/>

	<div align="center" id="email_token">
		<img src="/project4/main_img/tokenCheck_icon.png" id="tokenCheck_icon">
		<p id="email_token_text">이메일 인증번호 입력하기</p>
		<c:set var="infor" value="${user }" />
		<form id="formsubmit" method="post" action="<%=request.getContextPath() %>/tokenCheck_ok.do">
			<p id="email_token_text2">${infor.getEmail() } 으로 보내드린 인증 코드를 입력하세요.</p>
			<br>
			<div id="inputToken_box">
				<input type="text" name="inputToken" id="inputToken" placeholder="인증번호를 입력해주세요.">
			</div>
			<span id="ck"></span>
		</form>
	</div>
	<div id="main_btn_box">
		<button class="main_btn" onclick="location.href='<%=request.getContextPath()%>/house_list.do'">메인으로</button>
	</div>
<jsp:include page="../include/bottom.jsp"/>
</body>
</html>