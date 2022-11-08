<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불 요청하기</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<link rel="stylesheet" href="/project4/CSS/main_style.css">
<script src="/project4/JS/main_java2.js"> </script>

<link rel="stylesheet" href="/project4/CSS/top.css">
<script src="/project4/JS/main_java2.js"> </script>

<style type="text/css">
	#position {
		top: 300px;
		margin-left: 150px;
		line-height: 2em;
		
		width: 700px;
	}
	
	.cgcsmnv {
		padding-top: 40px;
	}
	
	.main-title {
		font-size: 24px;
		font-weight: bold;
	}
	
	.i1cqlwxc {
		border: 1px solid;
		border-radius: 10px;
	}
	
	svg {
		margin-top: 5px;
		float: left;
		color: lime;
	}
	
</style>
</head>
<body>
<div id="position">
	<jsp:include page="/include/top.jsp" />
	<div class="cgcsmnv dir dir-ltr">
		<div class="t9s5w55 su0g9gz dir dir-ltr">이용 방법</div>
		<div class="t9s5w55 su0g9gz dir dir-ltr">•</div>
		<div class="t9s5w55 dir dir-ltr">게스트</div>
	</div>
	<div class="main-title">
		<p>환불 요청하기</p>
	</div>
	<br>
	<div id="main-content">
		<p>숙박 전이나 후에 환불을 요청하는 경우에는 금액에 관계없이 해결 센터를 통해 진행할 수 있습니다.</p>
		<br>
		<p>해결 센터에 환불 요청을 제출하기 전에 에어비앤비 메시지 창에서 호스트와 환불에 대해 논의하시는 것이 좋습니다. 그러나 72시간 이내에 호스트와 합의에 이르지 못한 경우, 에어비앤비의 도움을 받아 해결 방안을 모색할 수 있습니다. 에어비앤비 재예약 및 환불 정책에 따라 문제 발견 후 72시간 이내에 에어비앤비에 신고해야 합니다.</p>
	</div>
	<div>
		<div class="caoewxn">
			<div class="i1cqlwxc">
				<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" style="display:block;height:16px;width:16px;fill:var(--fhi-qn-u)" aria-hidden="true" role="presentation" focusable="false">
					<path d="m15.5 1v8a5.5 5.5 0 0 0 5.279 5.496l.221.004h8v11.5a5 5 0 0 1 -5 5h-16a5 5 0 0 1 -5-5v-20a5 5 0 0 1 5-5zm4.5.586 8.414 8.414a2 2 0 0 1 .586 1.414v.086h-8a2.5 2.5 0 0 1 -2.495-2.336l-.005-.164v-8h.086a2 2 0 0 1 1.414.586z"></path>
					<strong>참고:</strong> 체크아웃 후 60일 이내에 해결 센터에 요청을 접수하셔야 합니다.
				</svg>
			</div>
		</div>
	</div>
	<br> <br>
	<div>
		<p>숙박 중 문제가 발생했다면 호스트에게 문제 시정, 환불 또는 예약 취소 및 전액 환불을 요청하실 수 있도록 에어비앤비에서 도와드리겠습니다. 문제를 발견한 후 24시간 이내에 요청을 제출하는 것이 중요합니다. 호스트는 게스트 요청에 1시간 내에 응답해야 하며, 호스트가 거절하거나 응답하지 않으면 게스트는 에어비앤비에 중재를 요청할 수 있습니다.</p>
	</div>
</div>
<link rel="stylesheet" type="text/css" crossorigin="anonymous" href="https://a0.muscache.com/airbnb/static/packages/web/common/72f46196c8.css" media="all">
	<jsp:include page="/include/bottom.jsp" />
</body>
</html>