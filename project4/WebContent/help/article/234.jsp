<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상태 확인하기</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet" href="/project4/CSS/main_style.css">
<script src="/project4/JS/main_java2.js"> </script>

<link rel="stylesheet" href="/project4/CSS/top.css">
<script src="/project4/JS/main_java2.js"> </script>

<style type="text/css">
	
	.position {
		top: 300px;
		margin-left: 150px;
		line-height: 2em;
		
		width: 700px;
	}
	
	.cgcsmnv {
		padding-left: 200px;
	}
	
	#title {
		font-size: 24px;
		font-weight: bold;
	}
	
	#middle-title {
		font-size: 18px;
		font-weight: bold;
	}
	
</style>
</head>
<body>
<jsp:include page="/include/top.jsp" />
<br>
<div class="position">
		<div class="cgcsmnv dir dir-ltr">
			<div class="t9s5w55 su0g9gz dir dir-ltr">이용 방법</div>
			<div class="t9s5w55 su0g9gz dir dir-ltr">•</div>
			<div class="t9s5w55 dir dir-ltr">게스트</div>
		</div>
		<div id="title" class="position">
			예약 상태 확인하기
		</div>
		<br>
		<div class="position">
			예약 상태는 예약 확정 여부 또는 본인 인증 및 후기 작성 필요 여부 등 모든 종류의 최신 정보를 알려줍니다. 예약 상태를 확인하려면, 메시지함에서 호스트와 주고받은 메시지를 확인하거나 여행으로 이동해서 여행 계획 더 보기를 클릭하거나 누른 다음 세부 정보 보기를 누르세요.
			<br><br>
			확정됨 상태는 예약이 완료되었음을 의미합니다!해당 내용은 이메일과 함께 문자 메시지(SMS) 및 앱 푸시 알림을 통해 안내받으실 수 있습니다. 설정 확인하기
			<p>
			<a href="#">다른 상태 메세지의 의미를 알아보세요.</a>
		</div>
		<br>
		<div>
			<div class="position" id="middle-title">
				즉시 예약vs.예약 요청:진행 절차 
			</div>
			<div class="position" id="middle-story">
				즉시 예약 숙소의 경우, 예약이 자동으로 확정됩니다. 
				예약 요청 버튼을 눌렀다면, 호스트는 24시간 이내에 응답해야 합니다. 
				호스트가 거절하거나 응답하지 않아도 걱정하지 마세요. 
				요금이 청구되지 않으며 다른 숙소를 예약하실 수 있습니다. 
				어느 쪽이든 결제 정보 및 신분증 정보(일부 호스트 요구사항)가 유효하도록 최신 상태로 유지하세요.
			</div>
		</div>
</div>
<link rel="stylesheet" type="text/css" crossorigin="anonymous" href="https://a0.muscache.com/airbnb/static/packages/web/common/72f46196c8.css" media="all">
<jsp:include page="/include/bottom.jsp" />
</body>
</html>