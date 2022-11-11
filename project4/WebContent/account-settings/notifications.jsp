<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="/project4/JS/notification.js"></script>

<link rel="stylesheet" href="/project4/CSS/notification.css">

</head>
<body>
	<jsp:include page="/include/top.jsp" />
	<div id="position" class="notifi_div">
		<nav aria-label="계정">
			<ol class="_1ckj08w">
				<li class="_36rlri">
					<span class="_121z06r2">
						<a href="account_settings.jsp" class="_sgg9wmi" aria-busy="false">계정</a>
					</span>
				</li>
				<li class="_36rlri">
					<div class="_36rlri" style="margin-left: 16px; margin-right: 16px;">
						<svg viewBox="0 0 18 18" role="presentation" aria-hidden="true" focusable="false" style="height: 10px; width: 10px; fill: rgb(118, 118, 118);">
							<path d="m4.29 1.71a1 1 0 1 1 1.42-1.41l8 8a1 1 0 0 1 0 1.41l-8 8a1 1 0 1 1 -1.42-1.41l7.29-7.29z" fill-rule="evenodd">
							</path>
						</svg>
					</div>
				</li>
				<li>
					<span aria-current="step" class="_121z06r2">알림</span>
				</li>
			</ol>
		</nav>
		<div>
			<br>
			<h2>알림</h2>
			<br> <br>
			<div>
				<table id="notice-table" width="700px">
				</table>
			</div>
		</div>
	</div>
	<div class="include-bottom">
		<jsp:include page="/include/bottom.jsp" />
	</div>
	<link rel="stylesheet" type="text/css" crossorigin="anonymous" href="https://a0.muscache.com/airbnb/static/packages/web/common/72f46196c8.css" media="all">
</body>
</html>