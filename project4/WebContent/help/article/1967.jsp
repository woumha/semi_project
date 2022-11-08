<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불액 수령까지 걸리는 시간</title>
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
	#title {
		font-size: 25px;
	}
	
	#table1967 {
	  width : 600px;
	  height : 200px;
	}
	
	#why {
		top: 300px;
		margin-left: 300px;
		line-height: 2em;
	}
	
	ul, li {
		font-size: 15px;
	}
</style>
</head>
<body>
<jsp:include page="/include/top.jsp" />
<div id="why">
	<div class="cgcsmnv dir dir-ltr">
		<div class="t9s5w55 su0g9gz dir dir-ltr">이용 방법</div>
		<div class="t9s5w55 su0g9gz dir dir-ltr">•</div>
		<div class="t9s5w55 dir dir-ltr">게스트</div>
	</div>
	<div id="title"><strong>환불액 수령까지 걸리는 시간</strong></div>
	<div id="testdiv">
		<table id="table1967">
			<tr id="firstTr">
				<td id="firstTd">
					환불 요건을 충족할 경우, 10일 이내 또는 그보다 이른 시일 내에 환불액을 자동으로 수령하실 수 있습니다.
					에어비앤비에서는 예약 시 사용된 결제 수단으로 예약 취소 즉시 환불액을 지급합니다. 하지만 은행이나 신용카드 회사에서 이를 처리하는 데 시간이 필요하므로 결제 수단과 거주 지역에 따라 실제 수령까지는 시일이 다소 소요될 수 있습니다.
				</td>
			</tr>
			<tr>
				<td>
					<p><strong>24 시간</strong></p>
					<ul>
						<li>• 에어비앤비 비즈니스 프로그램 크레딧</li>
						<li>• 에이비앤비 기프트 크레딧</li>
						<li>• 홍바오(Hongbao) 크레딧</li>
						<li>• 페이팔</li>
					</ul>
					
					<p><strong>영업일 기준 하루</strong></p>
					<ul>
						<li>• 알리페이</li>
						<li>• 위챗페이</li>
					</ul>
					<p><strong>영업일 기준 최대 5일</strong></p>
					<ul>
						<li>• iDEAL</li>
						<li>• 은행 송금</li>
					</ul>
					<p><strong>영업일 기준 최대 15일</strong></p>
					<ul>
						<li>• 주요 신용카드(선불 신용, 직불카드 포함)</li>
						<li>• 기타 결제 수단</li>
						<li>• Apple Pay</li>
						<li>• Google Pay</li>
						<li>• Postepay</li>
					</ul>
					<p><strong>신용카드 명세서 발급월 기준 최대 2달</strong></p>
					<ul>
						<li>• Aura</li>
						<li>• Elo</li>
						<li>• Hipercard</li>
						<li>• 브라질에서 발급된 주요 신용카드</li>
					</ul>
					<strong>참고:</strong>&nbsp;기존 결제 수단의 계좌가 해지된 경우, 환불이 처리되지 않습니다. 이 경우 새로운 결제 수단을 추가하실 수 있도록 에어비앤비에서 연락을 드릴 것입니다.
				</td>
			</tr>
		</table>
	</div>
</div>
	<jsp:include page="/include/bottom.jsp" />
	<link rel="stylesheet" type="text/css" crossorigin="anonymous" href="https://a0.muscache.com/airbnb/static/packages/web/common/72f46196c8.css" media="all">
</body>
</html>