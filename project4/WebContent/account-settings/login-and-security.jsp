<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 및 보안</title>
<link rel="stylesheet" href="/project4/CSS/security.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="/project4/JS/security.js"></script>
</head>
<body>
	<jsp:include page="/include/top.jsp" />
	<div id="position">
		<span class="topfont"><a href="<%=request.getContextPath()%>/account-settings.do">계정</a></span>
		&nbsp;
		<span class="topfont" style="margin-left: 16px; margin-right: 16px;">
			<svg viewBox="0 0 18 18" role="presentation" aria-hidden="true" focusable="false" style="height: 10px; width: 10px; fill: rgb(118, 118, 118);">
				<path d="m4.29 1.71a1 1 0 1 1 1.42-1.41l8 8a1 1 0 0 1 0 1.41l-8 8a1 1 0 1 1 -1.42-1.41l7.29-7.29z" fill-rule="evenodd"></path>
			</svg>
		</span>
		&nbsp;
		<span class="topfont">로그인 및 보안</span>
		<div>
			<div class="mainfont">로그인 및 보안</div>
			<div class="tabline">
				<button class="tabbtn">로그인</button>
				<hr>
			</div>
			<div class="logintab">로그인</div>
			<div>
				<span class="emailspan">이메일</span>
				<span class="updatespan">업데이트</span>
				<c:set var="day" value="${updateDay }" />
				<div id="updateday">
					<c:if test="${!empty day }">
						${day }
					</c:if>
					<c:if test="${empty day }">
						최근에 이메일을 변경하시지 않았습니다.
					</c:if>
				</div>
			</div>
			<br>
			<hr>
			<br>
			<div>
				<div>계정</div>
				<span>계정 비활성화</span>
				<span class="membershutdown">비활성화</span>
				<br>
				<hr>
			</div>
		</div>	
	</div>
	<jsp:include page="/include/bottom.jsp" />
	<link rel="stylesheet" type="text/css" crossorigin="anonymous" href="https://a0.muscache.com/airbnb/static/packages/web/common/72f46196c8.css" media="all">
</body>
</html>