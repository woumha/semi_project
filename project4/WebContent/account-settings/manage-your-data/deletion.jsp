<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>내 정보 관리</title>
<!-- 모달 -->


<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="/project4/JS/deletion_javascript.js"></script>
<link rel="stylesheet" href="/project4/CSS/delete.css">

<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<jsp:include page="/include/top.jsp" />
	<div>
		<table>
			<tr id="showtr">
				<td>
					<h2>계정 삭제하기</h2>
					<div>
						개인정보 삭제 요청을 제출하세요. 
						계정 소유자임을 확인하기 위해 에어비앤비에서 이메일(<span id="emailId"></span>)로 연락드릴 수 있습니다. 
						이메일에 안내된 절차를 따르신 후에야 저희 측에서 요청을 진행할 수 있습니다.
					</div>
					<h4>계정 삭제 요청과 관련한 안내: </h4>
					<ul>
						<li>지난 60일 이내에 호스트 또는 게스트로서 체크아웃한 적이 있다면, 60일의 청구 기간이 경과할 때까지 삭제 요청이 처리되지 않습니다.</div>
						<li>요청이 처리되면 에어비앤비가 보유하고 있는 사용자의 모든 개인정보가 삭제됩니다. (단, <a href="https://www.airbnb.co.kr/help/article/2855">개인정보 보호정책</a>에 명시된 대로 법적으로 보관이 필수이거나 허용된 일부 정보는 제외)</li>
						<li>향후 에어비앤비를 다시 이용하려면 새 계정을 만드셔야 합니다.</li>
						<li>호스트나 게스트로서 예정된 예약이 있는 경우, 삭제 요청을 제출하기 전에 해당 호스트의 환불 정책에 따라 해당 예약을 먼저 취소해야 합니다. 취소 수수료가 발생할 수 있습니다. 예약 취소에 대한 자세한 내용은 <a href="https://www.airbnb.co.kr/help/topic/1367/%EC%98%88%EC%95%BD-%EC%B7%A8%EC%86%8C">도움말 센터</a>에서 확인하실 수 있습니다.</li>
					</ul>
				</td>
			</tr>
			<tr id="hiddentr">
				<td>
					<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 48px; width: 48px; display: block; fill: rgb(255, 180, 0);"><path d="m5.5 23.0034c.276 0 .5.224.5.5s-.224.5-.5.5-.5-.224-.5-.5.224-.5.5-.5zm12-19c1.381 0 2.5 1.119 2.5 2.5v10c0 1.381-1.119 2.5-2.5 2.5h-5.331l-5.086 3.853c-.22.167-.533.124-.7-.097-.167-.22-.123-.533.096-.7l5.22-3.954c.087-.067.193-.102.302-.102h5.499c.828 0 1.5-.672 1.5-1.5v-10c0-.829-.672-1.5-1.5-1.5h-15c-.829 0-1.5.671-1.5 1.5v10.091c0 .778.631 1.409 1.409 1.409h2.093c.276 0 .5.224.5.5s-.224.5-.5.5h-2.093c-1.33 0-2.409-1.078-2.409-2.409v-10.091c0-1.381 1.119-2.5 2.5-2.5z" fill="#484848"></path><path d="m17 6.0037c.553 0 1 .447 1 1v7c0 1.657-1.343 3-3 3h-3.488l-4.715 3.489c-.221.164-.535.117-.699-.105-.064-.085-.098-.19-.098-.297v-3.087h-3c-.552 0-1-.448-1-1v-7c0-1.657 1.343-3 3-3zm-6 5.611v-3.611c0-.553-.448-1-1-1s-1 .447-1 1v3.611c0 .552.448 1 1 1s1-.448 1-1zm-1 4.389c.552 0 1-.448 1-1 0-.553-.448-1-1-1s-1 .447-1 1c0 .552.448 1 1 1zm7.5-16.0037c.276 0 .5.22281167.5.49734748v2.00530504c0 .27453581-.224.49734748-.5.49734748-.275 0-.5-.22281167-.5-.49734748v-2.00530504c0-.27453581.225-.49734748.5-.49734748zm6.0021054 6.0127c.2748378 0 .4978946.224.4978946.5s-.2230568.5-.4978946.5h-2.0075108c-.2748378 0-.4978946-.224-.4978946-.5s.2230568-.5.4978946-.5zm-1.2111054-4.2822c.195.195.195.512 0 .707l-1.426 1.425c-.195.196-.511.196-.707 0-.195-.195-.195-.511 0-.707l1.426-1.425c.195-.195.512-.195.707 0z"></path></svg>				
		
					<div><h3>계정을 삭제하시겠어요?</h3></div>
			
					<div>계정 삭제를 요청하시면 더 이상 에어비앤비 계정을 사용하실 수 없으며, 계정이 영구적으로 해지됩니다.</div>
					
					<div>계정 사용을 일시적으로 중단하고 싶으시다면 에어비앤비 계정을 비활성화하실 수 있습니다.</div>
					
					<div><button id="closeMemeber">계정 비활성화</button></div>
					<!-- 비활성화 모달 -->
				</td>
			</tr>
		<jsp:include page="/include/deletion_bottom.jsp"></jsp:include>
		</table>
	</div>
	<jsp:include page="/include/bottom.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" crossorigin="anonymous" href="https://a0.muscache.com/airbnb/static/packages/web/common/72f46196c8.css" media="all">
</body>
</html>